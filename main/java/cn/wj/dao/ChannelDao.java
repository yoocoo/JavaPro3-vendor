package cn.wj.dao;

import cn.wj.domain.Channel;

public interface ChannelDao extends Dao<Channel>{

    //=======自动生成=============
    int insert(Channel record);

    int insertSelective(Channel record);
}