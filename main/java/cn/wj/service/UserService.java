package cn.wj.service;

import cn.wj.domain.Menu;
import cn.wj.domain.User;

import java.util.List;

/**
 * 说明： 用户管理业务逻辑
 * 作者： 王娇
 * 时间： 2017 年 06 月 10 日
 */
public interface UserService extends BaseService<User> {
	/**
	 * 10.1.1 jquery DataTable +PageHelper  服务器端分页
	 * @return
	 */
	int getAllCount();
	/**
	 * 2.1 注册普通用户(暂时未用到，注册页面可以套用)
	 *
	 * @param user
	 * @throws Exception
	 */
	void add(User user) throws Exception;

	/**
	 *1.1.3 查找User表中 所有用户  6.12日 加入物理分页（暂时未用到）
	 * @param accountName
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	//PagedResult<User> queryByPage(String accountName,Integer pageNo,Integer pageSize);

	/**
	 * 2.2.1  系统管理员注册 一级管理用户( 生产商管理员用户 ，记住 factory_id 是后期更新上去的 )
	 *
	 * @param user
	 * @throws Exception
	 */
	void sysuseradd(User user) throws Exception;

	/**
	 * 2.3.1 6.13 号增加语句-注册二级管理用户(运营商管理用户) ,记住  factory_id 是生产商用户登录的 记录的 factory_id 值，可手输入
	 *
	 * @param user
	 * @throws Exception
	 */
	void sysuseraddYun(User user) throws Exception;

	/**
	 * 2.3.2 更新 用户表中 agencyId
	 *
	 * @param accountName
	 */
	void updateAgencyId(int agencyId, String accountName) throws Exception;

	/**
	 * 2.3.3  7.5 号增加语句-注册三级用户(运营商配货员，仓库员)
	 *
	 * @param user
	 * @throws Exception
	 */
	void sysuseraddYunPei(User user) throws Exception;

	/**
	 * （暂时未用到） 2.2.2.1-注入运营商归属的factory_id 到user表中  6.13号
	 *
	 * @param accountName
	 */
	void selectFactoryIdByName(String accountName) throws Exception;

	/**
	 * （暂时未用到） 2.2.2.2-注入运营商归属的factory_id 到user表中  6.13号
	 *
	 * @param user
	 * @throws Exception
	 */

	void addAgencyToFactoryId(User user) throws Exception;

	/**
	 * 2.2.7 更新 用户表中 factoryId
	 *
	 * @param accountName
	 */
	void updateFactoryId(int factoryId, String accountName) throws Exception;
	//void updateFactoryId(User user) throws Exception;

	/**
	 * 2.2.2 创建动态的生产商的 订单表
	 *
	 * @param tableName
	 * @return
	 */
	void createOrderTable(String tableName) throws Exception;

	/**
	 * 2.2.3  创建动态的生产商的 销售表
	 *
	 * @param tableName
	 * @throws Exception
	 */
	void createSaleTable(String tableName) throws Exception;

	/**
	 * 2.2.4 创建动态的生产商的 金钱表
	 *
	 * @param tableName
	 * @throws Exception
	 */
	void createCashTable(String tableName) throws Exception;

	/**
	 * 2.2.5 创建动态的生产商的 金钱和销售关联表
	 *
	 * @param tableName
	 * @throws Exception
	 */
	void createCashSaleTable(String tableName) throws Exception;

	/**
	 * 2.2.6 动态创建 生产商的警告表
	 *
	 * @param tableName
	 * @throws Exception
	 */
	void createAlarmTable(String tableName) throws Exception;

	/**
	 * 4.1更新用户(全局普通更新)
	 *
	 * @param user
	 * @throws Exception
	 */
	void update(User user) throws Exception;

	/**
	 * 查找用户用户头像路径，用于后台首页系显示
	 * 5.1 查找用户头像地址，用于动态显示头像(全局普通更新)
	 *
	 * @param accountName
	 * @return
	 */
	String findPathById(String accountName);

	/**
	 * 更新用户头像
	 * 5.2 更新用户头像(全局普通更新)
	 *
	 * @param
	 * @throws Exception
	 */
	void updateImage(String headImage, String accountName) throws Exception;

	/**
	 * 1.1.2 查找数据库中用户（注册时查重和登录时判空）
	 *
	 * @param user
	 * @return
	 * @throws Exception
	 */
	User findUser(User user) throws Exception;

	/**
	 * 更新用户session（暂时未用到）
	 *
	 * @param sessionId
	 * @param accountName
	 * @throws Exception
	 */
	void updateLoginSession(String sessionId, String accountName) throws Exception;

	/**
	 * 用户列表（查找所有用户，带分页）（暂时未用到）
	 *
	 * @param pageNum  页码
	 * @param pageSize 每页的查询数量
	 * @return 返回用户列表
	 */
	List<User> findAll(int pageNum, int pageSize);

	/**
	 * 根据用户ID 获得 该用户的菜单
	 * 7 .1 根据用户ID 获得权限菜单
	 *
	 * @param userId
	 * @return
	 */
	List<Menu> getMenu(int userId);

	/**
	 * 8.1根据用户名 获得该用户的ID
	 *
	 * @param accountName
	 * @return
	 */
	int getUserIdByName(String accountName);

	/**
	 * 9.1  6.20日 物理分页 处理数据  得到所有用户列表
	 *
	 * @param user
	 * @return
	 */
	//List<User> getAllUserList(PageObject page);
	//List<User> getAllUserList(User user);

	/**
	 * 9.2  6.20日 物理分页 处理数据
	 * 在用户列表中，删除某个用户（操作：把user表中approve字段设置为0）
	 *
	 * @param userId
	 */
	void removeUser(int userId) throws Exception;


	/**
	 * 9.3 7.7 日 物理分页 处理数据  在用户列表中，审核某个用户（操作：把user表中approve字段设置1）
	 * 说明：系统管理员：审核 新注册用户
	 * @param userId
	 * @throws Exception
	 */
	void passUser(int userId) throws Exception;
}
