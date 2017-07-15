package cn.wj.service;

import cn.wj.domain.OrderBase;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 说明： 售货机订单实时数据
 * 作者： 王娇
 * 时间： 2017 年 07 月 14 日
 */
public interface  OrderBaseService  extends BaseService<OrderBase>{
	//1.1.1 生产商管理员，查看订单表详情
	List<OrderBase> getAllShengOrder(@Param("ordertName") String ordertName, int pageNum, int pageSize) throws Exception;
	//1.1.2 生产商管理员，查看订单表总记录数
	int getShengOrderCount(@Param("ordertName") String ordertName);
}
