package cn.wj.dao;

import cn.wj.domain.CashSaleBase;

public interface CashSaleBaseDao extends Dao<CashSaleBaseDao> {
    int insert(CashSaleBase record);

    int insertSelective(CashSaleBase record);
}