package cn.wj.service.serviceImpl;

import cn.wj.dao.AlarmBaseDao;
import cn.wj.domain.AlarmBase;
import cn.wj.exception.OtherThingsException;
import cn.wj.service.AlarmBaseService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.List;

/**
 * 说明： 售货机-- 故障表 实时数据
 * 作者： 王娇
 * 时间： 2017 年 07 月 20 日
 * 一更时间： 2017 年 07 月 24 日
 */
@Service("alarmBaseService")
public class AlarmBaseServiceImpl implements AlarmBaseService {
	@Autowired
	private AlarmBaseDao alarmBaseDao;

	/**
	 * 1.1.1 (生产商角色、运营商角色、出租商、贸易商） 条件查询下：警告表列表
	 * @param tableName
	 * @param vendorName
	 * @param startTime
	 * @param endTime
	 * @param pageNum
	 * @param pageSize
	 * @return
	 * @throws Exception
	 */
	public List<AlarmBase> getAllShengAlarmName(@Param("tableName") String tableName, @Param("vendorName") String vendorName, @Param("startTime") Timestamp startTime, @Param("endTime") Timestamp endTime, @Param("pageNum") int pageNum, @Param("pageSize") int pageSize) throws Exception {
		List<AlarmBase> saList = alarmBaseDao.getAllShengAlarmName(tableName, vendorName, startTime, endTime, 1, 10);
		return saList;
	}

	/**
	 * 1.1.2 (生产商角色、运营商角色、出租商、贸易商） 条件查询下：警告表记录数
	 * @param tableName
	 * @param vendorName
	 * @param startTime
	 * @param endTime
	 * @return
	 */
	public int getShengAlarmCountName(@Param("tableName") String tableName, @Param("vendorName") String vendorName, @Param("startTime") Timestamp startTime, @Param("endTime") Timestamp endTime) {
		return alarmBaseDao.getShengAlarmCountName(tableName, vendorName, startTime, endTime);
	}

	/**
	 * 1.2.1   (生产商角色、运营商角色、出租商、贸易商） 查看  未确认警报的 警告表 列表
	 * @param tableName

	 * @param pageNum
	 * @param pageSize
	 * @return
	 * @throws Exception
	 */
	public List<AlarmBase> getNoAlarmName(@Param("tableName") String tableName,
										  @Param("pageNum") int pageNum,
										  @Param("pageSize") int pageSize) throws Exception {
		List<AlarmBase> anList =alarmBaseDao.getNoAlarmName(tableName, 1, 10);
		return anList;
	}

	/**
	 * 1 .2.2  (生产商角色、运营商角色、出租商、贸易商） 查看 未确认警报的  警告表总记录数 列表
	 * @param tableName

	 * @return
	 */
	public int getNoAlarmCountName(@Param("tableName") String tableName
	) {
		return alarmBaseDao.getNoAlarmCountName(tableName);
	}

	/**
	 * 功能说明：2.2.3  生产商用户 通过新注册 售货机 ，使得 vendor表里 check ==1 即可，
	 * 说明:生产商管理员：  审核新注册售货机
	 * 时间：2017 年 07 月 24 日
	 *
	 * @param alarmId
	 * @throws OtherThingsException
	 */
	public void AlarmAcked(String tableName, String ackUser, int alarmId) throws OtherThingsException {
		int result1 = 0;//受影响的行数默认为零
		try {
			result1 = alarmBaseDao.AlarmAcked(tableName, ackUser,alarmId);
		} catch (Exception e) {
			System.out.println("确认 故障 失败");
			//其他用户添加失败异常
			throw new OtherThingsException(e);
		}
		if (result1 > 0) {
			System.out.println("确认 故障 成功！");
		}

	}


	//========================自动生成=======================================
	@Override
	public void add(AlarmBase alarmBase) throws Exception {

	}

	@Override
	public void update(AlarmBase alarmBase) throws Exception {

	}

	@Override
	public List<AlarmBase> findAll(int pageNum, int pageSize) {
		return null;
	}
}
