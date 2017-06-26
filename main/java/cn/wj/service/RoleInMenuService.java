package cn.wj.service;

import cn.wj.domain.RoleInMenu;

import java.util.List;

/**
 * Created by 王娇
 * on 2017/6/15.
 */

public interface RoleInMenuService  extends BaseService<RoleInMenu>{
	/**
	 * 得到 角色菜单 role_in_menu 所有信息
	 * 2017.6.15
	 * @param roleInMenu
	 * @return
	 */
	List<RoleInMenu> getAllRoleMenu(RoleInMenu roleInMenu);
}
