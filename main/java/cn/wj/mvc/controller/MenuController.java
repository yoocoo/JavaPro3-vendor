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

	@RequestMapping(value = "/getMenu"
			, method = RequestMethod.POST,
			produces = "application/json;charset=utf-8")
	//设置其访问地址形式：http://xxx.cn.listMenu.getMenu 响应请求头 Contentype 表明 响应的是JSON数字 字符编码utf8
	@ResponseBody//表明 该方法直接返回的是响应体的内容
	public Object findMenu(HttpServletRequest request, HttpServletResponse response, Menu menu, HttpSession session) throws Exception {
		Object result;
		responseObj = new ResponseObj<Menu>();
		List<Menu>  allMenuList = menuService.getAllMenu(menu);
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