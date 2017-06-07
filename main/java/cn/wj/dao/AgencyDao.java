package cn.wj.dao;

import cn.wj.domain.Agency;

import java.io.Serializable;

public interface AgencyDao extends Dao<Agency> {

    int add(Agency agency);

    //运营商表 增加记录
    //int addagency(Agency agency);
    //查找数据库中的用户
     Agency findOneById(Serializable Id);

    //更新 运营商 表格记录
    int update(Agency agency);

    //int insert(Agency record);
	//
    //int insertSelective(Agency record);
}