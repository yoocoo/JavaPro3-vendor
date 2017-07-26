package cn.wj.dao;

import cn.wj.domain.VendorLocation;

/**
 * 说明： 售货机-- 地点投放
 * 作者： 王娇
 * 时间： 2017 年 07 月 25 日
 * 一更时间： 2017 年 07 月 ** 日
 */
public interface VendorLocationDao extends Dao<VendorLocation>{


	//===============================自动生成===================
	int insert(VendorLocation record);

	int insertSelective(VendorLocation record);
}

