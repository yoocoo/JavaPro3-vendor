package cn.wj.dao;

import cn.wj.domain.CashSaleBase;

public interface CashSaleBaseDao extends Dao<CashSaleBase> {
    int insert(CashSaleBase record);

    int insertSelective(CashSaleBase record);
}