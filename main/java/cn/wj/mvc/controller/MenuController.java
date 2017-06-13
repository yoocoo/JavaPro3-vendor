package cn.wj.mvc.controller;

import cn.wj.domain.Menu;
import cn.wj.domain.ResponseObj;
import cn.wj.service.MenuService;
import cn.wj.utils.GsonUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by ThinkPad on 2017/6/4.
 */
@Controller
@RequestMapping("/listMenu")
public class MenuController {
	@Autowired
	private MenuService menuService;
	private ResponseObj responseObj;

	//
	//@RequestMapping(value = "/getAllMenu", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	//public ModelAndView findAllMenu(HttpServletRequest request, HttpServletResponse response, Menu menu) throws Exception {
	//	ModelAndView mav = new ModelAndView();//创建一个得到所有菜单的页面对象
	//	mav.setViewName("user_system/sysuser_res_menu");//设置Jsp 文件名
	//	String result;
	//	List<Menu> allMenuList = null;
	//	try {
	//		responseObj = new ResponseObj<Menu>();
	//		allMenuList = menuService.getAllMenu(menu);
	//		System.out.println("===value = \"/getAllMenu\"==="+allMenuList);
	//		result = GsonUtils.gson.toJson(responseObj);
	//	} catch (Exception e) {
	//		e.printStackTrace();
	//		mav.addObject("message", "跳转到权限菜单管理其他错误");
	//		result = GsonUtils.gson.toJson(responseObj);
	//	}
	//	mav.addObject("code", 110);
	//	mav.addObject("result", result);
	//	System.out.println("===mav.addObject(\"result\", result);==="+result);
	//
	//	mav.addObject("allMenu", allMenuList);
	//	System.out.println("===mav.addObject(\"allMenu\", allMenuList);==="+allMenuList);
	//
	//	return mav;
	//}


	@RequestMapping(value = "/getMenu"
			, method = RequestMethod.POST,
			produces = "application/json;charset=utf-8")
	//设置其访问地址形式：http://xxx.cn.listMenu.getMenu 响应请求头 Contentype 表明 响应的是JSON数字 字符编码utf8
	@ResponseBody//表明 该方法直接返回的是响应体的内容
	public Object findMenu(HttpServletRequest request, HttpServletResponse response,
						   //@Param("pageNum") int pageNum, @Param("pageSize") int pageSize,
						   Menu menu, HttpSession session) throws Exception {
		Object result;
		//if (pageNum <= 0) {
		//	pageNum = 1;
		//}
		//if (pageSize == 0) {
		//	pageSize = 10;
		//}
		//int toalNum;//总页码
		//toalNum = menuService.getAllCount();//先把总条数赋值给总页数，作为缓存变量，减少下面算法的查找次数
		//toalNum = toalNum % pageSize > 0 ? toalNum / pageSize + 1 : toalNum / pageSize;//在每页固定条数下能不能分页完成，有余则加一页码
		responseObj = new ResponseObj<Menu>();
		List<Menu> allMenuList = menuService.getAllMenu(menu);
		//List<Menu> result = new ResponseList<Menu>();
		responseObj.setCode(ResponseObj.OK);
		responseObj.setMsg("跳转到菜单");
		responseObj.setAllmenulist(allMenuList);

		responseObj.setData(menu);//提取到

		System.out.println("===存入setAllmenulist,allmenu===" + allMenuList);//重新组装的权限菜单
		session.setAttribute("allMenu", allMenuList);
		System.out.println("===存入session信息,MenuController里面，allmenu===" + allMenuList);
		result = new GsonUtils().toJson(responseObj);
		return result;

	}
}