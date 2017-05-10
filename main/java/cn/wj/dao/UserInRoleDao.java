package cn.wj.dao;

public interface UserInRoleDao {
    int deleteByPrimaryKey(Integer id);

    int insert(cn.wj.domain.UserInRole record);

    int insertSelective(cn.wj.domain.UserInRole record);

    cn.wj.domain.UserInRole selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(cn.wj.domain.UserInRole record);

    int updateByPrimaryKey(cn.wj.domain.UserInRole record);
}