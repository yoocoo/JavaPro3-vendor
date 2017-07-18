package cn.wj.service;

import cn.wj.domain.OrderBase;
import org.apache.ibatis.annotations.Param;

import java.sql.Timestamp;
import java.util.List;

//import java.util.Date;
//import java.sql.Date;

/**
 * 说明： 售货机订单实时数据
 * 作者： 王娇
 * 时间： 2017 年 07 月 14 日
 */
public interface OrderBaseService extends BaseService<OrderBase> {
	//1.1.1 生产商管理员，查看订单表详情
	List<OrderBase> getAllShengOrder(@Param("ordertName") String ordertName, int pageNum, int pageSize) throws Exception;

	//1.1.2 生产商管理员，查看订单表总记录数
	int getShengOrderCount(@Param("ordertName") String ordertName);

	//2.1.1 生产商管理员，查看订单表详情 条件（1）：按 选择售货机名称段查询
	List<OrderBase> getAllShengOrderName(@Param("tableName") String tableName,
										 @Param("vendorName") String vendorName,
										 @Param("startTime") Timestamp startTime ,
										 @Param("endTime") Timestamp endTime ,
										 //@Param("startTime") Date startTime ,
										 //@Param("endTime")  Date endTime ,
										 @Param("pageNum") int pageNum,
										 @Param("pageSize") int pageSize) throws Exception;

	//2.1.2 生产商管理员，查看订单表总记录数 条件（1）：按选择售货机名称段查询
	int getShengOrderCountName(@Param("tableName") String tableName,
							   @Param("vendorName") String vendorName,
							   @Param("startTime") Timestamp startTime ,
							   @Param("endTime") Timestamp endTime);
							   //@Param("startTime") Date startTime ,
							   //@Param("endTime") Date endTime );
}
