package cn.wj.service;
import cn.wj.domain.UserActionLog;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by WJ on 2017/4/24.
 */
public interface ActionLogService  extends BaseService<UserActionLog> {
	void add(HttpServletRequest request);

	/**
	 * 查询所有数据
	 * @param pageNum   页码
	 * @param pageSize  每页的查询数量
	 * @return
	 */
	List<UserActionLog> findAll(int pageNum, int pageSize);

	/**
	 * 获取总条数
	 * @return  获取总条数
	 */
	int getAllCount();

	//测试

	//1.1.2 功能说明：更新第三方支付ID  依据第三放支付KEy   -->
	// void updateLogInfo(@Param("broName") String broName , @Param("broVersion") String broVersion ,@Param("id") long id )throws Exception;
	 void updateLogInfo(UserActionLog userActionLog )throws Exception;
}

