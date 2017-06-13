package cn.wj.service;

import cn.wj.domain.Menu;
import cn.wj.domain.User;

import java.util.List;

/**
 * Created by ThinkPad on 2017/4/8.
 */
public interface UserService extends BaseService<User> {
	/**
	 * 1.1.1注册普通用户
	 *
	 * @param user
	 * @throws Exception
	 */
	void add(User user) throws Exception;

	/**
	 *1.1.3 查找User表中 所有用户  6.12日 加入物理分页
	 * @param accountName
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	//PagedResult<User> queryByPage(String accountName,Integer pageNo,Integer pageSize);

	/**
	 * 2.1.1系统管理员注册 一级管理用户( 生产商管理员用户 ，记住 factory_id 是后期更新上去的 )
	 *
	 * @param user
	 * @throws Exception
	 */
	void sysuseradd(User user) throws Exception;

	/**
	 * 	2.1.2  6.13 号增加语句-注册二级管理用户(运营商管理用户) ,记住  factory_id 是生产商用户登录的 记录的 factory_id 值，可手输入
	 * @param user
	 * @throws Exception
	 */
	 void sysuseraddYun(User user) throws Exception;
	/**
	 * 2.2.1 更新 用户表中 agencyId
	 *
	 * @param accountName
	 */
	void updateAgencyId(int agencyId,String accountName) throws Exception;

	/**
	 * 2.2.2.1-注入运营商归属的factory_id 到user表中  6.13号
	 *
	 * @param accountName
	 */
	void selectFactoryIdByName(String accountName) throws Exception;

	/**
	 * 2.2.2.2-注入运营商归属的factory_id 到user表中  6.13号
	 *
	 * @param user
	 * @throws Exception
	 */

	void addAgencyToFactoryId(User user) throws Exception;

	/**
	 * 2.3更新 用户表中 factoryId
	 *
	 * @param accountName
	 */
	void updateFactoryId(int factoryId,String accountName) throws Exception;
	//void updateFactoryId(User user) throws Exception;

	/**
	 * 2.4  创建动态的生产商的 订单表
	 *
	 * @param tableName
	 * @return
	 */
	void createOrderTable(String tableName) throws Exception;

	/**
	 * 2.5
	 *
	 * @param tableName
	 * @throws Exception
	 */
	void createSaleTable(String tableName) throws Exception;

	/**
	 * 2.6
	 *
	 * @param tableName
	 * @throws Exception
	 */
	void createCashTable(String tableName) throws Exception;

	/**
	 * 2.7
	 *
	 * @param tableName
	 * @throws Exception
	 */
	void createCashSaleTable(String tableName) throws Exception;

	/**
	 * 2.8 动态创建生产商警告表
	 *
	 * @param tableName
	 * @throws Exception
	 */
	void createAlarmTable(String tableName) throws Exception;

	/**
	 * 更新用户资料
	 *
	 * @param user
	 * @throws Exception
	 */
	void update(User user) throws Exception;

	/**
	 * 查找用户用户头像路径，用于后台首页系显示
	 *
	 * @param accountName
	 * @return
	 */
	String findPathById(String accountName);

	/**
	 * 更新用户头像
	 *
	 * @param
	 * @throws Exception
	 */
	void updateImage(String headImage, String accountName) throws Exception;

	/**
	 * 1.1.2查找数据库中用户（注册时查重和登录时判空）
	 *
	 * @param user
	 * @return
	 * @throws Exception
	 */
	User findUser(User user) throws Exception;

	/**
	 * 更新用户session
	 *
	 * @param sessionId
	 * @param accountName
	 * @throws Exception
	 */
	void updateLoginSession(String sessionId, String accountName) throws Exception;

	/**
	 * 用户列表（查找所有用户，带分页）
	 *
	 * @param pageNum  页码
	 * @param pageSize 每页的查询数量
	 * @return 返回用户列表
	 */
	List<User> findAll(int pageNum, int pageSize);

	/**
	 * 根据用户ID 获得 该用户的菜单
	 *
	 * @param userId
	 * @return
	 */
	List<Menu> getMenu(int userId);

	/**
	 * 根据用户名 获得该用户的ID
	 *
	 * @param accountName
	 * @return
	 */
	int getUserIdByName(String accountName);

	/**
	 * 查找-登录用户的所有信息
	 *
	 * @param accountName
	 * @return
	 */
	//int findUserInfo(String accountName);

}
