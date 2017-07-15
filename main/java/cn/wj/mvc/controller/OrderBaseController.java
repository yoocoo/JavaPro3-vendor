package cn.wj.mvc.controller;

import cn.wj.domain.Factory;
import cn.wj.domain.OrderBase;
import cn.wj.domain.ResponseObj;
import cn.wj.domain.Vendor;
import cn.wj.service.serviceImpl.FactoryServiceImpl;
import cn.wj.service.serviceImpl.OrderBaseServiceImpl;
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
import java.util.List;

/**
 * 说明： 售货机订单实时数据
 * 作者： 王娇
 * 时间： 2017 年 07 月 14 日
 */
@Controller
@RequestMapping("/orderAction")
public class OrderBaseController {
	//注入service 对象
	@Autowired
	private OrderBaseServiceImpl orderBaseService;//自动载入 售货机订单表格Service对象
	@Autowired
	private VendorServiceImpl vendorService;//自动载入 售货机表格Service对象
	@Autowired//这里是重点,spring事务管理时,那就一定要加上注解
	private FactoryServiceImpl factoryService;//载入 生产商Service对象
	private ResponseObj responseObj;


	/**
	 * 说明：接受 生产商管理员售货机 订单列表数据的页面
	 * 创建日期： 2017 年 07 月 14 日
	 * 创建者： 王娇
	 *
	 * @param request
	 * @param orderBase
	 * @return
	 */
	@RequestMapping(value = "listSorderPage")
	public ModelAndView listsorderpage(HttpServletRequest request, OrderBase orderBase) {
		ModelAndView view = new ModelAndView("vendor/sheng/vendor_sheng_ordercount");
		return view;
	}

	/**
	 * 时间： 2017 年 7 月  10  日
	 * 作者： 王娇
	 * 说明： 生产商管理员请求 所属的售货机列表
	 * 基于jquery DataTable API 插件 的分页
	 *
	 * @return
	 */
	@RequestMapping(value = "/shengOrder", method = RequestMethod.POST)
	public void PageInfoSorder(HttpServletRequest request,
							   HttpServletResponse response,
							   Vendor vendor, OrderBase orderBase, Factory factory,
							   @RequestParam(value = "offset", defaultValue = "0") Integer pageNum,
							   @RequestParam(value = "limit", defaultValue = "20") Integer pageSize) throws Exception {
		//使用DataTables的属性接收分页数据
		DataTablePageUtil<OrderBase> dataTable = new DataTablePageUtil<OrderBase>(request);
		//开始的分页：PageHelper会处理接下来的第一个查询
		PageHelper.startPage(dataTable.getPage_num(), dataTable.getPage_size());
		//还是使用List，方便后期用到

		String tableName = factory.getOrderTableName();
		System.out.println("===打印分页请求生产商的售货机订单表名的===:" + tableName);
		//int vId = vendor.getVendorId();
		//System.out.println("===打印分页请求生产商的售货机名称的  vId===" + vId);
		try {
			List<OrderBase> shengOrderList = orderBaseService.getAllShengOrder(tableName, 1, 20);
			//System.out.println("===打印分页请求=shengVendorList==" + shengVendorList);
			//用PageInfo对结果进行包装
			PageInfo<OrderBase> pageInfo = new PageInfo<OrderBase>(shengOrderList);
			System.out.println("===打印打印分页请求的 生厂商订单 pageInfo===" + pageInfo);
			//封装数据给DataTables
			dataTable.setDraw(dataTable.getDraw());
			System.out.println("===打印打印分页请求的 开始记录 dataTable.getDraw()===" + dataTable.getDraw());
			dataTable.setData(pageInfo.getList());
			System.out.println("===打印打印分页请求的 封装订单数据页面 pageInfo.getList()===" + pageInfo.getList());
			dataTable.setRecordsTotal(orderBaseService.getShengOrderCount(tableName));
			System.out.println("===打印打印分页请求的 总过滤数===" + orderBaseService.getShengOrderCount(tableName));
			//dataTable.setRecordsTotal((int) pageInfo.getTotal());
			dataTable.setRecordsFiltered(dataTable.getRecordsTotal());
			System.out.println("===打印打印分页请求的 setRecordsFiltered===" + dataTable.getRecordsTotal());
			//返回数据到页面
			try {
				response.setCharacterEncoding("UTF-8");
				response.setContentType("text/json");
				response.getWriter().write(new GsonUtils().toJson(dataTable));
				System.out.println("sheng-order-list 页面显示的数据=====" + new GsonUtils().toJson(dataTable));
				response.getWriter().flush();
				response.getWriter().close();
			} catch (IOException e) {
				e.printStackTrace();
			}


		}catch (Exception e) {
			e.printStackTrace();
		}


	}


}
