package cn.wj.dao;

import cn.wj.domain.SaleBase;

public interface SaleBaseDao extends Dao<SaleBase>{




    //================================自动生成=========================================
    int deleteByPrimaryKey(Integer saleId);

    int insert(SaleBase record);

    int insertSelective(SaleBase record);

    SaleBase selectByPrimaryKey(Integer saleId);

    int updateByPrimaryKeySelective(SaleBase record);

    int updateByPrimaryKey(SaleBase record);
}