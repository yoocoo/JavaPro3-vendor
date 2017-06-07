package cn.wj.dao;

import cn.wj.domain.UserRole;

public interface UserRoleDao {







    //================================自动生成=========================================
    int deleteByPrimaryKey(Integer roleId);

    int insert(UserRole record);

    int insertSelective(UserRole record);

    UserRole selectByPrimaryKey(Integer roleId);

    int updateByPrimaryKeySelective(UserRole record);

    int updateByPrimaryKey(UserRole record);
}