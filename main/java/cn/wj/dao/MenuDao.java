package cn.wj.dao;

import cn.wj.domain.Menu;

public interface MenuDao extends Dao<MenuDao>{





    //================================自动生成=========================================
    int deleteByPrimaryKey(Integer menuId);

    int insert(Menu record);

    int insertSelective(Menu record);

    Menu selectByPrimaryKey(Integer menuId);

    int updateByPrimaryKeySelective(Menu record);

    int updateByPrimaryKey(Menu record);
}