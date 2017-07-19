package cn.wj.dao;

import cn.wj.domain.SaleBase;
import org.apache.ibatis.annotations.Param;

import java.sql.Timestamp;
import java.util.List;

/**
 * 说明： 售货机-- 销售表 实时数据
 * 作者： 王娇
 * 时间： 2017 年 07 月 18 日
 */
public interface SaleBaseDao extends Dao<SaleBase> {

	//1.1.1 生产商角色 查看 指定  时间段 和 指定售货机 的销售订单 列表
	List<SaleBase> getAllShengSaleName(@Param("tableName") String tableName,
									   @Param("vendorName") String vendorName,
									   @Param("startTime") Timestamp startTime,
									   @Param("endTime") Timestamp endTime,
									   @Param("pageNum") int pageNum,
									   @Param("pageSize") int pageSize);
	//1.1.2生产商角色 查看 指定  时间段 和 指定售货机 的销售订单总记录数 列表
	int getShengSaleCountName(@Param("tableName") String tableName,
							  @Param("vendorName") String vendorName,
							  @Param("startTime") Timestamp startTime,
							  @Param("endTime") Timestamp endTime);


	//================================自动生成=========================================
	int deleteByPrimaryKey(Integer saleId);

	int insert(SaleBase record);

	int insertSelective(SaleBase record);

	SaleBase selectByPrimaryKey(Integer saleId);

	int updateByPrimaryKeySelective(SaleBase record);

	int updateByPrimaryKey(SaleBase record);
}