package cn.wj.dao;

import cn.wj.domain.Files;

public interface FilesDao  extends Dao<Files>{
    int deleteByPrimaryKey(Integer id);

    int insert(Files record);

    int insertSelective(Files record);

    Files selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Files record);

    int updateByPrimaryKey(Files record);
}