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
import java.sql.Timestamp;
import java.util.List;

//import java.util.Date;

//import java.sql.Date;

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
	 * 说明：接收 生产商管理员售货机 订单列表数据的页面
	 * 创建日期： 2017 年 07 月 14 日
	 * 创建者： 王娇
	 *
	 * @param request
	 * @param orderBase
	 * @return
	 */
	@RequestMapping(value = "listSorderPage")
	public ModelAndView listsorderpage(HttpServletRequest request, OrderBase orderBase) throws Exception {
		//public ModelAndView listsorderpage(HttpServletRequest request, OrderBase orderBase,Vendor vendor,Factory factory) throws Exception {
		ModelAndView view = new ModelAndView("vendor/sheng/vendor_sheng_ordercount");
		//view.addObject("listvendorName", getvendorName(request,vendor,factory));
		return view;
	}


	/**
	 * 时间： 2017 年 7 月  14  日
	 * 作者： 王娇
	 * 说明： 生产商管理员请求 所属的所有的 售货机列表
	 * 基于jquery DataTable API 插件 的分页
	 *
	 * @return
	 */
	@RequestMapping(value = "/shengOrder", method = RequestMethod.POST)
	public void PageInfoSorder(HttpServletRequest request,
							   HttpServletResponse response,
							   Vendor vendor, OrderBase orderBase, Factory factory,
							   @RequestParam(value = "offset", defaultValue = "0") Integer pageNum,
							   @RequestParam(value = "limit", defaultValue = "10") Integer pageSize) throws Exception {
		//使用DataTables的属性接收分页数据
		DataTablePageUtil<OrderBase> dataTable = new DataTablePageUtil<OrderBase>(request);
		//开始的分页：PageHelper会处理接下来的第一个查询
		PageHelper.startPage(dataTable.getPage_num(), dataTable.getPage_size());
		//还是使用List，方便后期用到

		String tableName = factory.getOrderTableName();
		System.out.println("===打印分页请求生产商的售货机订单表名的===:" + tableName);
		try {
			List<OrderBase> shengOrderList = orderBaseService.getAllShengOrder(tableName, 1, 10);
			//用PageInfo对结果进行包装
			PageInfo<OrderBase> pageInfo = new PageInfo<OrderBase>(shengOrderList);
			//System.out.println("===打印打印分页请求的 生厂商订单 pageInfo===" + pageInfo);
			//封装数据给DataTables
			dataTable.setDraw(dataTable.getDraw());
			dataTable.setData(pageInfo.getList());
			dataTable.setRecordsTotal(orderBaseService.getShengOrderCount(tableName));
			//dataTable.setRecordsTotal((int) pageInfo.getTotal());
			dataTable.setRecordsFiltered(dataTable.getRecordsTotal());
			//返回数据到页面
			try {
				response.setCharacterEncoding("UTF-8");
				response.setContentType("text/json");
				response.getWriter().write(new GsonUtils().toJson(dataTable));
				System.out.println("生产商 显示的订单列表中的数据页面显示的数据=====" + new GsonUtils().toJson(dataTable));
				response.getWriter().flush();
				response.getWriter().close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}


	}


	/**
	 * 时间： 2017 年 7 月  15 日
	 * 作者： 王娇
	 * 说明： 生产商管理员请求 所属的所有的 售货机列表
	 * 基于jquery DataTable API 插件 的分页
	 *
	 * @return
	 */
	@RequestMapping(value = "/shengOrderName", method = RequestMethod.POST)
	public void PageInfoSname(HttpServletRequest request,
							  HttpServletResponse response,
							  Vendor vendor, OrderBase orderBase, Factory factory,
							  @RequestParam(value = "offset", defaultValue = "0") Integer pageNum,
							  @RequestParam(value = "limit", defaultValue = "10") Integer pageSize) throws Exception {

		//使用DataTables的属性接收分页数据
		DataTablePageUtil<OrderBase> dataTable = new DataTablePageUtil<OrderBase>(request);
		//开始的分页：PageHelper会处理接下来的第一个查询
		PageHelper.startPage(dataTable.getPage_num(), dataTable.getPage_size());
		//还是使用List，方便后期用到
		//
		Timestamp startTime = orderBase.getCreatTime();
		Timestamp endTime = orderBase.getEndTime();
		System.out.println("===打印前台传过来时间 开始===:" + startTime);
		System.out.println("===打印前台传过来时间 结束===:" + endTime);
		String tableName = factory.getOrderTableName();
		System.out.println("===打印分页请求生产商的售货机订单表名的===:" + tableName);
		String vendorName = vendor.getVendorName();
		System.out.println("===打印页面传进来的vendorName ==" + vendorName);
		List<OrderBase> shengOrdernameList = orderBaseService.getAllShengOrderName(tableName, vendorName, startTime, endTime, 1, 10);
		System.out.println("===打印分页请求=shengVendorList==" + shengOrdernameList);
		//用PageInfo对结果进行包装
		PageInfo<OrderBase> pageInfo = new PageInfo<OrderBase>(shengOrdernameList);
		//封装数据给DataTables
		dataTable.setDraw(dataTable.getDraw());
		dataTable.setData(pageInfo.getList());
		System.out.println("===打印 查询条件（一） pageInfo.getList()===" + pageInfo.getList());
		dataTable.setRecordsTotal(orderBaseService.getShengOrderCountName(tableName, vendorName, startTime, endTime));
		//dataTable.setRecordsTotal((int) pageInfo.getTotal());
		dataTable.setRecordsFiltered(dataTable.getRecordsTotal());
		//返回数据到页面
		try {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/json");
			response.getWriter().write(new GsonUtils().toJson(dataTable));
			System.out.println("生产商订单条件查询一的结果=====" + new GsonUtils().toJson(dataTable));
			response.getWriter().flush();
			response.getWriter().close();
		} catch (IOException e) {
			e.printStackTrace();
		}


	}

}
