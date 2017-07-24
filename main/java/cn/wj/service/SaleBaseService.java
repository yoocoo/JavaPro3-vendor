package cn.wj.service;

import cn.wj.domain.SaleBase;
import org.apache.ibatis.annotations.Param;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.List;

/**
 * 说明： 售货机-- 销售表 实时数据
 * 作者： 王娇
 * 时间： 2017 年 07 月 18日
 * 一更时间: 2017 年 07 月1 19 日
 */
public interface SaleBaseService  extends BaseService<SaleBase>{
	//1.1.1 (生产商角色、运营商角色、出租商、贸易商） 查看 指定  时间段 和 指定售货机 的销售订单 列表
	List<SaleBase> getAllShengSaleName(@Param("tableName") String tableName,
									   @Param("vendorName") String vendorName,
									   @Param("startTime") Timestamp startTime,
									   @Param("endTime") Timestamp endTime,
									   @Param("pageNum") int pageNum,
									   @Param("pageSize") int pageSize)throws Exception;
	//1.1.(生产商角色、运营商角色、出租商、贸易商） 查看 指定  时间段 和 指定售货机 的销售订单总记录数 列表
	int getShengSaleCountName(@Param("tableName") String tableName,
							  @Param("vendorName") String vendorName,
							  @Param("startTime") Timestamp startTime,
							  @Param("endTime") Timestamp endTime);

	//  1.1.3 (生产商角色、运营商角色、出租商、贸易商）  条件查询下的 统计 ： 总计 总销售数量-->
	BigDecimal getAllSaleMoney(@Param("tableName") String tableName,
						@Param("vendorName") String vendorName);

	//1.1.4 (生产商角色、运营商角色、出租商、贸易商）  条件查询下的 统计 ： 总 总销售价格-->
	  int getAllSaleNum(@Param("tableName") String tableName,
							 @Param("vendorName") String vendorName);

	//==========2017年 07月19 日=========================================
	//1.1.5 (生产商角色、运营商角色、出租商、贸易商）  条件查询下的 统计 ： 总计 时间段内条件查询下销售数量-->
	BigDecimal getSaleMoney(@Param("tableName") String tableName,
					 @Param("vendorName") String vendorName,
					 @Param("startTime") Timestamp startTime,
					 @Param("endTime") Timestamp endTime);

	//1.1.6 (生产商角色、运营商角色、出租商、贸易商）  条件查询下的 统计 ： 总计 时间段内条件查询下销售总价-->
	int getSaleNum(@Param("tableName") String tableName,
						  @Param("vendorName") String vendorName,
						  @Param("startTime") Timestamp startTime,
						  @Param("endTime") Timestamp endTime);



}
