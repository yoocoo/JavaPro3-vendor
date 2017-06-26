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
	 * 修改个人资料
	 *
	 * @return
	 */
	@RequestMapping(value = "/mvc/userAction/update", method = RequestMethod.GET)
	public String update() {
		return "userinfo_update";
	}

	/**
	 * 系统管理员  创建 一级管理用户(生产商)
	 *
	 * @return
	 */
	@RequestMapping(value = "/mvc/userAction/sysuserResSheng", method = RequestMethod.GET)
	public String sysuserRes() {
		return "user_system/sysuser_res_sheng";
	}

	/**
	 * 生产商管理员  创建 二级管理用户(运营商)
	 *
	 * @return
	 */
	@RequestMapping(value = "/userAction/sysuserResYun", method = RequestMethod.GET)
	public String sysuserRes1() {
		return "user_sheng/sheng_res_yun";
	}

	///**
	// *
	// * @return
	// */
	//@RequestMapping(value = "/userAction/listAllUser", method = RequestMethod.GET)
	//public String getUserList() {
	//	return "userlist";
	//}
	/**
	 * 跳转的菜单管理
	 *
	 * @return
	 */
	@RequestMapping(value = "/listMenu/getMenu", method = RequestMethod.GET)
	public String getMenu() {
		return "user_system/sysuser_res_menu";
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
//
//	/**
//	 * 项目框架测试
//	 *
//	 * @return
//	 */
//	@RequestMapping(value = "/hello", method = RequestMethod.GET)
//	public String hello() {
//		return "Hello Controller";
//	}
//
//	/**
//	 * 登录界面
//	 *
//	 * @return
//	 */
//	@RequestMapping(value = "/login", method = RequestMethod.GET)
//	public String login() {
//		return "login";
//	}
//
//	/**
//	 * 注册界面
//	 *
//	 * @return
//	 */
//	@RequestMapping(value = "/register", method = RequestMethod.GET)
//	public String register() {
//		return "register";
//	}
//
//	/**
//	 * 暂时为用到
//	 * 权限菜单
//	 *
//	 * @return
//	 */
//	@RequestMapping(value = "/left", method = RequestMethod.GET)
//	public String left() {
//		return "index_siderbar";
//	}
//
//	/**
//	 * 后台主页
//	 *
//	 * @return
//	 */
//	@RequestMapping(value = "/home", method = RequestMethod.GET)
//	public String home() {
//		return "home";
//	}
//
//	/**
//	 * 修改个人资料
//	 *
//	 * @return
//	 */
//	@RequestMapping(value = "/userAction/update", method = RequestMethod.GET)
//	public String update() {
//		return "userinfo_update";
//	}
//
//	/**
//	 * 系统管理员  创建 一级管理用户(生产商)
//	 *
//	 * @return
//	 */
//	@RequestMapping(value = "/userAction/sysuserResSheng", method = RequestMethod.GET)
//	public String sysuserRes() {
//		return "user_system/sysuser_res_sheng";
//	}
//
//	/**
//	 * 生产商管理员  创建 二级管理用户(运营商)
//	 *
//	 * @return
//	 */
//	@RequestMapping(value = "/userAction/sysuserResYun", method = RequestMethod.GET)
//	public String sysuserRes1() {
//		return "user_sheng/sheng_res_yun";
//	}
//
//	/**
//	 *
//	 * @return
//	 */
//	@RequestMapping(value = "/userAction/listAllUser", method = RequestMethod.GET)
//	public String getUserList() {
//		return "user_system/sysuser_list_user";
//	}
//	/**
//	 * 跳转的菜单管理
//	 *
//	 * @return
//	 */
//	@RequestMapping(value = "/listMenu/getMenu", method = RequestMethod.GET)
//	public String getMenu() {
//		return "user_system/sysuser_res_menu";
//	}
//}
