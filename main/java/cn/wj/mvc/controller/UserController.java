package cn.wj.mvc.controller;

import cn.wj.domain.*;
import cn.wj.service.serviceImpl.AgencyServiceImpl;
import cn.wj.service.serviceImpl.FactoryServiceImpl;
import cn.wj.service.serviceImpl.UserServiceImpl;
import cn.wj.utils.Datagrid;
import cn.wj.utils.GsonUtils;
import cn.wj.utils.StringUtils;
import com.sun.tools.internal.ws.processor.model.Model;
import com.sun.tools.internal.ws.processor.model.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 用户请求相关控制器
 * Created by ThinkPad on 2017/4/8.
 * Update by ThinkPad on 2017/4/24.
 */
@Controller
@RequestMapping("/userAction")
public class UserController extends BaseController {
	@Autowired//这里是重点,spring事务管理时,那就一定要加上注解
	//HTTP Status 500 - Request processing failed; nested exception is java.lang.NullPointerException
	private UserServiceImpl userService;//自动载入 用户表格Service对象
	@Autowired//这里是重点,spring事务管理时,那就一定要加上注解
	private AgencyServiceImpl agencyService;//载入 运营商Service对象
	@Autowired//这里是重点,spring事务管理时,那就一定要加上注解
	private FactoryServiceImpl factoryService;//载入 生产商Service对象
	private ResponseObj responseObj;

	@RequestMapping(value = "listpage")
	public ModelAndView listpage(HttpServletRequest request, User user) {
		ModelAndView view = new ModelAndView("user_system/sysuser_list_user");
		//view.addObject("listpage", PageInfo(request, user, 1, 5));
		//System.out.println("页面接受检测=====" + PageInfo(request, user, 1, 5));
		return view;
	}

	@RequestMapping(value = "/listAllUser",
			produces = "application/json;cahset=uft-8"
	)
	private void PageInfo(HttpServletRequest request, HttpServletResponse response, User user,
						  @RequestParam(value = "offset", defaultValue = "0") Integer pageNum,
						  @RequestParam(value = "limit", defaultValue = "5") Integer pageSize) {
		Datagrid datagrid = userService.getAllUserList(user, pageNum, pageSize);
		System.out.println("======控制台打印=====pageNum==========" + pageNum);
		System.out.println("=======控制台打印====pageSize=========" + pageSize);
		System.out.println("=======控制台打印====== result =datagrid============" + new GsonUtils().toJson(datagrid));
		try {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/json");
			response.getWriter().write(new GsonUtils().toJson(datagrid));
			response.getWriter().flush();
			response.getWriter().close();
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	/**
	 * ModelAndView 代表一个web 页面(初期页面跳转4.1)
	 * setViewName 代表  e 设置一个JSP页面的名称
	 * 这是个 创建用户的模板
	 *
	 * @param response http响应
	 * @param user     发起请求后，spring接收到请求，然后封装的 bean 数据
	 * @return 返回一个 web页面
	 * @throws Exception
	 */
	@RequestMapping(value = "/reg",
			method = RequestMethod.POST,
			produces = "application/json;cahset=uft-8")
	@ResponseBody
	public Object reg(HttpServletRequest request, HttpServletResponse response, User user, HttpSession session) throws Exception {
		Object result;
		responseObj = new ResponseObj<User>();
		//ModelAndView mav = new ModelAndView();//创建一个jsp页面对象
		//mav.setViewName("home");//设置Jsp页面文件名
		if (null == user) {
			responseObj.setCode(ResponseObj.FAILED);
			responseObj.setMsg("用户信息不能为空");
			result = new GsonUtils().toJson(responseObj);
			return result;
			//mav.addObject("message","用户信息不能为空！");//加入提示信息
			//return mav;//返回页面
		}
		if (StringUtils.isEmpty(user.getAccountName()) || StringUtils.isEmpty(user.getPassword())) {
			responseObj.setCode(ResponseObj.FAILED);
			responseObj.setMsg("用户名或密码不能为空");
			result = new GsonUtils().toJson(responseObj);
			return result;
			//mav.addObject("message","用户名或密码不能为空！");
			//return  mav;
		}
		if (null != userService.findUser(user)) {
			responseObj.setCode(ResponseObj.FAILED);
			responseObj.setMsg("用户已存在");
			result = new GsonUtils().toJson(responseObj);
			return result;
			//mav.addObject("message","用户名已存在！");
			//return  mav;
		}
		try {
			userService.add(user);
		} catch (Exception e) {
			e.printStackTrace();
			responseObj.setCode(ResponseObj.FAILED);
			responseObj.setMsg("其他错误");
			result = new GsonUtils().toJson(responseObj);
			return result;
			//mav.addObject("message","错误，用户其他信息错误！");
			//return mav;
		}
		//userService.updateLoginSession(request.getSession().getId(),user.getAccountName());
		responseObj.setCode(ResponseObj.OK);
		responseObj.setMsg("注册成功");
		user.setPassword(session.getId());//单独设置
		user.setNextUrl(request.getContextPath() + "/mvc/home");//单独控制地址

		responseObj.setData(user);// 只有注册时输入表单项数（用户ID 自增的，用户名，用户密码（加密），电话）
		System.out.println("========" + user);// 只有注册时输入表单项数，其他在后台sql语句中赋了一定的初始值

		session.setAttribute("userInfo", user);//只有注册时输入表单项数（用户ID 自增的， 下一步地址，用户名，用户密码（加密），电话）
		System.out.println("======userInfo==" + user);//只有注册时输入表单项数（用户ID 自增的，下一步地址，用户名，用户密码（加密），电话）

		result = new GsonUtils().toJson(responseObj);
		result = result;
		//mav.addObject("code",110);
		//mav.addObject("message","恭喜注册成功！");
		//req.getSession().setAttribute("user",user);
		//return  mav;

		return result;
	}

	/**
	 * 统一的用户登录入口
	 *
	 * @param req
	 * @param user
	 * @return 返回一个 web页面
	 * @throws Exception
	 */
	@RequestMapping(value = "/login",
			method = RequestMethod.POST,
			produces = "application/json;charset=utf-8")
	@ResponseBody
	public Object login(HttpServletRequest request, @RequestParam(value = "accountName", required = true) String accountName, HttpServletResponse response, User user, HttpSession session) throws Exception {
		Object result;
		//ModelAndView mav = new ModelAndView();//创建一个jsp页面对象
		//mav.setViewName("home");//设置Jsp页面文件名
		//if(PublicUtil.isJsonRequest(request)){//确认是否JSON提交
		//	user = new GsonUtils().jsonRequest2Bean(request.getInputStream(),User.class);//转换成指定类型的对象
		//	return user.toString();
		//}
		if (null == user) {
			responseObj = new ResponseObj<User>();
			responseObj.setCode(ResponseObj.EMPUTY);
			responseObj.setMsg("登录信息不能为空");
			result = new GsonUtils().toJson(responseObj);
			return result;//返回页面 json
		}
		if (StringUtils.isEmpty(user.getAccountName()) || StringUtils.isEmpty(user.getPassword())) {
			responseObj = new ResponseObj<User>();
			responseObj.setCode(ResponseObj.FAILED);
			responseObj.setMsg("用户名或密码不能为空");
			result = new GsonUtils().toJson(responseObj);
			return result;
		}

		//查找用户
		User user1 = userService.findUser(user);
		//int user2 = userService.findUserInfo(user.getAccountName());
		//System.out.println("=====user 2" + user2);
		if (null == user1) {
			responseObj = new ResponseObj<User>();
			responseObj.setCode(ResponseObj.EMPUTY);
			responseObj.setMsg("未找到该用户");
			result = new GsonUtils().toJson(responseObj);
		} else {
			//==================(1)获取该登录用户的头像===============
			String userImagePath = userService.findPathById(accountName);
			//System.out.println("===测试打印图片原始路径======" + userImagePath);
			if (user.getPassword().equals(user1.getPassword())) {
				user1.setPassword(session.getId());
				//================(2)5.12  做权限菜单=================
				List<Menu> menuList = userService.getMenu(user1.getUserId());
				//=============重新组装menulist 到treelist =========
				List<Tree> treeList = new ArrayList<Tree>();
				{
					for (Menu menu : menuList) {//先便选出父亲结点
						Tree node = new Tree();
						if (menu.getParentId() == 0) {
							node.setId(menu.getMenuId());
							node.setPid(menu.getParentId());
							node.setText(menu.getMenuName());
							node.setIconCls(menu.getMenuIcon());
							if (menu.getCountChildrens() > 0) { // 有子节点
								//node.setState("closed");
							}
							Map<String, Object> attr1 = new HashMap<String, Object>();
							attr1.put("url", menu.getMenuUrl());
							node.setAttributes(attr1);
							List<Tree> childernList = new ArrayList<Tree>();
							for (Menu newMenu : menuList) {
								// 选中父节点后，再遍历选出它对应的子节点，并将它放入list<tree> children中
								Tree newnode = new Tree();
								if ((newMenu.getParentId() != 0)
										&& (newMenu.getParentId().equals(menu.getMenuId()))) { // 有父节点
									newnode.setId(newMenu.getMenuId());
									newnode.setPid(newMenu.getParentId());
									newnode.setText(newMenu.getMenuName());
									newnode.setIconCls(newMenu.getMenuIcon());
									Map<String, Object> attr2 = new HashMap<String, Object>();
									attr2.put("url", newMenu.getMenuUrl());
									newnode.setAttributes(attr2);
									childernList.add(newnode);
								}
							}
							node.setChildren(childernList);
							treeList.add(node);
						} else {
							//break; 我break 你妹啊
						}
					}
				}
//				=========================================分主次的权限菜单==五月十四日============================================================================================
				user1.setNextUrl(request.getContextPath() + "/mvc/home");
				responseObj = new ResponseObj<User>();
				responseObj.setCode(ResponseObj.OK);
				responseObj.setMsg(ResponseObj.OK_STR);
				responseObj.setPath(userImagePath);
				//responseObj.setMenulist(menuList);//主要是从后台数据库中筛选出来的该用户的权限菜单 ，未拼接的
				//============================分主次的权限菜单=======================================
				responseObj.setTreelist(treeList);
				//System.out.println("===存入setTreelist,tree===" + treeList);//重新组装的权限菜单
				//============================分主次的权限菜单=======================================
				System.out.println("===打印登录时数据库中图片原始路径======" + userImagePath);
				//System.out.println("====打印出来该用户所有要显示的权限菜单menuList=======" + menuList);
				responseObj.setData(user1);//提取到数据库中该用户登录的所有的信息，（密码是加密）
				//userService.updateLoginSession(request.getSession().getId(), user.getAccountName());
				responseObj.setuserMessage(userService.findUser(user));
				System.out.println("====查找的用户的信息setData====" + user1);  //能打印用户所有信息（密码是加密）
				System.out.println("====查找的用户的信息setuserMessage====" + user1);  //能打印用户所有信息（密码是加密）
				session.setAttribute("userMess", userService.findUser(user));
				session.setAttribute("userInfo", user);//登录成功，将用户数据放入到Session中(只有用户名和密码)
				//session.setAttribute("menu", menuList);
				session.setAttribute("tree", treeList);
				System.out.println("===存入session信息,userController里面，tree===" + treeList);
				session.setAttribute("userPath", userImagePath);
				System.out.println("===存入session头像路径======" + userImagePath);
				System.out.println("===存入session信息,userInfo=====" + user);//只打印 用户名和密码（未加密）
				//System.out.println("===存入session信息,userInfo=====" + userMess);//只打印 用户名和密码（未加密）
				result = new GsonUtils().toJson(responseObj);
			} else {
				responseObj = new ResponseObj<User>();
				responseObj.setCode(ResponseObj.FAILED);
				responseObj.setMsg("用户密码错误");
				result = new GsonUtils().toJson(responseObj);
			}
		}
		return result;
	}

	/**
	 * 修改个人资料统一入口，修改个人资料
	 *
	 * @param request
	 * @param response
	 * @param user
	 * @param session
	 * @return
	 * @throws Exception
	 */

	@RequestMapping(value = "/update",
			method = RequestMethod.POST,
			produces = "application/json;charset=utf-8")
	@ResponseBody
	public Object update(HttpServletRequest request, HttpServletResponse response, User user, HttpSession session) throws Exception {
		Object result;
		responseObj = new ResponseObj<User>();
		if (null == user) {
			responseObj.setCode(ResponseObj.FAILED);
			responseObj.setMsg("用户信息不能为空");
			result = new GsonUtils().toJson(responseObj);
			return result;
		}
		if (StringUtils.isEmpty(user.getPassword())) {
			responseObj.setCode(ResponseObj.FAILED);
			responseObj.setMsg("用户名或密码不能为空");
			result = new GsonUtils().toJson(responseObj);
			return result;
		}
		//更新用户资料
		try {
			userService.update(user);
		} catch (Exception e) {
			e.printStackTrace();
			responseObj.setCode(ResponseObj.FAILED);
			responseObj.setMsg("其他错误");
			result = new GsonUtils().toJson(responseObj);
			return result;
		}
		responseObj.setCode(ResponseObj.OK);
		responseObj.setMsg("资料更新成功");
		user.setPassword(session.getId());//单独设置
		user.setNextUrl(request.getContextPath() + "/mvc/home");//单独控制地址
		responseObj.setData(user);
		session.setAttribute("userInfo", user);
		System.out.println("====更改资料后userInfo===" + user);

		result = new GsonUtils().toJson(responseObj);
		result = result;
		return result;

	}


	/**
	 * 修改个人头像
	 * 创建上传头像接口
	 * 在登录的窗口已经实现 动态显示用户头像
	 * 注册时使用 初始头像
	 * 更新完善日期：6.11
	 *
	 * @param file
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/uploadHeadPic"
			, method = RequestMethod.POST
			, produces = "application/json; charset=utf-8")
	@ResponseBody
	public Object uploadHeadPic(@RequestParam(required = false) MultipartFile file, HttpServletRequest request, HttpServletResponse response, User user, Factory factory, HttpSession session) throws Exception {
		//保存相对路径到数据库，，图片写入数据库
		Object result;
		responseObj = new ResponseObj<User>();
		if (null == user) {
			responseObj.setCode(ResponseObj.FAILED);
			responseObj.setMsg("用户信息不能为空");
			result = new GsonUtils().toJson(responseObj);
			return result;
		}
		if (null == file || file.isEmpty()) {
			responseObj = new ResponseObj();
			responseObj.setCode(ResponseObj.FAILED);
			responseObj.setMsg("文件不能为空");
			return new GsonUtils().toJson(responseObj);
		}

		//获取新上传头像地址
		String fileName = file.getOriginalFilename();
		// 获取图片的扩展名
		String extensionName = fileName.substring(fileName.lastIndexOf(".") + 1);
		// 新的图片文件名 = 本地静态资源目录+上传的文件原名
		String newFileName = "/ssm_vendor/" + "static" + "/" + "images" + "/" + fileName;
		System.out.println("新上传文件组合出来的文件名字==" + newFileName);
		responseObj.setCode(ResponseObj.OK);
		responseObj.setMsg("头像上传成功");
		responseObj.setMsg("文件原名为：" + file.getOriginalFilename());
		responseObj.setMsg("文件长度为：" + file.getSize());
		responseObj.setfileName(fileName);
		responseObj.setData(user);
		session.setAttribute("userinfo", user);
		session.setAttribute("file", fileName);
		System.out.println("===存入session信息,新上传的新头像地址===" + fileName);
		System.out.println("===存入session信息,修改头像后userinfo===" + user);
		//更新用户头像
		//String userImagePath = userService.findPathById(accountName);
		//更新用户资料
		try {
			String name1 = user.getAccountName();
			System.out.println("得到用户名==" + name1);
			//String name = String.valueOf(userService.findUserInfo(user.getAccountName()));
			userService.updateImage(newFileName, name1);
			factoryService.updateFactoryImage(newFileName, name1);
		} catch (Exception e) {
			e.printStackTrace();
			responseObj.setCode(ResponseObj.FAILED);
			responseObj.setMsg("其他错误");
			result = new GsonUtils().toJson(responseObj);
			return result;
		}
		return new GsonUtils().toJson(responseObj);
	}

	/**
	 * value = "/sysuserResYun"  创建二级用户的 统一入口， 也是创建运营商管理员的入口
	 * 系统管理员 创建一级管理用户(运营商），
	 * 受影响表格（用户表user表，运营商表格agency表，agencyId,账户名account_name唯一）
	 * 时间：5月25日
	 *
	 * @param request
	 * @param response
	 * @param user
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/sysuserResYun"
			, method = RequestMethod.POST
			, produces = "application/json;charset=utf-8")
	@ResponseBody
	public Object sysuserRes(HttpServletRequest request, HttpServletResponse response, User user, Agency agency, HttpSession session) throws Exception {
		Object result;
		responseObj = new ResponseObj<User>();

		if (null == user) {
			responseObj.setCode(ResponseObj.FAILED);
			responseObj.setMsg("用户信息不能为空");
			result = new GsonUtils().toJson(responseObj);
			return result;
		}
		if (StringUtils.isEmpty(user.getAccountName()) || StringUtils.isEmpty(user.getPassword())) {
			responseObj.setCode(ResponseObj.FAILED);
			responseObj.setMsg("用户名或密码不能为空");
			result = new GsonUtils().toJson(responseObj);
			return result;
		}
		if (null != userService.findUser(user)) {
			responseObj.setCode(ResponseObj.FAILED);
			responseObj.setMsg("用户已存在");
			result = new GsonUtils().toJson(responseObj);
			return result;
		}
		try {
			//int factoryId = factoryService.selectFactoryIdByName(accounName);

			agencyService.add(agency);
			String aName = agency.getAccountName();
			int aId = agency.getAgencyId();
			System.out.println("===打印要增加的ID 子=====" + aId);// 打印要增加的ID 子
			System.out.println("===打印确定要重写 谁的 factory=====" + aName);// 打印谁要重写要增加的ID 子
			userService.sysuseraddYun(user);
			userService.updateAgencyId(aId, aName);
			//userService.addAgencyToFactoryId(user);

		} catch (Exception e) {
			e.printStackTrace();
			responseObj.setCode(ResponseObj.FAILED);
			responseObj.setMsg("其他错误====!!");
			result = new GsonUtils().toJson(responseObj);
			return result;
		}
		responseObj.setCode(ResponseObj.OK);
		responseObj.setMsg("注册运营商管理用户成功");
		user.setNextUrl(request.getContextPath() + "/mvc/home");//单独控制地址
		responseObj.setData(user);// 只有注册时输入表单项数（用户ID 自增的，用户名，用户密码（加密），电话）
		System.out.println("===注册管理用户信息=====" + user);// 只有注册时输入表单项数，其他在后台sql语句中赋了一定的初始值
		responseObj.setData(agency);
		session.setAttribute("agencyInfo", agency);//只有注册时输入表单项数
		System.out.println("======查看 新注册的 添加运营商表里的记录：agencyInfo==" + agency);
		System.out.println("======查看 新注册的 运营商ID,另外一种更新id方式 6.4号" + agency.getAgencyId());
		result = new GsonUtils().toJson(responseObj);
		result = result;
		return result;
	}

	/**
	 * 系统管理员  创建一级管理员用户（系统用户）,
	 * 受影响的表格 用户表
	 * date:2017.06.03
	 *
	 * @param request
	 * @param response
	 * @param user
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/sysuserResXi"
			, method = RequestMethod.POST
			, produces = "application/json;charset=utf-8")
	@ResponseBody
	public Object sysuserRes(HttpServletRequest request, HttpServletResponse response, User user, HttpSession session) throws Exception {
		Object result;
		responseObj = new ResponseObj<User>();
		if (null == user) {
			responseObj.setCode(ResponseObj.FAILED);
			responseObj.setMsg("用户信息不能为空");
			result = new GsonUtils().toJson(responseObj);
			return result;
		}
		if (StringUtils.isEmpty(user.getAccountName()) || StringUtils.isEmpty(user.getPassword())) {
			responseObj.setCode(ResponseObj.FAILED);
			responseObj.setMsg("用户名或密码不能为空");
			result = new GsonUtils().toJson(responseObj);
			return result;
		}
		if (null != userService.findUser(user)) {
			responseObj.setCode(ResponseObj.FAILED);
			responseObj.setMsg("用户已存在");
			result = new GsonUtils().toJson(responseObj);
			return result;
		}
		try {
			userService.sysuseradd(user);
		} catch (Exception e) {
			e.printStackTrace();
			responseObj.setCode(ResponseObj.FAILED);
			responseObj.setMsg("其他错误");
			result = new GsonUtils().toJson(responseObj);
		}
		responseObj.setCode(ResponseObj.OK);
		responseObj.setMsg("添加系统账户成功");
		responseObj.setData(user);// 只有注册时输入表单项数（用户ID 自增的，用户名，用户密码（加密），电话）
		user.setNextUrl(request.getContextPath() + "/mvc/home");//单独控制地址
		result = new GsonUtils().toJson(responseObj);
		return result;
	}

	/**
	 * 系统管理员 创建一级管理用户（生产商），
	 * 受影响表格（用户表user表，运营商表格factory表，Id,账户名account_name唯一）
	 * 时间：5月29日
	 * 更新日期 6.10
	 *
	 * @param request
	 * @param response
	 * @param user
	 * @param factory
	 * @param session
	 * @return result
	 * @throws Exception
	 */

	@RequestMapping(value = "/sysuserResSheng"
			, method = RequestMethod.POST
			, produces = "application/json;charset=utf-8")
	@ResponseBody
	public Object sysuserResSheng(HttpServletRequest request, HttpServletResponse response, User user, Factory factory, HttpSession session) throws Exception {
		Object result;
		responseObj = new ResponseObj<User>();
		if (null == user) {
			responseObj.setCode(ResponseObj.FAILED);
			responseObj.setMsg("用户信息不能为空");
			result = new GsonUtils().toJson(responseObj);
			return result;
		}
		if (StringUtils.isEmpty(user.getAccountName()) || StringUtils.isEmpty(user.getPassword())) {
			responseObj.setCode(ResponseObj.FAILED);
			responseObj.setMsg("用户名或密码不能为空");
			result = new GsonUtils().toJson(responseObj);
			return result;
		}
		if (null != userService.findUser(user)) {
			responseObj.setCode(ResponseObj.FAILED);
			responseObj.setMsg("用户已存在");
			result = new GsonUtils().toJson(responseObj);
			return result;
		}
		try {
			factoryService.add(factory);//生产商表添加记录
			userService.sysuseradd(user);//创建用户表（新的生产商）
			//6.13 版本，单独更新 id
			String fName = factory.getAccountName();
			int fId = factory.getFactoryId();
			System.out.println("===打印要增加的ID 子=====" + fId);// 打印要增加的ID 子

			System.out.println("===打印确定要重写 谁的 factory=====" + fName);// 打印谁要重写要增加的ID 子
			userService.updateFactoryId(fId, fName);// 补充用户表总 生产商的 ID 完整

			System.out.println("===打印要增加的ID 子=====" + factory.getFactoryId());// 打印要增加的ID 子

			//全部更新ID 6.10号的版本， 当创建运营商账户时，更新factory_id ，会出现清空错误。
			//userService.updateFactoryId(user);// 补充用户表总 生产商的 ID 完整

		} catch (Exception e) {
			e.printStackTrace();
			responseObj.setCode(ResponseObj.FAILED);
			responseObj.setMsg("其他错误====!!");
			result = new GsonUtils().toJson(responseObj);
			return result;
		}

		//user.setPassword(session.getId());//单独设置
		user.setNextUrl(request.getContextPath() + "/mvc/home");//单独控制地址
		responseObj.setData(user);// 只有注册时输入表单项数（用户ID 自增的，用户名，用户密码（加密），电话）
		System.out.println("===注册管理用户信息=====" + user);// 只有注册时输入表单项数，其他在后台sql语句中赋了一定的初始值

		responseObj.setData(factory);
		session.setAttribute("factoryInfo", factory);//只有注册时输入表单项数
		//String tableName = "order_"+factory.getFactoryId();
		//userService.createOrderTable(tableName);
		userService.createOrderTable("order_" + factory.getFactoryId().toString());//订单表名
		userService.createOrderTable("sale_" + factory.getFactoryId().toString());//销售表名
		userService.createOrderTable("cash_" + factory.getFactoryId().toString());//金钱表名
		userService.createOrderTable("cash_sale_" + factory.getFactoryId().toString());//金钱销售关联表名
		userService.createAlarmTable("alarm_" + factory.getFactoryId().toString());//金钱销售关联表名
		factoryService.updateFactoryTableName("order_" + factory.getFactoryId().toString(),
				"sale_" + factory.getFactoryId().toString(),
				"cash_" + factory.getFactoryId().toString(),
				"cash_sale_" + factory.getFactoryId().toString(),
				"alarm_" + factory.getFactoryId().toString(),
				factory.getAccountName());

		System.out.println("======查看 新注册的，添加生产商表里的记录：factoryInfo==" + factory);
		responseObj.setCode(ResponseObj.OK);
		responseObj.setMsg("注册生产商管理员用户成功");
		result = new GsonUtils().toJson(responseObj);
		result = result;
		return result;
	}
}
//public ModelAndView getUserList(HttpServletRequest request, HttpServletResponse response){
//	ModelAndView mav = new ModelAndView();//创建一个jsp页面对象
//	String currentpage  =  request.getParameter("sysuser_list_user");
//	//String result ;
//	PageObject<User> page;
//	Object listPage = mav.getModel().get("sysuser_list_user");
//	if (listPage == null){
//		page = new PageObject<>();
//		if(!("".equals(currentpage))&&currentpage != null){
//			page.setPage(Integer.parseInt(currentpage));
//		}
//	}else {
//		page = (PageObject<User>)  listPage;
//	//page = GsonUtils.gson.toJson(page);
//	}
//	mav.addObject("page",page);
//	//mav.addObject("contextPath",request.getContextPath());
//	mav.addObject("list",userService.getAllUserList(page));
//	mav.setViewName("/list");
//
//	return  mav;
//
//}