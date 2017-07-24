package cn.wj.service.serviceImpl;

import cn.wj.dao.CashBaseDao;
import cn.wj.domain.CashBase;
import cn.wj.exception.OtherThingsException;
import cn.wj.service.CashBaseService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.List;

/**
 * 说明： 售货机-- 现金表 实时数据
 * 作者： 王娇
 * 时间： 2017 年 07 月 20 日
 * 一更时间： 2017 年 07 月 **日
 */
@Service("cashBaseService")
public class CashBaseServiceImpl implements CashBaseService {
@Autowired
private  CashBaseDao cashBaseDao;//加入事物管理

	/**
	 *1.1.1 (生产商角色、运营商角色、出租商、贸易商） 条件查询下现金表 数据
	 * @param tableName
	 * @param vendorName
	 * @param startTime
	 * @param endTime
	 * @param pageNum
	 * @param pageSize
	 * @return
	 * @throws OtherThingsException
	 */
	public List<CashBase> getAllShengCashName(@Param("tableName") String tableName, @Param("vendorName") String vendorName, @Param("startTime") Timestamp startTime, @Param("endTime") Timestamp endTime, @Param("pageNum") int pageNum, @Param("pageSize") int pageSize) throws OtherThingsException {
		 List<CashBase> sclist = cashBaseDao.getAllShengCashName(tableName, vendorName, startTime, endTime,1,10);
		return sclist;
	}

	/**
	 *1.1.2  (生产商角色、运营商角色、出租商、贸易商） 条件查询下  现金表的记录数据
	 * @param tableName
	 * @param vendorName
	 * @param startTime
	 * @param endTime
	 * @return
	 */
	public int getShengCashCountName(@Param("tableName") String tableName, @Param("vendorName") String vendorName, @Param("startTime") Timestamp startTime, @Param("endTime") Timestamp endTime) {
		return cashBaseDao.getShengCashCountName(tableName, vendorName, startTime, endTime);
	}

	/**
	 *
	 * @param tableName
	 * @param vendorName
	 * @param startTime
	 * @param endTime
	 * @return
	 */
	public BigDecimal getCashInMoney(@Param("tableName") String tableName, @Param("vendorName") String vendorName, @Param("startTime") Timestamp startTime, @Param("endTime") Timestamp endTime) {
		return cashBaseDao.getCashInMoney(tableName, vendorName, startTime, endTime);
	}

	/**
	 *
	 * @param tableName
	 * @param vendorName
	 * @param startTime
	 * @param endTime
	 * @return
	 */
	public BigDecimal getCashOutMoney(@Param("tableName") String tableName, @Param("vendorName") String vendorName, @Param("startTime") Timestamp startTime, @Param("endTime") Timestamp endTime) {
		return cashBaseDao.getCashOutMoney(tableName, vendorName, startTime, endTime);
	}






















	//=========================自动生成=========================
	@Override
	public void add(CashBase cashBase) throws Exception {

	}

	@Override
	public void update(CashBase cashBase) throws Exception {

	}

	@Override
	public List<CashBase> findAll(int pageNum, int pageSize) {
		return null;
	}

}
