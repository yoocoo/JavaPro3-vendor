package cn.wj.mvc.controller;

import cn.wj.domain.CashBase;
import cn.wj.domain.Factory;
import cn.wj.domain.ResponseObj;
import cn.wj.domain.Vendor;
import cn.wj.service.serviceImpl.CashBaseServiceImpl;
import cn.wj.service.serviceImpl.FactoryServiceImpl;
import cn.wj.service.serviceImpl.VendorServiceImpl;
import cn.wj.utils.DataTablePageUtil;
import cn.wj.utils.GsonUtils;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;

/**
 * 说明： 售货机-- 现金表 实时数据
 * 作者： 王娇
 * 时间： 2017 年 07 月 20 日
 * 一更时间：  2017 年 07 月 * 日
 */
@Controller
@RequestMapping("/cashAction")
public class CashBaseController {
	@Autowired
	//注入Service 对象
	private CashBaseServiceImpl cashBaseService;//自动载入售货机销售表service对象
	@Autowired
	private VendorServiceImpl vendorService;//自动载入 售货机表格Service对象
	private FactoryServiceImpl factoryService;//载入 生产商Service对象
	private ResponseObj responseObj;
	/**
	 * 说明：接收 生产商管理员售货机 现金表 接收数据的页面
	 * 创建日期： 2017 年 07 月 20 日
	 * 创建者： 王娇
	 *
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "listScashPage")
	public ModelAndView listscashpage(HttpServletRequest request, CashBase cashBase) throws Exception {
		ModelAndView view = new ModelAndView("vendor/sheng/vendor_sheng_cashcount");
		return view;
	}
	/**
	 * 时间： 2017 年 7 月  18 日
	 * 作者： 王娇
	 * 说明： 生产商管理员  按归属条件 查询 销售表 数据（ 按时间段，按指定售货机）
	 * 基于jquery DataTable API 插件 的分页
	 *
	 * @return
	 */
	@RequestMapping(value = "/shengCashName", method = RequestMethod.POST)
	public void PageInfoSname(HttpServletRequest request,
							  HttpServletResponse response, HttpSession session,
							  Vendor vendor,CashBase cashBase, Factory factory,
							  @RequestParam(value = "offset", defaultValue = "0") Integer pageNum,
							  @RequestParam(value = "limit", defaultValue = "10") Integer pageSize) throws Exception {
		String tableName = factory.getCashTableName();
		String vendorName = vendor.getVendorName();
		System.out.println("===打印分页请求生产商的售货 现金表名的===:" + tableName);
		System.out.println("===打印页面传进来的vendorName ==" + vendorName);
		Timestamp startTime = cashBase.getCreatTime();
		Timestamp endTime = cashBase.getEndTime();
		System.out.println("===（ 按时间段，按指定售货机）打印前台传过来时间 开始===:" + startTime);
		System.out.println("===（ 按时间段，按指定售货机）打印前台传过来时间 结束===:" + endTime);
		//使用DataTables的属性接收分页数据
		DataTablePageUtil<CashBase> dataTable = new DataTablePageUtil<CashBase>(request);
		//开始的分页：PageHelper会处理接下来的第一个查询
		PageHelper.startPage(dataTable.getPage_num(), dataTable.getPage_size());
		//还是使用List，方便后期
		//========== 参数列表 start==============================================

		List<CashBase> shengCashNameList = cashBaseService.getAllShengCashName(tableName, vendorName, startTime, endTime, 1, 10);
		System.out.println("===打印分页请求现金表" + shengCashNameList);
		//用PageInfo对结果进行包装
		PageInfo<CashBase> pageInfo = new PageInfo<CashBase>(shengCashNameList);
		//封装数据给DataTables
		dataTable.setDraw(dataTable.getDraw());
		dataTable.setData(pageInfo.getList());
		System.out.println("===打印 查询条件（一） pageInfo.getList()===" + pageInfo.getList());
		dataTable.setRecordsTotal(cashBaseService.getShengCashCountName(tableName, vendorName, startTime, endTime));
		dataTable.setRecordsFiltered(dataTable.getRecordsTotal());
		//返回数据到页面
		try {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/json");
			response.getWriter().write(new GsonUtils().toJson(dataTable));
			System.out.println("生产商 双条件查询 现金表结果=====" + new GsonUtils().toJson(dataTable));
			response.getWriter().flush();
			response.getWriter().close();
		} catch (IOException e) {
			e.printStackTrace();
		}

//============录入数据库中，筛查 统计数值================================

		//BigDecimal inMoney = cashBaseService.getCashInMoney(tableName, vendorName,startTime, endTime);
		//BigDecimal outMoney = cashBaseService.getCashOutMoney(tableName, vendorName, startTime, endTime);

		//request.setAttribute("allMoney", inMoney);
		//request.setAttribute("timeMoney", outMoney);

		//response.getWriter().print(inMoney);
		//response.getWriter().print(outMoney);

		//System.out.println("=== 销售清单 统变量===:" + inMoney);
		//System.out.println("=== 销售清单 统计变量===:" + outMoney);


		//session.setAttribute("inMoney", inMoney);
		//session.setAttribute("outMoney", outMoney);
		//System.out.println("=== 销售清单 统计session变量===:" + inMoney);
		//System.out.println("=== 销售清单 统计session变量===:" + outMoney);

		//=======================================================================


	}

}
