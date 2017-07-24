package cn.wj.dao;

import cn.wj.domain.Menu;
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

/**
 * @ Repository 用于标注数据访问组件,即DAO组件;
 * @ Repository 注解便属于最先引入的一批，它用于将数据访问层(DAO 层)的类标识为 Spring Bean。
 * 具体只需将该注解标注在 DAO类上即可。同时，为了让 Spring 能够扫描类路径中的类并识别出@ Repository 注解，
 * 需要在 XML 配置文件中启用Bean 的自动扫描功能，这可以通过<context:component-scan/>实现。
 */


public interface UserDao extends Dao<User> {
	//10.1.1 jquery DataTable +PageHelper  服务器端分页
	int getAllCount();

	//1.1.1 查找数据库中的用户，查找用户是否存在
	User findOneById(Serializable Id);

	//1.1.3查找User表中 所有用户  6.12日 加入物理分页（暂时未用到）
	List<User> selectUserByAccountName(@Param("accountName") String accountName);

	//2.1 注册普通用户（暂时未用到）
	int add(User user);

	//2.2.1 系统管理员注册一级用户( 生产商管理员用户 ，记住 factory_id 是后期更新上去的 )

	int sysuseradd(User user);

	//2.2.2 创建动态的生产商的 订单表
	int createOrderTable(@Param("tableName") String tableName);

	//2.2.3  创建动态的生产商的 销售表
	int createSaleTable(@Param("tableName") String tableName);

	//2.2.4 创建动态的生产商的 金钱表
	int createCashTable(@Param("tableName") String tableName);

	//2.2.5 创建动态的生产商的 金钱和销售关联表
	int createCashSaleTable(@Param("tableName") String tableName);

	//2.2.6 动态创建 生产商的警告表
	int createAlarmTable(@Param("tableName") String tableName);

	//2.2.7-注入运营商归属的factory_id 到user表中  6.13号 创建生产商用户后，更新用户表中 factoryId
	int updateFactoryId(@Param("factoryId") int factoryId, @Param("accountName") String accountName);


	//2.3.1  6.13 号增加语句-注册二级管理用户(运营商管理用户) ,记住  factory_id 是生产商用户登录的 记录的 factory_id 值，可手输入
	int sysuseraddYun(User user);

	//2.3.2 更新用户表中 agencyId
	int updateAgencyId(@Param("agencyId") int agencyId, @Param("accountName") String accountName);

	//2.3.3  7.5 号增加语句-注册三级用户(运营商配货员，仓库员)
	int sysuseraddYunPei(User user);

	//（暂时未用到）2.1.1.1-注入运营商归属的factory_id 到user表中  6.13号
	int addAgencyToFactoryId(User user);

	//（暂时未用到）2.2.2.1-注入运营商归属的factory_id 到user表中  6.13号
	int selectFactoryIdByName(String accountName);


	//3删除用户（物理删除，不建议使用）
	int del(User user);

	//4.1更新用户(全局普通更新)
	int update(User user);

	//5.2更新用户头像(全局普通更新)
	int updateImage(@Param("headImage") String headImage, @Param("accountName") String Name);

	//5.1查找用户头像地址，用于动态显示头像(全局普通更新)
	String findPathById(String accountName);

	//6.1 查询所有用户（暂时未用到）
	//List<User> findAll(Page page);

	//7.1根据用户ID 获得权限菜单
	List<Menu> getMenuByUserId(@Param("userId") int userId);

	//8.1根据用户名获得该用户的ID
	int selectUserIdByName(String accountName);

	//9.1  6.20日 物理分页 处理数据  得到所有用户列表
	//List<User> getAllUserList(PageObject page);
	List<User> getAllUserList(User user);

	//9.2  6.20日  冻结可疑账户在用户列表中，删除某个用户（操作：把user表中approve字段设置为0），说明：系统管理员：冻结 新注册用户
	int removeUser(@Param("userId") int userId);

	//9.3 7.7 日 审核通过在用户列表中，审核某个用户（操作：把user表中approve字段设置1）,说明：系统管理员：审核 新注册用户
	int passUser(@Param("userId") int userId);

	//用户 sessionId（暂时未用到）
	void updateLoginSession(@Param("sessionId") String sessionId, @Param("accountName") String accountName);

	//增加用户sessionId（暂时未用到）
	void addSessionId(String id);


}
