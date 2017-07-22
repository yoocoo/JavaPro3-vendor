package cn.wj.dao;

import cn.wj.domain.CashBase;
import org.apache.ibatis.annotations.Param;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.List;

/**
 * 说明： 售货机-- 现金表 实时数据
 * 作者： 王娇
 * 时间： 2017 年 07 月 20 日
 * 一更时间： 2017 年 07 月 **日
 */

public interface CashBaseDao extends Dao<CashBase> {

	// 1.1.1   (生产商角色、运营商角色、出租商、贸易商） 查看 指定  时间段 和 指定售货机 的 现金表 列表
	List<CashBase> getAllShengCashName(@Param("tableName") String tableName,
									   @Param("vendorName") String vendorName,
									   @Param("startTime") Timestamp startTime,
									   @Param("endTime") Timestamp endTime,
									   @Param("pageNum") int pageNum,
									   @Param("pageSize") int pageSize);

	//1.1.2  (生产商角色、运营商角色、出租商、贸易商） 查看 指定  时间段 和 指定售货机 的  现金表总记录数 列表
	int getShengCashCountName(@Param("tableName") String tableName,
							  @Param("vendorName") String vendorName,
							  @Param("startTime") Timestamp startTime,
							  @Param("endTime") Timestamp endTime);

	//  1.1.3 (生产商角色、运营商角色、出租商、贸易商）  自己收的钱： 条件查询下的 统计 ： 总计（1） 现金表中 收入
	BigDecimal getCashInMoney(@Param("tableName") String tableName,
							  @Param("vendorName") String vendorName,
							  @Param("startTime") Timestamp startTime,
							  @Param("endTime") Timestamp endTime);


	//1.1.4 (生产商角色、运营商角色、出租商、贸易商） 给别人的钱 ：  条件查询下的 统计 ： 总计（1） 时间段内条件查询下 现金表中找零
	BigDecimal getCashOutMoney(@Param("tableName") String tableName,
							   @Param("vendorName") String vendorName,
							   @Param("startTime") Timestamp startTime,
							   @Param("endTime") Timestamp endTime);

	//==========2017年 07月20 日=========================================
	//1.1.5 (生产商角色、运营商角色、出租商、贸易商）  条件查询下的 统计 ： 总 总销售价格-->
	//int getAllCashNum(@Param("tableName") String tableName,
	//                  @Param("vendorName") String vendorName);

	//1.1.6 (生产商角色、运营商角色、出租商、贸易商）   条件查询下的 统计 ： 总计 时间段内条件查询下销售总价-->
	//int getCashNum(@Param("tableName") String tableName,
	//               @Param("vendorName") String vendorName,
	//               @Param("startTime") Timestamp startTime,
	//               @Param("endTime") Timestamp endTime);


	//================================自动生成=========================================

	int deleteByPrimaryKey(Integer cashId);

	int insert(CashBase record);

	int insertSelective(CashBase record);

	CashBase selectByPrimaryKey(Integer cashId);

	int updateByPrimaryKeySelective(CashBase record);

	int updateByPrimaryKey(CashBase record);
}