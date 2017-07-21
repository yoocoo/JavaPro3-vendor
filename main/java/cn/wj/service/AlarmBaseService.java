package cn.wj.service;

import cn.wj.domain.AlarmBase;
import org.apache.ibatis.annotations.Param;

import java.sql.Timestamp;
import java.util.List;
/**
 * 说明： 售货机-- 故障表 实时数据
 * 作者： 王娇
 * 时间： 2017 年 07 月 20 日
 * 一更时间： 2017 年 07 月 **日
 */
public interface AlarmBaseService extends BaseService<AlarmBase>{

	// 1.1.1  生产商角色 查看 指定  时间段 和 指定售货机 的 故障 列表
	List<AlarmBase> getAllShengAlarmName(@Param("tableName") String tableName,
										 @Param("vendorName") String vendorName,
										 @Param("startTime") Timestamp startTime,
										 @Param("endTime") Timestamp endTime,
										 @Param("pageNum") int pageNum,
										 @Param("pageSize") int pageSize)throws Exception;

	//1.1.2 生产商角色 查看 指定  时间段 和 指定售货机 的  故障表总记录数 列表
	int getShengAlarmCountName(@Param("tableName") String tableName,
							   @Param("vendorName") String vendorName,
							   @Param("startTime") Timestamp startTime,
							   @Param("endTime") Timestamp endTime);
}
