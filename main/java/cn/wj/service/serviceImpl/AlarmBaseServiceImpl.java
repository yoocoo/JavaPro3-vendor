package cn.wj.service.serviceImpl;

import cn.wj.dao.AlarmBaseDao;
import cn.wj.domain.AlarmBase;
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
 * 一更时间： 2017 年 07 月 **日
 */
@Service("alarmBaseService")
public class AlarmBaseServiceImpl implements AlarmBaseService {
	@Autowired
	private AlarmBaseDao alarmBaseDao;

	public List<AlarmBase> getAllShengAlarmName(@Param("tableName") String tableName, @Param("vendorName") String vendorName, @Param("startTime") Timestamp startTime, @Param("endTime") Timestamp endTime, @Param("pageNum") int pageNum, @Param("pageSize") int pageSize) throws Exception {
		List<AlarmBase> saList = alarmBaseDao.getAllShengAlarmName(tableName, vendorName, startTime, endTime, 1, 10);
		return saList;
	}

	public int getShengAlarmCountName(@Param("tableName") String tableName, @Param("vendorName") String vendorName, @Param("startTime") Timestamp startTime, @Param("endTime") Timestamp endTime) {
		return alarmBaseDao.getShengAlarmCountName(tableName, vendorName, startTime, endTime);
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
