package cn.wj.dao;

import cn.wj.domain.AlarmBase;
import org.apache.ibatis.annotations.Param;

import java.sql.Timestamp;
import java.util.List;

/**
 * 说明： 售货机-- 故障表 实时数据
 * 作者： 王娇
 * 时间： 2017 年 07 月 20 日
 * 一更时间： 2017 年 07 月 24日
 */
public interface AlarmBaseDao extends Dao<AlarmBase> {


	// 1.1.1  生产商角色 查看 指定  时间段 和 指定售货机 的 现金表 列表
	List<AlarmBase> getAllShengAlarmName(@Param("tableName") String tableName,
										 @Param("vendorName") String vendorName,
										 @Param("startTime") Timestamp startTime,
										 @Param("endTime") Timestamp endTime,
										 @Param("pageNum") int pageNum,
										 @Param("pageSize") int pageSize);

	//1.1.2 生产商角色 查看 指定  时间段 和 指定售货机 的  现金表总记录数 列表
	int getShengAlarmCountName(@Param("tableName") String tableName,
							   @Param("vendorName") String vendorName,
							   @Param("startTime") Timestamp startTime,
							   @Param("endTime") Timestamp endTime);


	// 1.2.1   (生产商角色、运营商角色、出租商、贸易商） 查看  未确认警报的 警告表 列表
	List<AlarmBase> getNoAlarmName(@Param("tableName") String tableName,

								   @Param("pageNum") int pageNum,
								   @Param("pageSize") int pageSize);

	//1.2.2  (生产商角色、运营商角色、出租商、贸易商） 查看 未确认警报的  警告表总记录数 列表
	int getNoAlarmCountName(@Param("tableName") String tableName
	);

	// 1.2.3  (生产商角色、运营商角色、出租商、贸易商） 进行确认故障
	int AlarmAcked(@Param("tableName") String tableName,
				   @Param("ackUser") String ackUser,
				   @Param("alarmId") int alarmId);

	//===========自动生成============
	int deleteByPrimaryKey(Integer alarmId);

	int insert(AlarmBase record);

	int insertSelective(AlarmBase record);

	AlarmBase selectByPrimaryKey(Integer alarmId);

	int updateByPrimaryKeySelective(AlarmBase record);

	int updateByPrimaryKey(AlarmBase record);
}