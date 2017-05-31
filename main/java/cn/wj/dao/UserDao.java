package cn.wj.dao;

import cn.wj.domain.Menu;
import cn.wj.domain.Page;
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
	//1.1注册普通用户
	int add(User user);

	//2.1系统管理员注册一级用户( 运营商、 生产商 )
	int sysuseradd(User user);

	//2.2更新用户表中 agencyId
	int updateAgencyId(User  user);

	//2.3更新用户表中 factoryId
	int updateFactoryId(User  user);

	//2.4  创建动态的生产商的 订单表
	 int createOrderTable(@Param("tableName") String tableName);

	//3删除用户
	int del(User user);

	//4.1更新用户
	int update(User user);

	//4.2更新用户头像
	int updateImage(User user);

	//1.2查找数据库中的用户
	User findOneById(Serializable Id);

	//4.3查找用户头像地址，用于动态显示头像
	String findPathById(String accountName);

	//1.3查询所有用户
	List<User> findAll(Page page);

	//用户 sessionId
	void updateLoginSession(@Param("sessionId") String sessionId, @Param("accountName") String accountName);

	//增加用户sessionId
	void addSessionId(String id);

	//根据用户ID 获得权限菜单
	List<Menu> getMenuByUserId(@Param("userId") int userId);

	//根据用户名获得该用户的ID
	int selectUserIdByName(String accountName);


}
