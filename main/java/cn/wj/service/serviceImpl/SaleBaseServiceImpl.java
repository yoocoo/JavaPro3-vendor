package cn.wj.service.serviceImpl;

import cn.wj.dao.SaleBaseDao;
import cn.wj.domain.SaleBase;
import cn.wj.exception.OtherThingsException;
import cn.wj.service.SaleBaseService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
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
	 * 说明：1.1.1 生产商角色 查看 指定  时间段 和 指定售货机 的销售订单 列表
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
	 * 时间：2017 07 月 19 日
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

	/**
	 * 说明 1.1.3 （生产商角色、、、）  条件查询下的 统计 ： 总计（1） 总销售数量
	 * 时间：2017 07 月 19 日
	 * 作者： 王娇
	 * @param tableName
	 * @param vendorName
	 * @return
	 */
	public BigDecimal getAllSaleMoney(@Param("tableName") String tableName, @Param("vendorName") String vendorName) {
		return  saleBaseDao.getAllSaleMoney(tableName,vendorName);
	}

	/**
	 *  说明：1.1.4  (生产商角色、、、）  条件查询下的 统计 ： 总计（1） 总销售价格
	 * 时间：2017 07 月 19 日
	 * 作者： 王娇
	 * @param tableName
	 * @param vendorName
	 * @return
	 */
	public int getAllSaleNum(@Param("tableName") String tableName, @Param("vendorName") String vendorName) {
		return saleBaseDao.getAllSaleNum(tableName,vendorName);
	}

	/**
	 *  说明：1.1.5 (生产商角色、、、）   条件查询下的 统计 ： 总计（1） 时间段内条件查询下销售数量
	 * 时间：2017 07 月 19 日
	 * 作者： 王娇
	 * @param tableName
	 * @param vendorName
	 * @param startTime
	 * @param endTime
	 * @return
	 */
	public BigDecimal getSaleMoney(@Param("tableName") String tableName, @Param("vendorName") String vendorName, @Param("startTime") Timestamp startTime, @Param("endTime") Timestamp endTime) {
		return saleBaseDao.getSaleMoney(tableName,vendorName,startTime,endTime);
	}

	/**
	 *  说明：11.1.6 (生产商角色、、、）   条件查询下的 统计 ： 总计（1） 时间段内条件查询下销售总价
	 * 时间：2017 07 月 19 日
	 * 作者： 王娇
	 * @param tableName
	 * @param vendorName
	 * @param startTime
	 * @param endTime
	 * @return
	 */
	public int getSaleNum(@Param("tableName") String tableName, @Param("vendorName") String vendorName, @Param("startTime") Timestamp startTime, @Param("endTime") Timestamp endTime) {
		return saleBaseDao.getSaleNum(tableName,vendorName,startTime,endTime);
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
