package cn.wj.service.serviceImpl;

import cn.wj.dao.OrderBaseDao;
import cn.wj.domain.OrderBase;
import cn.wj.exception.OtherThingsException;
import cn.wj.service.OrderBaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 说明： 售货机订单实时数据
 * 作者： 王娇
 * 时间： 2017 年 07 月 14 日
 */
@Service("orderBaseService")
public class OrderBaseServiceImpl implements OrderBaseService {
	@Autowired//这里是重点,spring事务管理时,那就一定要加上注解
	private OrderBaseDao  orderBaseDao;

	public List<OrderBase> getAllShengOrder(String tableName,int pageNum, int pageSize) throws OtherThingsException{
		List<OrderBase> soList = orderBaseDao.getAllShengOrder(tableName,1,20);
		return soList;
	}



	public int getShengOrderCount(String tableName) {
		return  orderBaseDao.getShengOrderCount(tableName);
	}


	//==========================自动生成===============================
	@Override
	public void add(OrderBase orderBase) throws Exception {

	}

	@Override
	public void update(OrderBase orderBase) throws Exception {

	}

	@Override
	public List<OrderBase> findAll(int pageNum, int pageSize) {
		return null;
	}


}
