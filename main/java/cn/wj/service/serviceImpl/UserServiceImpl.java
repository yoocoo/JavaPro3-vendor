package cn.wj.service.serviceImpl;

import cn.wj.dao.UserDao;
import cn.wj.domain.Menu;
import cn.wj.domain.User;
import cn.wj.exception.OtherThingsException;
import cn.wj.service.UserService;
import cn.wj.utils.Datagrid;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by ThinkPad on 2017/4/8.
 */
@Service("userService")
public class UserServiceImpl implements UserService {
	@Autowired//这里是重点,spring事务管理时,那就一定要加上注解
	private UserDao userDao;

	/**
	 * //10.1.1 jquery DataTable +PageHelper  服务器端分页
	 *
	 * @return
	 */
	public int getAllCount() {
		return userDao.getAllCount();
	}

	/**
	 * 添加用户，检查用户为空， 用户名为空，密码为空
	 * 2.1 注册普通用户（暂时未用到）
	 *
	 * @param user
	 * @throws Exception
	 */
	public void add(User user) throws OtherThingsException {
		int result = 0;//受影响的行数默认为零
		try {
			result = userDao.add(user);
		} catch (Exception e) {
			System.out.println("添加用户失败");
			//其他用户添加失败异常
			throw new OtherThingsException(e);
		}
		if (result > 0) {
			System.out.println("添加用户成功！");
		}

	}

	/**
	 * 2.2.1系统管理员注册 一级管理用户( 生产商管理员用户 ，记住 factory_id 是后期更新上去的 )
	 *
	 * @param user
	 * @throws OtherThingsException
	 */
	public void sysuseradd(User user) throws OtherThingsException {
		int result = 0;//受影响的行数默认为零
		try {
			result = userDao.sysuseradd(user);
		} catch (Exception e) {
			System.out.println("添加一级生产商管理员用户失败");
			//其他用户添加失败异常
			throw new OtherThingsException(e);
		}
		if (result > 0) {
			System.out.println("添加一级生产商管理员用户成功！");
		}
	}

	/**
	 * 2.3.1 6.13 号增加语句-注册二级管理用户(运营商管理用户) ,记住  factory_id 是生产商用户登录的 记录的 factory_id 值，可手输入
	 *
	 * @param user
	 * @throws OtherThingsException
	 */
	public void sysuseraddYun(User user) throws OtherThingsException {
		int result = 0;//受影响的行数默认为零
		try {
			result = userDao.sysuseraddYun(user);
		} catch (Exception e) {
			System.out.println("添加二级运营商管理员用户失败");
			//其他用户添加失败异常
			throw new OtherThingsException(e);
		}
		if (result > 0) {
			System.out.println("添加二级运营商管理员用户成功！");
		}
	}

	//public PagedResult<User> queryByPage(String accountName,Integer pageNo,Integer pageSize ) {
	//	pageNo = pageNo == null?1:pageNo;
	//	pageSize = pageSize == null?10:pageSize;
	//	PageHelper.startPage(pageNo,pageSize);  //startPage是告诉拦截器说我要开始分页了。分页参数是这两个。
	//	return BeanUtil.toPagedResult(userDao.selectUserByAccountName(accountName));
	//}

	/**
	 * 2.3 .2 更新 用户表中 agencyId
	 *
	 * @param accountName
	 * @throws OtherThingsException
	 */
	public void updateAgencyId(int agencyId, String accountName) throws OtherThingsException {
		int result = 0;//受影响的行数默认为零
		try {
			result = userDao.updateAgencyId(agencyId, accountName);
		} catch (Exception e) {
			System.out.println("创建运营商商用户时，更新用户表中agencyid 失败");
			//其他用户添加失败异常
			throw new OtherThingsException(e);
		}
		if (result > 0) {
			System.out.println("创建运营商用户时，更新用户表中agencyid 成功");
		}
	}


	/**
	 * 2.3.3  7.5 号增加语句-注册三级用户(运营商配货员，仓库员) ,记住  agency_id 是生产商用户登录的 记录的 agency_id 值，可自动填入
	 *
	 * @param user
	 * @throws OtherThingsException
	 */
	public void sysuseraddYunPei(User user) throws OtherThingsException {
		int result = 0;//受影响的行数默认为零
		try {
			result = userDao.sysuseraddYunPei(user);
		} catch (Exception e) {
			System.out.println("添加二级运营商管理员用户失败");
			//其他用户添加失败异常
			throw new OtherThingsException(e);
		}
		if (result > 0) {
			System.out.println("添加二级运营商管理员用户成功！");
		}
	}

	/**
	 * 2.2.2.1-注入运营商归属的factory_id 到user表中  6.13号(暂时没有用到)
	 *
	 * @param accountName
	 * @throws OtherThingsException
	 */

	public void selectFactoryIdByName(String accountName) throws OtherThingsException {
		int result = 0;//受影响的行数默认为零
		try {
			result = userDao.selectFactoryIdByName(accountName);
		} catch (Exception e) {
			System.out.println("（一）查询运营商归属的factory_id 到user表中 失败");
			//其他用户添加失败异常
			throw new OtherThingsException(e);
		}
		if (result > 0) {
			System.out.println("（二）查询运营商归属的factory_id 到user表中 成功");
		}
	}

	/**
	 * 2.2.2.2-注入运营商归属的factory_id 到user表中  6.13号（暂时没有用到）
	 *
	 * @param user
	 * @throws OtherThingsException
	 */
	public void addAgencyToFactoryId(User user) throws OtherThingsException {
		int result = 0;//受影响的行数默认为零
		try {
			result = userDao.addAgencyToFactoryId(user);
		} catch (Exception e) {
			System.out.println("更新注入运营商归属的factory_id 到user表中 失败");
			//其他用户添加失败异常
			throw new OtherThingsException(e);
		}
		if (result > 0) {
			System.out.println("更新注入运营商归属的factory_id 到user表中 成功");
		}
	}

	/**
	 * 2.2.7  更新 用户表中 factoryId
	 *
	 * @param accountName
	 * @throws OtherThingsException
	 */
	public void updateFactoryId(int factoryId, String accountName) throws OtherThingsException {
		int result = 0;//受影响的行数默认为零
		try {
			result = userDao.updateFactoryId(factoryId, accountName);
		} catch (Exception e) {
			System.out.println("创建生产商用户时，并更新用户表中factoryid 失败");
			//其他用户添加失败异常
			throw new OtherThingsException(e);
		}
		if (result > 0) {
			System.out.println("创建生产商完后，并更新用户表中factoryid 成功");
		}
	}

	/**
	 * 2.2.2 创建动态的生产商的 订单表
	 *
	 * @param tableName
	 * @return
	 */
	public void createOrderTable(String tableName) throws OtherThingsException {
		int result = 0;//受影响的行数默认为零
		try {
			result = userDao.createOrderTable(tableName);
		} catch (Exception e) {
			System.out.println("创建 该生产商的订单表失败 ");
			//订单表 创建 其他异常
			throw new OtherThingsException(e);
		}
		if (result > 0) {
			System.out.println("创建 该生产商的订单表  成功");
		}
	}

	/**
	 * 2.2.3  创建动态的生产商的 销售表
	 *
	 * @param tableName
	 * @throws OtherThingsException
	 */
	public void createSaleTable(String tableName) throws OtherThingsException {
		int result = 0;//受影响的行数默认为零
		try {
			result = userDao.createSaleTable(tableName);
		} catch (Exception e) {
			System.out.println("创建 该生产商的销售表 失败");
			//订单表 创建 其他异常
			throw new OtherThingsException(e);
		}
		if (result > 0) {
			System.out.println("创建 该生产商的销售表  成功");
		}
	}

	/**
	 * 2.2.4 创建动态的生产商的 金钱表
	 *
	 * @param tableName
	 * @throws OtherThingsException
	 */
	public void createCashTable(String tableName) throws OtherThingsException {
		int result = 0;//受影响的行数默认为零
		try {
			result = userDao.createCashTable(tableName);
		} catch (Exception e) {
			System.out.println("创建 该生产商的现金表 失败");
			//订单表 创建 其他异常
			throw new OtherThingsException(e);
		}
		if (result > 0) {
			System.out.println("创建该生产商的 现金表  成功");
		}
	}

	/**
	 * 2.2.5 创建动态的生产商的 金钱和销售关联表
	 *
	 * @param tableName
	 * @throws OtherThingsException
	 */
	public void createCashSaleTable(String tableName) throws OtherThingsException {
		int result = 0;//受影响的行数默认为零
		try {
			result = userDao.createCashSaleTable(tableName);
		} catch (Exception e) {
			System.out.println("创建 该生产商的销售和金钱关联 失败");
			//订单表 创建 其他异常
			throw new OtherThingsException(e);
		}
		if (result > 0) {
			System.out.println("创建 该生产商的销售和金钱关联  成功");
		}
	}

	/**
	 * 2.2.6 动态创建 生产商的警告表
	 *
	 * @param tableName
	 * @throws OtherThingsException
	 */
	public void createAlarmTable(String tableName) throws OtherThingsException {
		int result = 0;//受影响的行数默认为零
		try {
			result = userDao.createAlarmTable(tableName);
		} catch (Exception e) {
			System.out.println("创建 该生产商的警告表 失败");
			//订单表 创建 其他异常
			throw new OtherThingsException(e);
		}
		if (result > 0) {
			System.out.println("创建 该生产商的警告表  成功");
		}
	}

	/**
	 *  统一公共页面 修改个人资料
	 * 4.1 更新用户(全局普通更新)
	 *
	 * @param user
	 * @throws OtherThingsException
	 */
	public void update(User user) throws OtherThingsException {
		int result1 = 0;//受影响的行数默认为零
		try {
			result1 = userDao.update(user);
		} catch (Exception e) {
			System.out.println("更新用户信息失败");
			//其他用户添加失败异常
			throw new OtherThingsException(e);
		}
		if (result1 > 0) {
			System.out.println("service更新用户信息成功！");
		}
	}

	/**
	 * 依据用户名找到 该用户名头像地址 Path
	 * 5.1 查找用户头像地址，用于动态显示头像(全局普通更新)
	 *
	 * @param accountName
	 * @return 返回头像地址
	 */
	public String findPathById(String accountName) {
		return this.userDao.findPathById(accountName);
	}

	/**
	 * 更新用户头像
	 * 5.2  更新用户头像(全局普通更新)
	 *
	 * @param
	 * @throws OtherThingsException
	 */

	public void updateImage(String headImage, String accountName) throws OtherThingsException {
		int result2 = 0;//受影响的行数默认为零
		try {
			result2 = userDao.updateImage(headImage, accountName);
		} catch (Exception e) {
			System.out.println("更新用户表中用户头像失败");
			//其他用户更新失败异常
			throw new OtherThingsException(e);
		}
		if (result2 > 0) {
			System.out.println("service实现类中 更新用户表中用户头像成功！");
		}
	}


	/**
	 * 查找数据库中用户（注册时查重和登录时判空）
	 *
	 * @param user 用户bean
	 * @return 返回用户名
	 * @throws Exception
	 */
	public User findUser(User user) {
		return userDao.findOneById(user.getAccountName());
	}

	/**
	 * 更新用户session（暂时未用到）
	 *
	 * @param sessionId
	 * @param accountName
	 * @throws Exception
	 */
	public void updateLoginSession(String sessionId, String accountName) throws Exception {
		userDao.updateLoginSession(sessionId, accountName);
	}

	/**
	 * 用户列表（查找所有用户，带分页）
	 * 时间： 2017 年 07 月 5 日  jquery datatable版本 物理分页
	 *
	 * @param pageNum  页码
	 * @param pageSize 每页的查询数量
	 * @return
	 */
	public List<User> findAll(int pageNum, int pageSize) {
		List<User> userList = userDao.findAll(1, 10);
		return userList;
	}


	/**
	 * 根据用户ID 获得   该用户权限的菜单
	 * 7.1  根据用户ID 获得权限菜单
	 *
	 * @param userId
	 * @return
	 */
	public List<Menu> getMenu(int userId) {
		return userDao.getMenuByUserId(userId);
	}

	/**
	 * //8.1根据用户名获得该用户的ID
	 *
	 * @param accountName
	 * @return
	 */
	public int getUserIdByName(String accountName) {
		return this.userDao.selectUserIdByName(accountName);
	}



	/**
	 * 9.1 获得用户表中所有的用户
	 * 时间： 2017 年 06 月 22 日  BootSrap-table PageHelper物理分页
	 *
	 * @param user
	 * @return
	 */
	public Datagrid getAllUserList(User user, int pageNum, int pageSize) {
		PageHelper.startPage(pageNum, pageSize);
		PageHelper.orderBy("user_id asc");
		List<User> userList = userDao.getAllUserList(user);
		PageInfo<User> pageInfo = new PageInfo<User>(userList);
		Datagrid datagrid = new Datagrid(pageInfo.getTotal(), pageInfo.getList());
		return datagrid;

	}

	/**
	 * 9.2  6.20 日 物理分页 处理数据
	 * 在用户列表中，删除某个用户（操作：把user表中approve字段设置为0）
	 *
	 * @param userId
	 * @throws OtherThingsException
	 */
	public void removeUser(int userId) throws OtherThingsException {
		int result1 = 0;//受影响的行数默认为零
		try {
			result1 = userDao.removeUser(userId);
		} catch (Exception e) {
			System.out.println("冻结用户列表中用户信息 失败");
			//其他用户添加失败异常
			throw new OtherThingsException(e);
		}
		if (result1 > 0) {
			System.out.println("冻结用户列表中用户信息 成功！");
		}

	}

	public void passUser(int userId) throws OtherThingsException {
		int result1 = 0;//受影响的行数默认为零
		try {
			result1 = userDao.passUser(userId);
		} catch (Exception e) {
			System.out.println("审核用户列表中用户信息 失败");
			//其他用户添加失败异常
			throw new OtherThingsException(e);
		}
		if (result1 > 0) {
			System.out.println("审核用户列表中用户信息 成功！");
		}

	}
}
