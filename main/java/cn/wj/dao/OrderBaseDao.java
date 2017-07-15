package cn.wj.dao;

import cn.wj.domain.OrderBase;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface OrderBaseDao extends Dao<OrderBase> {

	//1.1.1 生产商管理员，查看订单表详情
	List<OrderBase> getAllShengOrder(@Param("tableName") String tableName, @Param("pageNum") int pageNum, @Param("pageSize") int pageSize);

	//1.1.2 生产商管理员，查看订单表总记录数
	int getShengOrderCount(@Param("tableName") String tableName);


	//================================自动生成=========================================
	int deleteByPrimaryKey(Integer orderId);

	int insert(OrderBase record);

	int insertSelective(OrderBase record);

	OrderBase selectByPrimaryKey(Integer orderId);

	int updateByPrimaryKeySelective(OrderBase record);

	int updateByPrimaryKey(OrderBase record);
}