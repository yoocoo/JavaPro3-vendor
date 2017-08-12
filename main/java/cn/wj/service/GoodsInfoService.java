package cn.wj.service;

import cn.wj.domain.GoodsInfo;
import org.apache.ibatis.annotations.Param;

/**
 * Created by ThinkPad on 2017/8/7.
 */
public interface GoodsInfoService extends BaseService<GoodsInfo> {
	//1.1.1  运营商管理员更新 商品信息表
	void updateGoodsInfo(GoodsInfo goodsInfo) throws Exception;
	//1.1.2 运营商管理员 更新 商品图像信息
	void updateGoodsImg(@Param("goodsImg") String goodsImg , @Param("goodsId") int goodsId)throws Exception;
	//2.1.1 运营商管理员 增加商品信息
	void yunAddGoods(GoodsInfo goodsInfo) throws Exception;
	//3.1.1 删除商品信息
	void deleteGoodsInfo(GoodsInfo goodsInfo)throws Exception;
}
