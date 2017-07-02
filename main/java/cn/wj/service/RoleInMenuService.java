package cn.wj.service;

import cn.wj.domain.RoleInMenu;

import java.util.List;

/**
 * Created by 王娇
 * on 2017/6/15.
 */

public interface RoleInMenuService extends BaseService<RoleInMenu> {
	/**
	 * 1.1.1  6.10 得到关联菜单表中内容
	 * 得到 角色菜单 role_in_menu 所有信息
	 * 2017.6.15
	 *
	 * @param
	 * @return
	 */
	List<RoleInMenu> getAllRoleMenu(int pageNum, int pageSize);

	/**
	 * 1.1.2 6.26关联菜单表中总记录数字
	 * 获取总条数
	 *
	 * @return 获取总条数
	 */
	int getAllCount();

}
