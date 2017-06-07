package cn.wj.dao;

import cn.wj.domain.OrderBase;

public interface OrderBaseDao extends Dao<OrderBase> {




    //================================自动生成=========================================
    int deleteByPrimaryKey(Integer orderId);

    int insert(OrderBase record);

    int insertSelective(OrderBase record);

    OrderBase selectByPrimaryKey(Integer orderId);

    int updateByPrimaryKeySelective(OrderBase record);

    int updateByPrimaryKey(OrderBase record);
}