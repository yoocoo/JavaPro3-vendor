//package cn.wj.mvc.controller;
//
//import cn.wj.domain.ResponseObj;
//import cn.wj.domain.User;
//import cn.wj.service.UserService;
//import cn.wj.utils.GsonUtils;
//import cn.wj.utils.StringUtils;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.ResponseBody;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//
///**
// * Created by ThinkPad on 2017/5/22.
// */
//@Controller
//@RequestMapping("/actionSysRes")
//public class sysResController {
//	@Autowired
//	UserService userService;
//	/**
//	 * 系统管理员 创建一级管理用户
//	 * @param request
//	 * @param response
//	 * @param user
//	 * @param session
//	 * @return
//	 */
//	@RequestMapping(value = "/sysuserRes"
//			, method = RequestMethod.POST
//			, produces = "application/json;charset=utf-8")
//	@ResponseBody
//	public Object sysuserRes(HttpServletRequest request, HttpServletResponse response, User user, HttpSession session)throws  Exception {
//		Object result;
//		ResponseObj
//		responseObj = new ResponseObj<User>();
//		//ModelAndView mav = new ModelAndView();//创建一个jsp页面对象
//		//mav.setViewName("home");//设置Jsp页面文件名
//		if (null == user) {
//			responseObj.setCode(ResponseObj.FAILED);
//			responseObj.setMsg("用户信息不能为空");
//			result = new GsonUtils().toJson(responseObj);
//			return result;
//			//mav.addObject("message","用户信息不能为空！");//加入提示信息
//			//return mav;//返回页面
//		}
//		if (StringUtils.isEmpty(user.getAccountName()) || StringUtils.isEmpty(user.getPassword())) {
//			responseObj.setCode(ResponseObj.FAILED);
//			responseObj.setMsg("用户名或密码不能为空");
//			result = new GsonUtils().toJson(responseObj);
//			return result;
//			//mav.addObject("message","用户名或密码不能为空！");
//			//return  mav;
//		}
//		if (null != userService.findUser(user)) {
//			responseObj.setCode(ResponseObj.FAILED);
//			responseObj.setMsg("用户已存在");
//			result = new GsonUtils().toJson(responseObj);
//			return result;
//			//mav.addObject("message","用户名已存在！");
//			//return  mav;
//		}
//		try {
//			userService.sysuseradd(user);
//		} catch (Exception e) {
//			e.printStackTrace();
//			responseObj.setCode(ResponseObj.FAILED);
//			responseObj.setMsg("其他错误");
//			result = new GsonUtils().toJson(responseObj);
//			return result;
//			//mav.addObject("message","错误，用户其他信息错误！");
//			//return mav;
//		}
//		//userService.updateLoginSession(request.getSession().getId(),user.getAccountName());
//		responseObj.setCode(ResponseObj.OK);
//		responseObj.setMsg("注册管理成功");
//		//user.setPassword(session.getId());//单独设置
//		user.setNextUrl(request.getContextPath() + "/mvc/home");//单独控制地址
//
//		responseObj.setData(user);// 只有注册时输入表单项数（用户ID 自增的，用户名，用户密码（加密），电话）
//		System.out.println("===注册管理用户信息=====" + user);// 只有注册时输入表单项数，其他在后台sql语句中赋了一定的初始值
//
//		//session.setAttribute("userInfo", user);//只有注册时输入表单项数（用户ID 自增的， 下一步地址，用户名，用户密码（加密），电话）
//		//System.out.println("======userInfo==" + user);//只有注册时输入表单项数（用户ID 自增的，下一步地址，用户名，用户密码（加密），电话）
//
//		result = new GsonUtils().toJson(responseObj);
//		result = result;
//		//mav.addObject("code",110);
//		//mav.addObject("message","恭喜注册成功！");
//		//req.getSession().setAttribute("user",user);
//		//return  mav;
//		return result;
//	}
//}
