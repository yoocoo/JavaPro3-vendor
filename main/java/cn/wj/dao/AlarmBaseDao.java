package cn.wj.dao;

import cn.wj.domain.AlarmBase;

public interface AlarmBaseDao extends Dao<AlarmBase>{


	//===========自动生成============
    int deleteByPrimaryKey(Integer alarmId);

    int insert(AlarmBase record);

    int insertSelective(AlarmBase record);

    AlarmBase selectByPrimaryKey(Integer alarmId);

    int updateByPrimaryKeySelective(AlarmBase record);

    int updateByPrimaryKey(AlarmBase record);
}