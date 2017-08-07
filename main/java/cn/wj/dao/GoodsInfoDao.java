package cn.wj.dao;

import cn.wj.domain.GoodsInfo;

public interface GoodsInfoDao extends Dao<GoodsInfo> {


	int updateGoodsInfo(GoodsInfo goodsInfo);
	//=================自动生成======================
    int insert(GoodsInfo record);

    int insertSelective(GoodsInfo record);
}