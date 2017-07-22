package cn.wj.service.serviceImpl;

import cn.wj.dao.OrderBaseDao;
import cn.wj.domain.OrderBase;
import cn.wj.exception.OtherThingsException;
import cn.wj.service.OrderBaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.List;

//import java.sql.Date;
//import java.util.Date;

/**
 * 说明： 售货机订单实时数据
 * 作者： 王娇
 * 时间： 2017 年 07 月 14 日
 */
@Service("orderBaseService")
public class OrderBaseServiceImpl implements OrderBaseService {
	@Autowired//这里是重点,spring事务管理时,那就一定要加上注解
	private OrderBaseDao orderBaseDao;

	/**
	 * 1.1.1 时间： 2017  年 07 月 14 日
	 * 功能： (生产商角色、出租商、贸易商） 得到 该生产商全部订订单表 数据
	 *
	 * @param tableName
	 * @param pageNum
	 * @param pageSize
	 * @return
	 * @throws OtherThingsException
	 */
	public List<OrderBase> getAllShengOrder(String tableName, int pageNum, int pageSize) throws OtherThingsException {
		List<OrderBase> soList = orderBaseDao.getAllShengOrder(tableName, 1, 10);
		return soList;
	}

	/**
	 * 1.1.2 时间： 2017  年 07 月 15日
	 * 功能： 得到 (生产商角色、出租商、贸易商）该生产商全部订订单表 数据
	 *
	 * @param tableName
	 * @return
	 */
	public int getShengOrderCount(String tableName) {
		return orderBaseDao.getShengOrderCount(tableName);
	}

	/**
	 * 2.1.1 时间： 2017  年 07 月 14 日
	 * 功能：(生产商角色、运营商角色、出租商、贸易商） 得到 该生产商全部订订单表 数据
	 * * 条件：（1） 按选中的售货机名称 进行数据查询
	 *
	 * @param tableName
	 * @param pageNum
	 * @param pageSize
	 * @return
	 * @throws OtherThingsException
	 */
	public List<OrderBase> getAllShengOrderName(String tableName, String vendorName,
												Timestamp startTime, Timestamp endTime,
												int pageNum, int pageSize) throws OtherThingsException {
		List<OrderBase> sonList = orderBaseDao.getAllShengOrderName(tableName, vendorName, startTime, endTime, 1, 10);
		return sonList;
	}

	/**
	 * 2.1.2 时间： 2017  年 07 月 15日
	 * 功能： (生产商角色、运营商角色、出租商、贸易商）得到 该生产商全部订订单表 数据
	 * 条件：（1） 按选中的售货机名称 进行数据查询
	 *
	 * @param tableName
	 * @return
	 */

	public int getShengOrderCountName(String tableName, String vendorName,
									  Timestamp startTime, Timestamp endTime) {
		return orderBaseDao.getShengOrderCountName(tableName, vendorName, startTime, endTime);
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
