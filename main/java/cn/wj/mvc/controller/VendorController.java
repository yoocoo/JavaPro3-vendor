package cn.wj.mvc.controller;

import cn.wj.domain.ResponseObj;
import cn.wj.domain.*;
import cn.wj.service.serviceImpl.UserServiceImpl;
import cn.wj.service.serviceImpl.UserVendorServiceImpl;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;


/**
 * 功能说明：售货机相关业务逻辑接口处
 * 时间： 2017 年 7 月 10 日
 * 作者： 王娇
 */
@Controller
@RequestMapping("/vendorAction")
public class VendorController {
	//注入service 对象
	@Autowired
	private VendorServiceImpl vendorService;//自动载入 售货机表格Service对象
	@Autowired
	private UserVendorServiceImpl userVendorService;//自动载入 用户售货机分配 Service 对象
	@Autowired//这里是重点,spring事务管理时,那就一定要加上注解

	private UserServiceImpl userService;//自动载入 用户表格Service对象
	private ResponseObj responseObj;//封装 放到前端页面 数据


	@RequestMapping(value = "/shengRegVendor",
			method = RequestMethod.POST,
			produces = "application/json;charset=utf-8")
	@ResponseBody
	public Object shengRegVendor(HttpServletRequest request, HttpServletResponse response, Vendor vendor) throws Exception {
		Object result;
		responseObj = new ResponseObj<Vendor>();
		try {
			vendorService.shengAddVendor(vendor);
		} catch (Exception e) {
			e.printStackTrace();
			responseObj.setCode(ResponseObj.FAILED);
			responseObj.setMsg("其他的错误");
			result = new GsonUtils().toJson(responseObj);
			return result;
		}
		responseObj.setCode(ResponseObj.OK);
		responseObj.setMsg("恭喜，生产商注册售货机 成功");
		responseObj.setData(vendor);//
		System.out.println("===注册售货机信息=====" + vendor);// 只有注册时输入表单项数，其他在后台sql语句中赋了一定的初始值
		//vendor.setNextUrl(request.getContextPath() + "/mvc/home");//单独控制地址
		result = new GsonUtils().toJson(responseObj);
		result = result;
		return result;
	}

	/**
	 * 说明：接受 生产商管理员售货机列表数据的页面
	 * 创建日期： 2017 年 07 月 10 日
	 * 创建者： 王娇
	 *
	 * @param request
	 * @param vendor
	 * @return
	 */
	@RequestMapping(value = "listSvendorPage")
	public ModelAndView listsvendorpage(HttpServletRequest request, Vendor vendor) {

		ModelAndView view = new ModelAndView("vendor/vendor_sheng_list");
		//view.addObject("listpage", PageInfo(request, user, 1, 5));
		//System.out.println("页面接受检测=====" + PageInfo(request, user, 1, 5));
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
	@RequestMapping(value = "/listAllSVendor", method = RequestMethod.POST)
	public void PageInfoVendor(HttpServletRequest request,
							   HttpServletResponse response,
							   Vendor vendor,User user,
							   @RequestParam(value = "offset", defaultValue = "0") Integer pageNum,
							   @RequestParam(value = "limit", defaultValue = "10") Integer pageSize) {
		//使用DataTables的属性接收分页数据
		DataTablePageUtil<Vendor> dataTable = new DataTablePageUtil<Vendor>(request);
		//开始分页：PageHelper会处理接下来的第一个查询
		PageHelper.startPage(dataTable.getPage_num(), dataTable.getPage_size());
		//还是使用List，方便后期用到
		int fId = user.getFactoryId();
		//System.out.println("===打印分页请求生产商的 fId===" + fId);
		List<Vendor> shengVendorList = vendorService.getAllShengVendor(fId,1, 10);
		//System.out.println("===打印分页请求=shengVendorList==" + shengVendorList);
		//用PageInfo对结果进行包装
		PageInfo<Vendor> pageInfo = new PageInfo<Vendor>(shengVendorList);
		//System.out.println("===打印打印分页请求的 pageInfo===" + pageInfo);
		//封装数据给DataTables
		dataTable.setDraw(dataTable.getDraw());
		//System.out.println("===打印打印分页请求的 dataTable.getDraw()===" + dataTable.getDraw());
		dataTable.setData(pageInfo.getList());
		//System.out.println("===打印打印分页请求的 pageInfo.getList()===" + pageInfo.getList());
		dataTable.setRecordsTotal(vendorService.getAllCount(fId));
		//System.out.println("===打印打印分页请求的 setRecordsTotal===" + vendorService.getAllCount(fId));
		//dataTable.setRecordsTotal((int) pageInfo.getTotal());
		dataTable.setRecordsFiltered(dataTable.getRecordsTotal());
		//System.out.println("===打印打印分页请求的 setRecordsFiltered===" + dataTable.getRecordsTotal());
		//返回数据到页面
		try {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/json");
			response.getWriter().write(new GsonUtils().toJson(dataTable));
			System.out.println("sheng-vendor-list 页面显示的数据=====" + new GsonUtils().toJson(dataTable));
			response.getWriter().flush();
			response.getWriter().close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 时间： 2017 年 7 月 10 日
	 * 说明：   系统管理员，运营商管理员，生产商管理员 冻结 可疑的售货机
	 *
	 * @param request
	 * @param response
	 * @param vendor
	 * @return
	 */
	@RequestMapping(value = "/listSVendorRemove", method = RequestMethod.POST)
	public Object RemoveVendor(HttpServletRequest request,
							   HttpServletResponse response,
							   Vendor vendor) throws Exception {
		Object result;
		responseObj = new ResponseObj<Vendor>();
		//冻结 异常账户
		try {
			int vendorId = vendor.getVendorId();
			//System.out.println("-=====7.7打印要冻结账户ID:" + vendorId);
			vendorService.ShengRemoveVendor(vendorId);
		} catch (Exception e) {
			e.printStackTrace();
			responseObj.setCode(ResponseObj.FAILED);
			responseObj.setMsg("冻结 的异常 售货机失败，其他错误");
			result = new GsonUtils().toJson(responseObj);
			return result;
		}
		responseObj.setCode(ResponseObj.OK);
		responseObj.setMsg("冻结异常售货机成功");
		responseObj.setData(vendor);
		//System.out.println("====7.7 打印冻结可疑售货机后 vendorInfo===" + vendor);
		result = new GsonUtils().toJson(responseObj);
		//System.out.println("=====打印result =" + result);
		result = result;
		return result;

	}

	/**
	 * 时间： 2017 年 7 月 10 日
	 * 说明：  系统管理员，运营商管理员，生产商管理员 通过  售货机信息
	 *
	 * @param request
	 * @param response
	 * @param vendor
	 * @return
	 */
	@RequestMapping(value = "/listSVendorPass", method = RequestMethod.POST)
	public Object PassVendor(HttpServletRequest request,
							 HttpServletResponse response,
							 Vendor vendor) throws Exception {
		Object result;
		responseObj = new ResponseObj<Vendor>();
		// 通过新注册账户信息 审核
		try {
			int vendorId = vendor.getVendorId();
			System.out.println("-=====7.7打印要冻结账户ID:" + vendorId);
			vendorService.shengPassVendor(vendorId);
		} catch (Exception e) {
			e.printStackTrace();
			responseObj.setCode(ResponseObj.FAILED);
			responseObj.setMsg("审核的新注册账户失败，其他错误");
			result = new GsonUtils().toJson(responseObj);
			return result;
		}
		responseObj.setCode(ResponseObj.OK);
		responseObj.setMsg("审核新注册账户成功");
		responseObj.setData(vendor);
		System.out.println("====7.7 打印审核的账户后 userInfo===" + vendor);
		result = new GsonUtils().toJson(responseObj);
		System.out.println("=====打印result =" + result);
		result = result;
		return result;
	}

	/**
	 * 说明：系统管理员接受 售货机列表数据的页面
	 * 创建日期： 2017 年 07 月 11 日
	 * 创建者： 王娇
	 *
	 * @param request
	 * @param vendor
	 * @return
	 */
	@RequestMapping(value = "listXvendorPage")
	public ModelAndView listxvendorpage(HttpServletRequest request, Vendor vendor) {

		ModelAndView view1 = new ModelAndView("vendor/vendor_xi_list");
		//view.addObject("listpage", PageInfo(request, user, 1, 5));
		//System.out.println("页面接受检测=====" + PageInfo(request, user, 1, 5));
		return view1;
	}

	/**
	 * 时间： 2017 年 7 月  10  日
	 * 作者： 王娇
	 * 说明： 系统管理员 基于jquery DataTable API 插件 的分页
	 *
	 * @return
	 */
	@RequestMapping(value = "/listAllXVendor", method = RequestMethod.POST)
	public void PageInfoVendor1(HttpServletRequest request,
							   HttpServletResponse response,
							   Vendor vendor,User user,
							   @RequestParam(value = "offset", defaultValue = "0") Integer pageNum,
							   @RequestParam(value = "limit", defaultValue = "10") Integer pageSize) {
		//使用DataTables的属性接收分页数据
		DataTablePageUtil<Vendor> dataTable = new DataTablePageUtil<Vendor>(request);
		//开始分页：PageHelper会处理接下来的第一个查询
		PageHelper.startPage(dataTable.getPage_num(), dataTable.getPage_size());
		//还是使用List，方便后期用到
		List<Vendor> xiVendorList = vendorService.getAllXiVendor(1,10);
		//System.out.println("===打印分页请求=shengVendorList==" + xiVendorList);
		//用PageInfo对结果进行包装
		PageInfo<Vendor> pageInfo = new PageInfo<Vendor>(xiVendorList);
		//System.out.println("===打印打印分页请求的 pageInfo===" + pageInfo);
		//封装数据给DataTables
		dataTable.setDraw(dataTable.getDraw());
		//System.out.println("===打印打印分页请求的 dataTable.getDraw()===" + dataTable.getDraw());
		dataTable.setData(pageInfo.getList());
		//System.out.println("===打印打印分页请求的 pageInfo.getList()===" + pageInfo.getList());
		dataTable.setRecordsTotal(vendorService.getAllXiCount());
		//System.out.println("===打印打印分页请求的 setRecordsTotal===" + vendorService.getAllXiCount());
		//dataTable.setRecordsTotal((int) pageInfo.getTotal());
		dataTable.setRecordsFiltered(dataTable.getRecordsTotal());
		//System.out.println("===打印打印分页请求的 setRecordsFiltered===" + dataTable.getRecordsTotal());

		//返回数据到页面
		try {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/json");
			response.getWriter().write(new GsonUtils().toJson(dataTable));
			System.out.println("xi-vendor-list 页面显示的数据=====" + new GsonUtils().toJson(dataTable));
			response.getWriter().flush();
			response.getWriter().close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}


	/**
	 * 说明：接受 生产商管理员售货机列表数据的页面
	 * 创建日期： 2017 年 07 月 10 日
	 * 创建者： 王娇
	 *
	 * @param request
	 * @param vendor
	 * @return
	 */
	@RequestMapping(value = "listYvendorPage")
	public ModelAndView listyvendorpage(HttpServletRequest request, Vendor vendor) {

		ModelAndView view2 = new ModelAndView("vendor/vendor_yun_list");
		//view.addObject("listpage", PageInfo(request, user, 1, 5));
		//System.out.println("页面接受检测=====" + PageInfo(request, user, 1, 5));
		return view2;
	}

	/**
	 * 时间： 2017 年 7 月  10  日
	 * 作者： 王娇
	 * 说明： 生产商管理员请求 所属的售货机列表
	 * 基于jquery DataTable API 插件 的分页
	 *
	 * @return
	 */
	@RequestMapping(value = "/listAllYVendor", method = RequestMethod.POST)
	public void PageInfoVendor2(HttpServletRequest request,
							   HttpServletResponse response,
							   Vendor vendor,User user,
							   @RequestParam(value = "offset", defaultValue = "0") Integer pageNum,
							   @RequestParam(value = "limit", defaultValue = "10") Integer pageSize) {
		//使用DataTables的属性接收分页数据
		DataTablePageUtil<Vendor> dataTable = new DataTablePageUtil<Vendor>(request);
		//开始分页：PageHelper会处理接下来的第一个查询
		PageHelper.startPage(dataTable.getPage_num(), dataTable.getPage_size());
		//还是使用List，方便后期用到
		int aId = user.getAgencyId();
		System.out.println("===打印分页请求运营商的 aId===" + aId);
		List<Vendor> yunVendorList = vendorService.getAllYunVendor(aId,1, 10);
		System.out.println("===打印分页请求=yunVendorList==" + yunVendorList);
		//用PageInfo对结果进行包装
		PageInfo<Vendor> pageInfo = new PageInfo<Vendor>(yunVendorList);
		System.out.println("===打印打印分页请求的 pageInfo===" + pageInfo);
		//封装数据给DataTables
		dataTable.setDraw(dataTable.getDraw());
		System.out.println("===打印打印分页请求的 dataTable.getDraw()===" + dataTable.getDraw());
		dataTable.setData(pageInfo.getList());
		System.out.println("===打印打印分页请求的 pageInfo.getList()===" + pageInfo.getList());
		dataTable.setRecordsTotal(vendorService.getAllYunCount(aId));
		System.out.println("===打印打印分页请求的 setRecordsTotal===" + vendorService.getAllCount(aId));
		//dataTable.setRecordsTotal((int) pageInfo.getTotal());
		dataTable.setRecordsFiltered(dataTable.getRecordsTotal());
		System.out.println("===打印打印分页请求的 setRecordsFiltered===" + dataTable.getRecordsTotal());
		//返回数据到页面
		try {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/json");
			response.getWriter().write(new GsonUtils().toJson(dataTable));
			System.out.println("yun-vendor-list 页面显示的数据=====" + new GsonUtils().toJson(dataTable));
			response.getWriter().flush();
			response.getWriter().close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}

