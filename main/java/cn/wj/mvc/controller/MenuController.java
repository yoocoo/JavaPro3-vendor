package cn.wj.mvc.controller;

import cn.wj.domain.Menu;
import cn.wj.domain.PageSplit;
import cn.wj.domain.ResponseObj;
import cn.wj.domain.RoleInMenu;
import cn.wj.service.MenuService;
import cn.wj.service.RoleInMenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by ThinkPad on 2017/6/4.
 * 改进直接跳转：  注意的是不需要转成GsonUtils().toJson(allMenuList) ，不然页面找不到类型,这种 "menuid"=" 1 "
 * 页面接受的类型： [{"menuId":"1","menuName":"大数据","menuUrl":"/mvc/home","parentId":"0","menuOrder":"1","menuIcon":"icon-dashboard","menuType":"1","countChildrens":"null","parentMenu":"null","hasMenu":"false","subMenu":"null"},
 */
@Controller
@RequestMapping("/listMenu")
public class MenuController {
	@Autowired
	private MenuService menuService;
	@Autowired
	private RoleInMenuService roleInMenuService;
	private ResponseObj responseObj;

	/**
	 * 说明：接受权限菜单列表（待完善数据库信息查询）
	 * 作者：王娇
	 * 时间： 2017 年 06 月25 日
	 * @param request
	 * @param session
	 * @param menu
	 * @param roleInMenu
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "listMenuPage")
	public ModelAndView listMenuPage(HttpServletRequest request,HttpSession session, Menu menu, RoleInMenu roleInMenu) throws Exception {
		ModelAndView view = new ModelAndView("user_system/sysuser_res_menu");
		view.addObject("listMenuJson", getMenu(request, menu));
		view.addObject("listRoleInMenuJson", getRoleInMenu(request,session, 1, 10));
		System.out.println("页面接受检测=====" + getRoleInMenu(request,session, 1, 10));
		return view;
	}

	/**
	 * 说明：得到权限菜单（menu ）
	 * 时间： 2017 年 6 月 10 日
	 * 作者：王娇
	 * @param request //* @param response
	 * @param menu    //* @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/getMenu",
			//, method = RequestMethod.POST,
			produces = "application/json;charset=utf-8")
	//设置其访问地址形式：http://xxx.cn.listMenu.getMenu 响应请求头 Contentype 表明 响应的是JSON数字 字符编码utf8
	@ResponseBody//表明 该方法直接返回的是响应体的内容
	public List<Menu> getMenu(HttpServletRequest request,
							  //HttpServletResponse response,
							  //@Param("pageNum") int pageNum, @Param("pageSize") int pageSize,
							  Menu menu) throws Exception {
		List<Menu> allMenuList = menuService.getAllMenu(menu);
		//System.out.println("===控制台打印setAllmenulist,allmenu===" + allMenuList);//重新组装的权限菜单
		return allMenuList;
	}

	/**
	 * 说明：得到 关联菜单数据
	 * 时间： 2017 年 06 月 20 日
	 * 作者： 王娇
	 * @param request
	 * @param session
	 * @param pageNum
	 * @param pageSize
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/getRoleInMenu",
			//, method = RequestMethod.POST,
			produces = "application/json;charset=utf-8")
	@ResponseBody//表明 该方法直接返回的是响应体的内容'
	public List<RoleInMenu> getRoleInMenu(HttpServletRequest request,HttpSession session,
										  //RoleInMenu roleInMenu,
										  int pageNum, int pageSize) throws Exception {
		PageSplit page;//这个在日志分页中，做了一个判断
		if (pageNum <= 0) {
			pageNum = 1;
		}
		if (pageSize == 0) {
			pageSize = 10;
		}
		int toalNum = 0;//总页码
		toalNum = roleInMenuService.getAllCount();//先把总条数赋值给总页数，作为缓存变量，减少下面算法的查找次数
		toalNum = toalNum % pageSize > 0 ? toalNum / pageSize + 1 : toalNum / pageSize;     //在每页固定条数下能不能分页完成，有余则加一页码
		System.out.println("========打印总页码===" + toalNum);
		List<RoleInMenu> roleMenuList = roleInMenuService.getAllRoleMenu(pageNum, pageSize);
		System.out.println("===控制台打印setAllRole In menu list,allrole in menu===" + roleMenuList);//重新组装的权限菜单
		//======================菜单页码，总记录数，每页量 可以不用放入session会话中===========================================
		session.setAttribute("toalN",toalNum);
		session.setAttribute("pageN",pageNum);
		session.setAttribute("pageS",pageSize);
		//======================菜单页码，总记录数，每页量 可以不用放入session会话中===========================================
		return roleMenuList;
	}

}