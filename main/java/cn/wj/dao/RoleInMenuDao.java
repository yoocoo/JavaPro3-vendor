package cn.wj.dao;

import cn.wj.domain.RoleInMenu;

public interface RoleInMenuDao {
    int deleteByPrimaryKey(Integer id);

    int insert(RoleInMenu record);

    int insertSelective(RoleInMenu record);

    RoleInMenu selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(RoleInMenu record);

    int updateByPrimaryKey(RoleInMenu record);
}