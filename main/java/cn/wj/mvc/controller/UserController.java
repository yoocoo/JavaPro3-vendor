package cn.wj.mvc.controller;

import cn.wj.domain.*;
import cn.wj.service.serviceImpl.AgencyServiceImpl;
import cn.wj.service.serviceImpl.FactoryServiceImpl;
import cn.wj.service.serviceImpl.UserServiceImpl;
import cn.wj.service.serviceImpl.VendorServiceImpl;
import cn.wj.utils.DataTablePageUtil;
import cn.wj.utils.Datagrid;
import cn.wj.utils.GsonUtils;
import cn.wj.utils.StringUtils;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.omg.PortableInterceptor.SYSTEM_EXCEPTION;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
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
public class UserController {
	@Autowired//这里是重点,spring事务管理时,那就一定要加上注解
	//HTTP Status 500 - Request processing failed; nested exception is java.lang.NullPointerException
	private UserServiceImpl userService;//自动载入 用户表格Service对象
	@Autowired//这里是重点,spring事务管理时,那就一定要加上注解
	private AgencyServiceImpl agencyService;//载入 运营商Service对象
	@Autowired//这里是重点,spring事务管理时,那就一定要加上注解
	private FactoryServiceImpl factoryService;//载入 生产商Service对象
	@Autowired
	private VendorServiceImpl vendorService;//自动载入 售货机表格Service对象
	private ResponseObj responseObj;

	/**
	 * 说明：接受 用户列表数据的页面
	 * 创建日期： 2017 年 06 月 24 日
	 * 创建者： 王娇
	 *
	 * @param request
	 * @param user
	 * @return
	 */
	@RequestMapping(value = "listUserPage")
	public ModelAndView listpage(HttpServletRequest request, User user) {
		ModelAndView view = new ModelAndView("user_system/sysuser_list_user");
		//view.addObject("listpage", PageInfo(request, user, 1, 5));
		//System.out.println("页面接受检测=====" + PageInfo(request, user, 1, 5));
		return view;
	}

	/**
	 * 时间： 2017 年 7 月 7 日
	 * 说明：  冻结新注册用户列表中用户
	 *
	 * @param request
	 * @param response
	 * @param user
	 * @return
	 */
	@RequestMapping(value = "/listAllUserRemove", method = RequestMethod.POST)
	public Object Remove(HttpServletRequest request,
						 HttpServletResponse response,
						 User user) throws Exception {
		Object result;
		responseObj = new ResponseObj<User>();
		//冻结 异常账户
		try {

			int userId = user.getUserId();
			//if (userId !=  1) {
			//	System.out.println("-=====7.7打印要冻结账户ID:" + userId);
			//	userService.removeUser(userId);
			//}
			System.out.println("-=====7.7打印要冻结账户ID:" + userId);
			userService.removeUser(userId);
		} catch (Exception e) {
			e.printStackTrace();
			responseObj.setCode(ResponseObj.FAILED);
			responseObj.setMsg("冻结异常账户失败，其他错误");
			result = new GsonUtils().toJson(responseObj);
			return result;
		}
		responseObj.setCode(ResponseObj.OK);
		responseObj.setMsg("冻结异常账户成功");
		//user.setPassword(session.getId());//单独设置
		//user.setNextUrl(request.getContextPath() + "/mvc/home");//单独控制地址
		responseObj.setData(user);
		//session.setAttribute("userInfo", user);
		System.out.println("====7.7 打印冻结可疑账户后 userInfo===" + user);
		result = new GsonUtils().toJson(responseObj);
		System.out.println("=====打印result =" + result);
		result = result;
		return result;

	}

	/**
	 * 时间： 2017 年 7 月 7 日
	 * 说明：  通过 新注册用户的信息审核
	 *
	 * @param request
	 * @param response
	 * @param user
	 * @return
	 */
	@RequestMapping(value = "/listAllUserPass", method = RequestMethod.POST)
	public Object PassUser(HttpServletRequest request,
						   HttpServletResponse response,
						   User user) throws Exception {
		Object result;
		responseObj = new ResponseObj<User>();
		// 通过新注册账户信息 审核
		try {
			int userId = user.getUserId();
			System.out.println("-=====7.7打印要冻结账户ID:" + userId);
			userService.passUser(userId);
		} catch (Exception e) {
			e.printStackTrace();
			responseObj.setCode(ResponseObj.FAILED);
			responseObj.setMsg("审核新注册账户失败，其他错误");
			result = new GsonUtils().toJson(responseObj);
			return result;
		}
		responseObj.setCode(ResponseObj.OK);
		responseObj.setMsg("审核新注册账户成功");
		responseObj.setData(user);
		System.out.println("====7.7 打印审核的账户后 userInfo===" + user);
		result = new GsonUtils().toJson(responseObj);
		System.out.println("=====打印result =" + result);
		result = result;
		return result;

	}

	/**
	 * 时间： 2017 年 8 月  3  日
	 * 作者： 王娇
	 * 说明：系统管理员，系统用户列表中，按生产商单位筛选出来的列表
	 *
	 * @return
	 */
	@RequestMapping(value = "/listShengUser", method = RequestMethod.POST)
	public void PageInfo1(HttpServletRequest request,
						  HttpServletResponse response,
						  User user,Factory factory,
						  @RequestParam(value = "offset", defaultValue = "0") Integer pageNum,
						  @RequestParam(value = "limit", defaultValue = "10") Integer pageSize) {
		//使用DataTables的属性接收分页数据
		DataTablePageUtil<User> dataTable = new DataTablePageUtil<User>(request);
		//开始分页：PageHelper会处理接下来的第一个查询
		PageHelper.startPage(dataTable.getPage_num(), dataTable.getPage_size());
		//还是使用List，方便后期用到
		String fname= factory.getFactoryName();
		List<User> userShengList = userService.getShengUserList(fname,1, 10);
		System.out.println("===打印得到的=userList==" + userShengList);
		//用PageInfo对结果进行包装
		PageInfo<User> pageInfo = new PageInfo<User>(userShengList);
		System.out.println("===打印封装的 pageInfo===" + pageInfo);
		//封装数据给DataTables
		dataTable.setDraw(dataTable.getDraw());
		dataTable.setData(pageInfo.getList());
		dataTable.setRecordsTotal(userService.getShengUserCount(fname));
		//dataTable.setRecordsTotal((int) pageInfo.getTotal());
		dataTable.setRecordsFiltered(dataTable.getRecordsTotal());
		//返回数据到页面
		try {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/json");
			response.getWriter().write(new GsonUtils().toJson(dataTable));
			System.out.println("系统用户列表-条件筛选： 按生产商列表模糊匹配" + new GsonUtils().toJson(dataTable));
			response.getWriter().flush();
			response.getWriter().close();
		} catch (IOException e) {
			e.printStackTrace();
		}

	}


	/**
	 * 时间： 2017 年 7 月  5  日
	 * 作者： 王娇
	 * 说明：基于jquery DataTable API 插件 的分页 --系统管理员所有的系统列表
	 * @return
	 */
	@RequestMapping(value = "/listAllUser", method = RequestMethod.POST)
	public void PageInfo1(HttpServletRequest request,
						  HttpServletResponse response,
						  User user,
						  @RequestParam(value = "offset", defaultValue = "0") Integer pageNum,
						  @RequestParam(value = "limit", defaultValue = "10") Integer pageSize) {
		//使用DataTables的属性接收分页数据
		DataTablePageUtil<User> dataTable = new DataTablePageUtil<User>(request);
		//开始分页：PageHelper会处理接下来的第一个查询
		PageHelper.startPage(dataTable.getPage_num(), dataTable.getPage_size());
		//还是使用List，方便后期用到
		List<User> userList = userService.findAllUser(1, 10);
		System.out.println("===打印得到的=userList==" + userList);
		//用PageInfo对结果进行包装
		PageInfo<User> pageInfo = new PageInfo<User>(userList);
		System.out.println("===打印封装的 pageInfo===" + pageInfo);
		//封装数据给DataTables
		dataTable.setDraw(dataTable.getDraw());
		dataTable.setData(pageInfo.getList());
		dataTable.setRecordsTotal(userService.getAllCount());
		//dataTable.setRecordsTotal((int) pageInfo.getTotal());
		dataTable.setRecordsFiltered(dataTable.getRecordsTotal());
		//返回数据到页面
		try {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/json");
			response.getWriter().write(new GsonUtils().toJson(dataTable));
			System.out.println("list页面接受检测=====" + new GsonUtils().toJson(dataTable));
			response.getWriter().flush();
			response.getWriter().close();
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	/**
	 * 获得用户列表的 json 数据
	 * 创建日期： 2017.06.25
	 * 创建者： 王娇
	 * 基于 BootStrap 版本的物理分页（暂时不用）
	 *
	 * @param request
	 * @param response
	 * @param user
	 * @param pageNum
	 * @param pageSize
	 */
	@RequestMapping(value = "/listAllUser1",
			produces = "application/json;charset=utf-8"
	)
	private void PageInfo(HttpServletRequest request, HttpServletResponse response, User user,
						  @RequestParam(value = "offset", defaultValue = "0") Integer pageNum,
						  @RequestParam(value = "limit", defaultValue = "10") Integer length
	) {
		Datagrid datagrid = userService.getAllUserList(user, pageNum, length);
		//System.out.println("======控制台打印=====pageNum==========" + pageNum);
		//System.out.println("=======控制台打印====length=========" + length);
		//System.out.println("=======控制台打印====== result =datagrid============" + new GsonUtils().toJson(datagrid));

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
			produces = "application/json;charset=utf-8")
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
	public Object login(HttpServletRequest request,
						@RequestParam(value = "accountName", required = true) String accountName,
						HttpServletResponse response,
						User user, Factory factory,Agency agency,HttpSession session) throws Exception {
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
		//System.out.println("用户登录时候，能得到该用户的信息中的 userId："+user1.getRoleId());//如果加上这句，当用户不存在会抛出异常

		if (null == user1) {
			responseObj = new ResponseObj<User>();
			responseObj.setCode(ResponseObj.EMPUTY);
			responseObj.setMsg("未找到该用户");
			result = new GsonUtils().toJson(responseObj);
		}else if(user1.getApproved() == 0) {
			responseObj = new ResponseObj<User>();
			responseObj.setCode(ResponseObj.FAILED);
			responseObj.setMsg("账号信息正在审核中");
			result = new GsonUtils().toJson(responseObj);
			return result;
		}else{
			//==================(1)获取该登录用户的头像===============
			String userImagePath = userService.findPathById(accountName);
			System.out.println("===测试获取该登录用户的头像打印图片原始路径======" + userImagePath);
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
				//=========================================7.18 放到home 页 售货机列表 =====================================================
				int roleId=user1.getRoleId();
				if(roleId==6||roleId==8||roleId==10) {
					int fId = user1.getFactoryId();
					Factory factoryInfo = factoryService.findFactory(factory);//生产商角色，可以直接借助用户名找到该生产商表中所有信息
					List<Vendor> vendorNameSList = vendorService.getAllSvendorName(fId, roleId);
					List<Vendor> agencyNameList = vendorService.getAgencyNameList(fId);
					//System.out.println("数据筛选出来的列表："+new GsonUtils().toJson(vendorNameSList));//控制台可以看到数据
					//System.out.println("打印放到首页的用户登录的时候得到 生产商售货机名称列表（后续增加查询到的内容）"+new GsonUtils().toJson(vendorNameSList));
					//================================7.16 号增加新内容====================
					//session.setAttribute("test", new GsonUtils().toJson(vendorNameSList));//暂时用不到
					session.setAttribute("sVnameList", vendorNameSList);//后台拼好，拿去前台用的
					session.setAttribute("agencyNameList", agencyNameList);//后台拼好，拿去前台用的
					session.setAttribute("factoryInfo", factoryInfo);//后台拼好，拿去前台用的  左侧菜单上方的 生产商信息

					//================================7.16号增加新内容================-==
				}
				if(roleId==3||roleId==4||roleId==5){
					int aId = user1.getAgencyId();
					int fId1 = user1.getFactoryId();//查询该运营商归属的生产商ID 值，从而查询到归属的生产商的描述 factoryName
					String factoryInfo1 =factoryService.findFactoryById(fId1);//查询运营商归属的生产商信息
					Agency agencyInfo = agencyService.findAgency(agency);
					List<Vendor> vendorNameYList = vendorService.getAllYvendorName(aId,roleId);
					System.out.println("仅作日志查看：打印放到首页的用户登录的时候得到 运营商售货机名称列表（后续增加查询到的内容）"+new GsonUtils().toJson(vendorNameYList));
					//session.setAttribute("yVnameList", new GsonUtils().toJson(vendorNameYList));//不能转json
					session.setAttribute("yVnameList", vendorNameYList);
					session.setAttribute("agencyInfo", agencyInfo);//拿到首页，存放运营商信息
					session.setAttribute("factoryInfo1", factoryInfo1);//拿到首页，存放运营商信息


				}
//				=========================================分主次的权限菜单==五月十四日============================================================================================
				user1.setNextUrl(request.getContextPath() + "/mvc/home");
				responseObj = new ResponseObj<User>();
				responseObj.setCode(ResponseObj.OK);
				responseObj.setMsg(ResponseObj.OK_STR);
				responseObj.setPath(userImagePath);
				//============================分主次的权限菜单=======================================
				responseObj.setTreelist(treeList);
				//============================分主次的权限菜单=======================================
				System.out.println("===打印登录时数据库中图片原始路径======" + userImagePath);
				responseObj.setData(user1);//提取到数据库中该用户登录的所有的信息，（密码是加密）
				//userService.updateLoginSession(request.getSession().getId(), user.getAccountName());
				//responseObj.setuserMessage(userService.findUser(user));
				System.out.println("====查找的用户的信息setData====" + user1);  //能打印用户所有信息（密码是加密）
				System.out.println("====查找的用户的信息setuserMessage====" + user1);  //能打印用户所有信息（密码是加密）
				session.setAttribute("userMess", userService.findUser(user));
				session.setAttribute("userInfo", user);//登录成功，将用户数据放入到Session中(只有用户名和密码)
				//session.setAttribute("menu", menuList);
				session.setAttribute("tree", treeList);

				//System.out.println("===存入session信息,userController里面，tree===" + treeList);
				session.setAttribute("userPath", userImagePath);
				System.out.println("===存入session头像路径======" + userImagePath);
				System.out.println("===存入session信息,userInfo=====" + user);//只打印 用户名和密码（未加密）
				//System.out.println("===存入session信息,userInfo=====" + userMess);//只打印 用户名和密码（未加密）
				//================================================
				//responseObj.setTreelist(treeList1);
				//session.setAttribute("treeList1",treeList1);
				//System.out.println("重新组装的 treeList1：："+treeList1);

				//============================================================
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
	 * 说明：修改个人资料统一入口，修改个人资料
	 * 时间： 2017 年 04 月
	 * 作者：王娇
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
	 * 说明： 统一修改个人头像入口
	 * 创建上传头像接口
	 * 在登录的窗口已经实现 动态显示用户头像
	 * 注册时使用 初始头像
	 * 更新完善日期： 2017 年 6 月 11 日
	 * 作者： 王娇
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
		System.out.println("新上传文件原始文件名==" + fileName);

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
		//获得项目的路径
		ServletContext servletContext = request.getSession().getServletContext();
		System.out.println("====打印要获取项目路径==" + servletContext);

		//设定上传的位置，设定文件保存的目录
		String path = servletContext.getRealPath("/static/images/" + fileName);
		System.out.println("====打印要存的路径==" + path);

		//创建文件目录
		//File f = new File(path);
		//如果目录不存在就在创建
		//if (!f.exists()){
		//	f.mkdirs();
		//}if (!file.isEmpty()){
		//	try{
		//		FileOutputStream fos = new FileOutputStream(path+"/"+fileName);
		//		System.out.println("====打印要存的try里路径==" + fos);
		//		InputStream in = file.getInputStream();
		//		int b = 0;
		//		while ((b = in.read())!= -1){
		//			fos.write(b);
		//		}
		//		fos.close();
		//		in.close();
		//		responseObj.setCode(ResponseObj.OK);
		//		responseObj.setMsg("=========上传文件成功=====");
		//		//Materialdir materialdir = new Materialdir();
		//		//materialdir.setMaterialdirid(materialdirid);
		//		//materialdir.setMaterialname(fName);
		//		//materialdir.setMaterialurl(path);
		//		//materialdir.setUploadtime(new DateUtil().DateToString(new Date()));
		//		//materialdirService.add(materialdir);
		//		//System.out.println("=========上传文件成功======");
		//		//this.write(response,true);
		//	}catch (Exception e) {
		//		e.printStackTrace();
		//		responseObj.setCode(ResponseObj.FAILED);
		//		responseObj.setMsg("=========上传文件失败=====");
		//		result = new GsonUtils().toJson(responseObj);
		//		return result;
		//
		//	}
		//}
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
	 * 时间： 2017 年 5 月 25 日
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
	 * value = "/sysuserResYunPei"  创建三级用户的 统一入口
	 * 系统管理员 创建三级管理用户(运营商配货员，运营商仓库员），
	 * 受影响表格（用户表user表，运营商表格agency表，agencyId,账户名account_name唯一）
	 * 时间：2017  年 5 月 25 日
	 *
	 * @param request
	 * @param response
	 * @param user
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/sysuserResYunPei"
			, method = RequestMethod.POST
			, produces = "application/json;charset=utf-8")
	@ResponseBody
	public Object sysuserRes1(HttpServletRequest request, HttpServletResponse response, User user, HttpSession session) throws Exception {
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
			userService.sysuseraddYunPei(user);
			//userService.updateAgencyId(aId, aName);
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
		//responseObj.setData(agency);
		//session.setAttribute("agencyInfo", agency);//只有注册时输入表单项数
		//System.out.println("======查看 新注册的 添加运营商表里的记录：agencyInfo==" + agency);
		//System.out.println("======查看 新注册的 运营商ID,另外一种更新id方式 6.4号" + agency.getAgencyId());
		result = new GsonUtils().toJson(responseObj);
		result = result;
		return result;
	}

	/**
	 * 说明：系统管理员  创建一级管理员用户（系统用户）,受影响的表格 用户表
	 * 时间 :2017 年 06 月 03 日
	 * 作者 ： 王娇
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
	 * 说明：系统管理员 创建一级管理用户（生产商），受影响表格（用户表user表，运营商表格factory表，Id,账户名account_name唯一）
	 * 作者： 王娇
	 * 创建时间：2017 年 5 月29 日
	 * 更新日期： 2017 年  6 月 10 日
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
		userService.createSaleTable("sale_" + factory.getFactoryId().toString());//销售表名
		userService.createCashTable("cash_" + factory.getFactoryId().toString());//金钱表名
		userService.createCashSaleTable("cash_sale_" + factory.getFactoryId().toString());//金钱销售关联表名
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