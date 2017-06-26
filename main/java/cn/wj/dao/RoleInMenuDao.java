package cn.wj.dao;

import cn.wj.domain.RoleInMenu;

import java.util.List;

public interface RoleInMenuDao extends Dao<RoleInMenuDao> {
    /**
     * 得到 角色菜单 role_in_menu 所有信息
     * 2017.06.15
     * @param roleInMenu
     * @return
     */
     List<RoleInMenu> getAllRoleMenu(RoleInMenu roleInMenu);



    //================================自动生成=========================================
    int deleteByPrimaryKey(Integer id);

    int insert(RoleInMenu record);

    int insertSelective(RoleInMenu record);

    RoleInMenu selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(RoleInMenu record);

    int updateByPrimaryKey(RoleInMenu record);
}