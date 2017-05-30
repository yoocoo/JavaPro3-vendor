package cn.wj.dao;

public interface UserInRoleDao {






    //================================自动生成=========================================
    int deleteByPrimaryKey(Integer id);

    int insert(cn.wj.domain.UserInRole record);

    int insertSelective(cn.wj.domain.UserInRole record);

    cn.wj.domain.UserInRole selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(cn.wj.domain.UserInRole record);

    int updateByPrimaryKey(cn.wj.domain.UserInRole record);
}