package cn.wj.dao;

import cn.wj.domain.GoodsInfo;
import org.apache.ibatis.annotations.Param;

public interface GoodsInfoDao extends Dao<GoodsInfo> {

	//1.1.1 运营商管理员 更新 商品信息
	int updateGoodsInfo(GoodsInfo goodsInfo);
	//1.1.2 运营商管理员 更新 商品图像信息
	int updateGoodsImg(@Param("goodsImg") String goodsImg , @Param("goodsId") int goodsId);
	//2.1.1 运营商管理员 增加商品信息
	int yunAddGoods(GoodsInfo goodsInfo);
	//3.1.1 删除商品信息
	int deleteGoodsInfo(GoodsInfo goodsInfo);

	//=================自动生成======================
	int insert(GoodsInfo record);

	int insertSelective(GoodsInfo record);
}