package cn.wj.service;

import cn.wj.domain.GoodsInfo;

/**
 * Created by ThinkPad on 2017/8/7.
 */
public interface GoodsInfoService extends BaseService<GoodsInfo> {
	//1.1.1  运营商管理员更新 商品信息表
	void updateGoodsInfo(GoodsInfo goodsInfo) throws Exception;
}
