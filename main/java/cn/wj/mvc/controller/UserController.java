package cn.wj.mvc.controller;

import cn.wj.domain.Menu;
import cn.wj.domain.ResponseObj;
import cn.wj.domain.Tree;
import cn.wj.domain.User;
import cn.wj.service.serviceImpl.UserServiceImpl;
import cn.wj.utils.GsonUtils;
import cn.wj.utils.StringUtils;
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
	@Autowired
	private UserServiceImpl userService;//自动载入Service对象
	private ResponseObj responseObj;

	/**
	 * ModelAndView 代表一个web页面(初期页面跳转4.1)
	 * setViewName代表设置一个JSP页面的名称
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
	 * 登录入口
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
				//==========================================分主次的权限菜单，五月十四日===============================================================================================
				//================(2)5.12  做权限菜单=================
				List<Menu> menuList = userService.getMenu(user1.getUserId());
				//=============重新组装menulist 到treelist =========

				//===存入session信息,tree(进行了两次for循环后，并没有按照拼接的所有菜单，只有部分菜单)===
				// [Menu{id='2',text='图形和数据', state='open', checked='false', attributes='{url=/mvc/chart}',
				// children='[Menu{id='201',text='图形', state='open', checked='false', attributes='{url=/mvc/chart}',
				// children='null', iconCls='icon-bar-chart', pid='2}, Menu{id='202',text='数据', state='open', checked='false', attributes='{url=/mvc/table}',
				// children='null', iconCls='icon-barcode', pid='2}]', iconCls='icon icon-signal', pid='0}]
				List<Tree> treeList = new ArrayList<Tree>();
				{
					for (Menu menu : menuList) {
						Tree node = new Tree();
						if (menu.getParentId() == 0) {
							node.setId(menu.getMenuId());
							node.setPid(menu.getParentId());
							node.setText(menu.getMenuName());
							node.setIconCls(menu.getMenuIcon());
							if (menu.getCountChildrens() > 0) { // 有子节点
								node.setState("closed");
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
							break;
						}
					}
				}
//return treeList;
//				=========================================分主次的权限菜单==五月十四日============================================================================================
				user1.setNextUrl(request.getContextPath() + "/mvc/home");
				responseObj = new ResponseObj<User>();
				//ResponseList<UserActionLog> responseObj = new ResponseList<UserActionLog>();
				responseObj = new ResponseObj<Tree>();
				responseObj.setCode(ResponseObj.OK);
				responseObj.setMsg(ResponseObj.OK_STR);
				responseObj.setPath(userImagePath);

				responseObj.setMenulist(menuList);

				//============================分主次的权限菜单=======================================
				responseObj.setTreelist(treeList);
				//============================分主次的权限菜单=======================================

				System.out.println("===打印登录时数据库中图片原始路径======" + userImagePath);
				//System.out.println("====打印出来该用户所有要显示的权限菜单menuList=======" + menuList);
				//responseObj.setData(treeList);
				//System.out.println("===存入setData,tree===" + treeList);
				responseObj.setData(user1);//提取到数据库中该用户登录的所有的信息，（密码是加密）
				//userService.updateLoginSession(request.getSession().getId(),user.getAccountName());
				responseObj.setuserMessage(userService.findUser(user));
				System.out.println("====查找的用户的信息setData====" + user1);  //能打印用户所有信息（密码是加密）
				System.out.println("====查找的用户的信息setuserMessage====" + user1);  //能打印用户所有信息（密码是加密）
				session.setAttribute("userMess", userService.findUser(user));
				session.setAttribute("userInfo", user);//登录成功，将用户数据放入到Session中(只有用户名和密码)
				session.setAttribute("menu", menuList);

				//session.setAttribute("tree", treeList);

				session.setAttribute("userPath", userImagePath);
				System.out.println("===存入session头像路径======" + userImagePath);
				System.out.println("===存入session信息,userInfo=====" + user);//只打印 用户名和密码（未加密）
				System.out.println("===存入session信息,menu===" + menuList);
				//System.out.println("===存入session信息,tree===" + treeList);

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
	 * 修改个人资料入口
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
	 *
	 * @param file
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/uploadHeadPic"
			, method = RequestMethod.POST
			, produces = "application/json; charset=utf-8")
	@ResponseBody
	public Object uploadHeadPic(@RequestParam(required = false) MultipartFile file, HttpServletRequest request, HttpServletResponse response, User user, HttpSession session) throws Exception {
		//保存相对路径到数据库，，图片写入数据库
		Object result;
		responseObj = new ResponseObj<User>();
		if (null == file || file.isEmpty()) {
			responseObj = new ResponseObj();
			responseObj.setCode(ResponseObj.FAILED);
			responseObj.setMsg("文件不能为空");
			return new GsonUtils().toJson(responseObj);
		}
		//更新用户头像
		//String userImagePath = userService.findPathById(accountName);
		//更新用户资料
		try {
			userService.updateImage(user);
		} catch (Exception e) {
			e.printStackTrace();
			responseObj.setCode(ResponseObj.FAILED);
			responseObj.setMsg("其他错误");
			result = new GsonUtils().toJson(responseObj);
			return result;
		}
		//获取新上传头像地址
		String fileName = file.getOriginalFilename();
		// 获取图片的扩展名
		//String extensionName = fileName.substring(fileName.lastIndexOf(".") + 1);
		// 新的图片文件名 = 本地静态资源目录+上传的文件原名
		//String newFileName = "/" + "static" + "/" + "images" + "/" + fileName;

		//responseObj = new ResponseObj<User>();
		responseObj.setCode(ResponseObj.OK);
		responseObj.setMsg("头像上传成功");
		responseObj.setMsg("文件原名为：" + file.getOriginalFilename());
		responseObj.setMsg("文件长度为：" + file.getSize());
		responseObj.setfileName(fileName);
		//responseObj.setData(user);
		session.setAttribute("file", fileName);
		System.out.println("===存入session信息,新头像地址===" + fileName);
		//System.out.println("===存入session信息,修改头像后userinfo===" + user);
		return new GsonUtils().toJson(responseObj);
		//result = result;
		//return result;

	}

	/**
	 * 使用ModelAndView 得到左侧权限菜单， 未完成（2017.5.13）
	 *
	 * @param getMenu
	 * @param user
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/getMenu", method = RequestMethod.GET)
	public ModelAndView getMenuView(HttpServletRequest getMenu, User user) throws Exception {
		ModelAndView mav = new ModelAndView();//创建左侧权限菜单JSP对象

		//查找用户
		User user3 = userService.findUser(user);
		if (null == user3) {
			mav.addObject("message", "未找到该用户，请重新登录");
			return mav;//返回页面
		} else {
			List<Menu> menuList = userService.getMenu(user3.getUserId());
			//获取当前菜单的所有子菜单
			List<Tree> treeList = new ArrayList<Tree>();
			{
				for (Menu menu : menuList) {
					Tree node = new Tree();
					if (menu.getParentId() == 0) {
						node.setId(menu.getMenuId());
						node.setPid(menu.getParentId());
						node.setText(menu.getMenuName());
						node.setIconCls(menu.getMenuIcon());
						if (menu.getCountChildrens() > 0) { // 有子节点
							node.setState("closed");
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
						break;
					}
				}
				mav.setViewName("index_siderbar");//设置jsp文件名
				mav.addObject("user", user3);
				mav.addObject("tree", treeList);
				System.out.println("===存入session信息,tree===" + treeList.get(1).getChildren());
			}

			return mav;
		}

	}

}

