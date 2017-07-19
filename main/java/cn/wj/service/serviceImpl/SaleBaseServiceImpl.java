package cn.wj.service.serviceImpl;

import cn.wj.dao.SaleBaseDao;
import cn.wj.domain.SaleBase;
import cn.wj.exception.OtherThingsException;
import cn.wj.service.SaleBaseService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.List;

/**
 * 说明： 售货机-- 销售表 实时数据
 * 作者： 王娇
 * 时间： 2017 年 07 月 18日
 */
@Service("saleBaseService")
public class SaleBaseServiceImpl implements SaleBaseService {
	@Autowired
	private SaleBaseDao saleBaseDao;//加入事物管理

	/**
	 * 说明：生产商角色 查看 指定  时间段 和 指定售货机 的销售订单 列表
	 * 时间：2017 07 月 18 日
	 * 作者：王娇
	 * @param tableName
	 * @param vendorName
	 * @param startTime
	 * @param endTime
	 * @param pageNum
	 * @param pageSize
	 * @return
	 * @throws OtherThingsException
	 */
	public List<SaleBase> getAllShengSaleName(@Param("tableName") String tableName,
											  @Param("vendorName") String vendorName,
											  @Param("startTime") Timestamp startTime,
											  @Param("endTime") Timestamp endTime,
											  @Param("pageNum") int pageNum,
											  @Param("pageSize") int pageSize) throws OtherThingsException {

		List<SaleBase> ssList = saleBaseDao.getAllShengSaleName(tableName, vendorName, startTime, endTime, 1, 10);
		return ssList;
	}

	/**
	 * 说明：1.1.2生产商角色 查看 指定  时间段 和 指定售货机 的销售订单总记录数 列表
	 * 时间：2017 07 月 18 日
	 * 作者： 王娇
	 * @param tableName
	 * @param vendorName
	 * @param startTime
	 * @param endTime
	 * @return
	 */
	public int getShengSaleCountName(@Param("tableName") String tableName,
									 @Param("vendorName") String vendorName,
									 @Param("startTime") Timestamp startTime,
									 @Param("endTime") Timestamp endTime) {
		return saleBaseDao.getShengSaleCountName(tableName, vendorName, startTime, endTime);
	}

	//==================================自动生成====================================
	@Override
	public void add(SaleBase saleBase) throws Exception {

	}

	@Override
	public void update(SaleBase saleBase) throws Exception {

	}

	@Override
	public List<SaleBase> findAll(int pageNum, int pageSize) {
		return null;
	}
}
