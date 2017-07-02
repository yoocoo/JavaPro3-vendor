package cn.wj.dao;

import cn.wj.domain.RoleInMenu;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface RoleInMenuDao extends Dao<RoleInMenuDao> {
    /**
     * 1.1.1  6.10 得到关联菜单表中内容
     * 得到 角色菜单 role_in_menu 所有信息
     * 2017.06.15
     * @param limit,offset
     * @return
     */
     List<RoleInMenu> getAllRoleMenu(@Param("offset") int offset, @Param("limit") int limit);

    /**
     * 1.1.2 6.26关联菜单表中总记录数字
     * @return
     */
     int  getAllCount();

    //================================自动生成=========================================
    int deleteByPrimaryKey(Integer id);

    int insert(RoleInMenu record);

    int insertSelective(RoleInMenu record);

    RoleInMenu selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(RoleInMenu record);

    int updateByPrimaryKey(RoleInMenu record);
}