package cn.wj.mvc.controller;

import cn.wj.domain.GoodsInfo;
import cn.wj.domain.Groups;
import cn.wj.domain.ResponseObj;
import cn.wj.domain.User;
import cn.wj.service.serviceImpl.GoodsInfoServiceImpl;
import cn.wj.service.serviceImpl.GroupsServiceImpl;
import cn.wj.utils.DataTablePageUtil;
import cn.wj.utils.GsonUtils;
import cn.wj.utils.StringUtils;
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
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

//import cn.wj.utils.StringUtils;

/**
 * 功能说明： 商品管理业务实现
 * 时间： 2017 年 8 月 06 日
 * 作者： 王娇
 * 一更时间：
 *
 */
@Controller
@RequestMapping("/groupsAction")
public class GroupsController {
	//注入service对象
	@Autowired
	private GroupsServiceImpl groupsService;//自动载入 商品分组表格Service对象
	@Autowired
	private GoodsInfoServiceImpl goodsInfoService; //自动载入 商品信息表 Service 对象
	private ResponseObj responseObj;//封装 放到前端页面 数据

	/**
	 * 说明：接收 运营商 管理商品的页面
	 * 创建日期： 2017 年 08 月 06日
	 * 创建者： 王娇
	 * 一更时间：
	 * @param request
	 * @param groups
	 * @return
	 */
	@RequestMapping(value = "listYgoodsPage")
	public ModelAndView listsvendorpage(HttpServletRequest request, Groups groups) {
		ModelAndView view = new ModelAndView("vendor/yun/goods_yun_list");
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
	@RequestMapping(value = "/listYgoodsList", method = RequestMethod.POST)
	public void PageInfoVendor(HttpServletRequest request,
							   HttpServletResponse response, HttpSession session,
							   Groups groups, User user,
							   @RequestParam(value = "offset", defaultValue = "0") Integer pageNum,
							   @RequestParam(value = "limit", defaultValue = "10") Integer pageSize) throws Exception {
		int aId = user.getAgencyId();
		//使用DataTables的属性接收分页数据
		DataTablePageUtil<Groups> dataTable = new DataTablePageUtil<Groups>(request);
		//开始分页：PageHelper会处理接下来的第一个查询
		PageHelper.startPage(dataTable.getPage_num(), dataTable.getPage_size());
		//还是使用List，方便后期用到
		System.out.println("===日志打印前台接收数据查询的运营商ID:::===" + aId);
		List<Groups> yunGoodsList = groupsService.getYgoodsList(aId,1,10);
		//用PageInfo对结果进行包装
		PageInfo<Groups> pageInfo = new PageInfo<Groups>(yunGoodsList);
		//封装数据给DataTables
		dataTable.setDraw(dataTable.getDraw());
		dataTable.setData(pageInfo.getList());
		dataTable.setRecordsTotal(groupsService.getYgoodsCount(aId));
		//dataTable.setRecordsTotal((int) pageInfo.getTotal());
		dataTable.setRecordsFiltered(dataTable.getRecordsTotal());
		//返回数据到页面
		try {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/json");
			response.getWriter().write(new GsonUtils().toJson(dataTable));
			System.out.println(" 页面显示的数据=运营商商品管理列表：yunGoodsList====" + new GsonUtils().toJson(dataTable));
			response.getWriter().flush();
			response.getWriter().close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}


	/**
	 * 时间：2017 年 08 月 07 日
	 * 功能说明：运营商管理员 修改商品信息
	 * 作者：王娇
	 * @param request
	 * @param response
	 * @param session
	 * @param groups
	 * @param goodsInfo
	 * @return
	 */
	@RequestMapping(value = "/editGoodsList",
			method = RequestMethod.POST,
			produces = "application/json;charset=utf-8")
	@ResponseBody
	public Object updateInfo(HttpServletRequest request,
							   HttpServletResponse response, HttpSession session,
							   Groups groups, GoodsInfo goodsInfo){
		Object result;
		responseObj = new ResponseObj<GoodsInfo>();
		if (null == goodsInfo) {
			responseObj.setCode(ResponseObj.FAILED);
			responseObj.setMsg("商品信息不能为空");
			result = new GsonUtils().toJson(responseObj);
			return result;
		}
		//if (StringUtils.isEmpty(groups.getPassword())) {
		//	responseObj.setCode(ResponseObj.FAILED);
		//	responseObj.setMsg("用户名或密码不能为空");
		//	result = new GsonUtils().toJson(responseObj);
		//	return result;
		//}
		//更新商品信息
		try {
			goodsInfoService.updateGoodsInfo(goodsInfo);
		} catch (Exception e) {
			e.printStackTrace();
			responseObj.setCode(ResponseObj.FAILED);
			responseObj.setMsg("更新商品信息其他错误，请联系系统管理员");
			result = new GsonUtils().toJson(responseObj);
			return result;
		}
		responseObj.setCode(ResponseObj.OK);
		responseObj.setMsg("商品信息资料更新成功");
		//groups.setNextUrl(request.getContextPath() + "/mvc/home");//单独控制地址
		responseObj.setData(goodsInfo);
		System.out.println("====goodsInfo:===" + goodsInfo);
		result = new GsonUtils().toJson(responseObj);
		result = result;
		return result;
	}


	/**
	 * 时间：2017 年 08 月 07 日
	 * 功能说明：运营商管理员 修改商品分组信息
	 * 作者：王娇
	 * @param request
	 * @param response
	 * @param session
	 * @param groups
	 * @param goodsInfo
	 * @return
	 */
	@RequestMapping(value = "/editGroupList",
			method = RequestMethod.POST,
			produces = "application/json;charset=utf-8")
	@ResponseBody
	public Object updateGroupInfo(HttpServletRequest request,
							 HttpServletResponse response, HttpSession session,
							 Groups groups, GoodsInfo goodsInfo){
		Object result;
		responseObj = new ResponseObj<Groups>();
		if (null == groups) {
			responseObj.setCode(ResponseObj.FAILED);
			responseObj.setMsg("分组信息不能为空");
			result = new GsonUtils().toJson(responseObj);
			return result;
		}
		if (StringUtils.isEmpty(groups.getGroupName())) {
			responseObj.setCode(ResponseObj.FAILED);
			responseObj.setMsg("分组编码等信息不能为空");
			result = new GsonUtils().toJson(responseObj);
			return result;
		}
		//更新商品信息
		try {
			groupsService.updateGroupInfo(groups);
		} catch (Exception e) {
			e.printStackTrace();
			responseObj.setCode(ResponseObj.FAILED);
			responseObj.setMsg("更新分组信息其他错误，请联系系统管理员");
			result = new GsonUtils().toJson(responseObj);
			return result;
		}
		//responseObj.setCode(ResponseObj.OK);
		responseObj.setMsg("商品分组资料更新成功");
		//groups.setNextUrl(request.getContextPath() + "/mvc/home");//单独控制地址
		responseObj.setData(groups);
		System.out.println("====groups:===" + groups);
		result = new GsonUtils().toJson(responseObj);
		result = result;
		return result;
	}

}
