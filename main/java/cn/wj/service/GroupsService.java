package cn.wj.service;

import cn.wj.domain.Groups;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 时间：2017 年- 0 8 月 06 日
 * 功能说明： 运营商和系统管理员 对商品的管理列表
 * 作者 ： 王娇
 */
public interface GroupsService extends BaseService<Groups> {

	// 1.1.1 得到 该运营商所拥有的一套商品列表

	List<Groups> getYgoodsList(@Param("agencyId") int agencyId, int pageNum, int pageSize) throws Exception;

	//1.1.2 得到 该运营商所拥有的一套商品列表记录数
	int getYgoodsCount(@Param("agencyId") int agencyId);

	//1.1.3  运营商管理员 更新 商品分组信息
	void updateGroupInfo(Groups groups) throws Exception;

	//2.1.1 运营商管理员新增 分组信息记录
	void yunAddGroup(Groups groups) throws Exception;
}
