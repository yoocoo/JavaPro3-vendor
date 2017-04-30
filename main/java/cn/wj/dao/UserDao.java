package cn.wj.dao;

import cn.wj.domain.User;
import org.apache.ibatis.annotations.Param;

import java.io.Serializable;
import java.util.List;

/**
 * 在传统的JDBC操作中，我们手动管理数据库的连接的开关，数据库资源访问的开关等等
 * 但是，我们采用mybatis 和 druid这两个框架，那么我们完全可以不必要例会数据库连接等等控制
 * 我们只要专注业务逻辑的实现
 * Created by ThinkPad  WJ on 2017/4/8.
 */
public interface UserDao extends Dao<User> {
	//注册用户
	int add(User user);

	//删除用户
	int del(User user);

	//更新用户
	int update(User user);

	//查找数据库中的用户
	User findOneById(Serializable Id);

	//查询所有用户
	List<User> findAll();

	//用户 sessionId
	void updateLoginSession(@Param("sessionId") String sessionId, @Param("accountName") String accountName);

	//增加用户sessionId
	void addSessionId(String id);

}
