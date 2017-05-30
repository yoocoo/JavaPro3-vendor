package cn.wj.dao;

import cn.wj.domain.CashBase;

public interface CashBaseDao extends Dao<CashBase>{



      //================================自动生成=========================================

    int deleteByPrimaryKey(Integer cashId);

    int insert(CashBase record);

    int insertSelective(CashBase record);

    CashBase selectByPrimaryKey(Integer cashId);

    int updateByPrimaryKeySelective(CashBase record);

    int updateByPrimaryKey(CashBase record);
}