package cn.wj.mvc.controller;

import cn.wj.domain.Factory;
import cn.wj.domain.ResponseObj;
import cn.wj.domain.SaleBase;
import cn.wj.domain.Vendor;
import cn.wj.service.serviceImpl.FactoryServiceImpl;
import cn.wj.service.serviceImpl.SaleBaseServiceImpl;
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
import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;

/**
 * 说明： 售货机-- 销售表 实时数据
 * 作者： 王娇
 * 时间： 2017 年 07 月 18 日
 */
@Controller
@RequestMapping("/saleAction")
public class SaleBaseController {
	@Autowired
	//注入Service 对象
	private SaleBaseServiceImpl saleBaseService;//自动载入售货机销售表service对象
	@Autowired
	private VendorServiceImpl vendorService;//自动载入 售货机表格Service对象
	private FactoryServiceImpl factoryService;//载入 生产商Service对象
	private ResponseObj responseObj;
	/**
	 * 说明：接收 生产商管理员售货机 销售表 接收数据的页面
	 * 创建日期： 2017 年 07 月 18 日
	 * 创建者： 王娇
	 *
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "listSslaePage")
	public ModelAndView listssalepage(HttpServletRequest request, SaleBase saleBase) throws Exception {
		ModelAndView view = new ModelAndView("vendor/sheng/vendor_sheng_salecount");
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
	@RequestMapping(value = "/shengSaleName", method = RequestMethod.POST)
	public void PageInfoSname(HttpServletRequest request,
							  HttpServletResponse response,
							  Vendor vendor, SaleBase saleBase, Factory factory,
							  @RequestParam(value = "offset", defaultValue = "0") Integer pageNum,
							  @RequestParam(value = "limit", defaultValue = "10") Integer pageSize) throws Exception {

		//使用DataTables的属性接收分页数据
		DataTablePageUtil<SaleBase> dataTable = new DataTablePageUtil<SaleBase>(request);
		//开始的分页：PageHelper会处理接下来的第一个查询
		PageHelper.startPage(dataTable.getPage_num(), dataTable.getPage_size());
		//还是使用List，方便后期
		Timestamp startTime = saleBase.getCreatTime();
		Timestamp endTime = saleBase.getEndTime();
		System.out.println("===打印前台传过来时间 开始===:" + startTime);
		System.out.println("===打印前台传过来时间 结束===:" + endTime);
		String tableName = factory.getSaleTableName();
		System.out.println("===打印分页请求生产商的售货 销售表名的===:" + tableName);
		String vendorName = vendor.getVendorName();
		System.out.println("===打印页面传进来的vendorName ==" + vendorName);
		List<SaleBase> shengSalenameList = saleBaseService.getAllShengSaleName(tableName, vendorName, startTime, endTime, 1, 10);
		System.out.println("===打印分页请求=shengVendorList==" + shengSalenameList);
		//用PageInfo对结果进行包装
		PageInfo<SaleBase> pageInfo = new PageInfo<SaleBase>(shengSalenameList);
		//System.out.println("===打印打印分页请求的 生厂商订单 pageInfo===" + pageInfo);
		//封装数据给DataTables
		dataTable.setDraw(dataTable.getDraw());
		//System.out.println("===打印打印分页请求的 开始记录 dataTable.getDraw()===" + dataTable.getDraw());
		dataTable.setData(pageInfo.getList());
		System.out.println("===打印 查询条件（一） pageInfo.getList()===" + pageInfo.getList());
		dataTable.setRecordsTotal(saleBaseService.getShengSaleCountName(tableName, vendorName, startTime, endTime));
		//dataTable.setRecordsTotal((int) pageInfo.getTotal());
		dataTable.setRecordsFiltered(dataTable.getRecordsTotal());
		//返回数据到页面
		try {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/json");
			response.getWriter().write(new GsonUtils().toJson(dataTable));
			System.out.println("生产商 双条件查询 销售表结果=====" + new GsonUtils().toJson(dataTable));
			response.getWriter().flush();
			response.getWriter().close();
		} catch (IOException e) {
			e.printStackTrace();
		}


	}

}
