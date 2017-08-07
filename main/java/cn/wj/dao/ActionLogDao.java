package cn.wj.dao;

import cn.wj.domain.UserActionLog;
import org.apache.ibatis.annotations.Param;

import java.io.Serializable;
import java.util.List;

/**
 * 分页列表重点在于列表局部刷新，减少页面请求
 * Created by ThinkPad on 2017/4/24.
 */
public interface ActionLogDao extends Dao<UserActionLog> {
	int add(UserActionLog userActionLog);

	UserActionLog findOneById(Serializable Id);

	/**
	 * sql 分页查询
	 *sql映射文件里加入这两个参数
	 * @param
	 * @return
	 */
	//注解@Param()，同时在注解中填写了对应的名字
	//我在xml文件中的select语句的id为findAll也和Dao中的方法相对应，resultType返回数据类型设定为UserActionLog。
	//通过这样简单的设定就可以实现列表查找了。

	List<UserActionLog> findAll(@Param("pageNum") int pageNum, @Param("pageSize") int pageSize);

	int getAllCount();

	//测试

	//1.1.2 功能说明：更新第三方支付ID  依据第三放支付KEy   -->
	//int updateLogInfo(@Param("broName") String broName ,@Param("broVersion") String broVersion ,@Param("id") long id );
	int updateLogInfo(UserActionLog userActionLog);

}
