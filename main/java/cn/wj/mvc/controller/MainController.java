package cn.wj.mvc.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by ThinkPad on 2017/4/8.
 */
@Controller
//@RequestMapping("/mvc")
public class MainController {
	///**
	// * 行为日志列表
	// *
	// * @return
	// */
	//@RequestMapping(value = "/logMain", method = RequestMethod.GET)
	//public String logMain() {
	//	return "user_system/list_action_log";
	//}

	/**
	 * 项目框架测试
	 *
	 * @return
	 */
	@RequestMapping(value = "/mvc/hello", method = RequestMethod.GET)
	public String hello() {
		return "Hello Controller";
	}

	/**
	 * 登录界面
	 *
	 * @return
	 */
	@RequestMapping(value = "/mvc/login", method = RequestMethod.GET)
	public String login() {
		return "login";
	}


	/**
	 * 后台主页
	 *
	 * @return
	 */
	@RequestMapping(value = "/mvc/home", method = RequestMethod.GET)
	public String home() {
		return "home";
	}

	/**
	 * 修改个人头像
	 *
	 * @return
	 */
	@RequestMapping(value = "/mvc/userAction/updateImg", method = RequestMethod.GET)
	public String updateImg() {
		return "userinfo_img";
	}
	/**
	 * 修改个人资料
	 *
	 * @return
	 */
	@RequestMapping(value = "/mvc/userAction/update", method = RequestMethod.GET)
	public String update() {
		return "userinfo_update";
	}

	/**
	 * 系统管理员  创建 系统管理员
	 *
	 * @return
	 */
	@RequestMapping(value = "/mvc/userAction/sysuserResXi", method = RequestMethod.GET)
	public String sysuserRes() {
		return "user_system/sysuser_res";
	}
	/**
	 * 系统管理员  创建 一级管理用户(生产商)
	 *
	 * @return
	 */
	@RequestMapping(value = "/mvc/userAction/sysuserResSheng", method = RequestMethod.GET)
	public String sysuserResSheng() {
		return "user_system/sysuser_res_sheng";
	}

	/**
	 * 生产商管理员  创建 二级管理用户(运营商)
	 *
	 * @return
	 */
	@RequestMapping(value = "/mvc/userAction/sysuserResYun", method = RequestMethod.GET)
	public String sysuserRes1() {
		return "user_sheng/sheng_res_yun";
	}

	/**
	 * 运营商管理员  创建 三级管理用户(运营商仓库员，配货员)
	 *
	 * @return
	 */
	@RequestMapping(value = "/mvc/userAction/sysuserResYunPei", method = RequestMethod.GET)
	public String sysuserRes2() {
		return "user_yun/yun_res_yundi";
	}
//========================售货机业务逻辑开始====================================================
	/**
	 * 生产商管理员 注册售货机
	 * @return
	 */
	@RequestMapping(value = "/mvc/vendorAction/shengRegVendor", method = RequestMethod.GET)
	public String shengRegVendor() {
		return "vendor/vendor_res";
	}


}
//package cn.wj.mvc.controller;
//
//
//		import org.springframework.stereotype.Controller;
//		import org.springframework.web.bind.annotation.RequestMapping;
//		import org.springframework.web.bind.annotation.RequestMethod;
//
///**
// * Created by ThinkPad on 2017/4/8.
// */
//@Controller
//@RequestMapping("/mvc")
//public class MainController {
//	/**
//	 * 行为日志列表
//	 *
//	 * @return
//	 */
//	@RequestMapping(value = "/logMain", method = RequestMethod.GET)
//	public String logMain() {
//		return "user_system/list_action_log";
//	}
