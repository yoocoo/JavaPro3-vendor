package cn.wj.service.serviceImpl;

import cn.wj.dao.UserDao;
import cn.wj.domain.User;
import cn.wj.exception.*;
import cn.wj.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by ThinkPad on 2017/4/8.
 */
@Service("userService")
public class UserServiceImpl implements UserService {
	@Autowired
	private UserDao userDao;

	/**
	 * 添加用户，检查用户为空， 用户名为空，密码为空
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
	 * 更新用户资料
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
	 * 更新用户头像
	 * @param user
	 * @throws OtherThingsException
	 */

	public void updateImage(User user) throws OtherThingsException {
		int result2 = 0;//受影响的行数默认为零
		try {
			result2 = userDao.updateImage(user);
		}catch (Exception e){
			System.out.println("更新用户头像失败");
			//其他用户更新失败异常
			throw new OtherThingsException(e);
		}
		if (result2 > 0) {
			System.out.println("service更新用户头像成功！");
		}
	}


	/**
	 * 查找数据库中用户（注册时查重和登录时判空）
	 * @param user 用户bean
	 * @return  返回用户名
	 * @throws Exception
	 */
	public User findUser(User user) {
		return userDao.findOneById(user.getAccountName());
	}

	/**
	 * 更新用户session
	 * @param sessionId
	 * @param accountName
	 * @throws Exception
	 */
	public void updateLoginSession(String sessionId, String accountName) throws Exception {
		userDao.updateLoginSession(sessionId, accountName);
	}

	/**
	 * 用户列表（查找所有用户，带分页）
	 * @param pageNum  页码
	 * @param pageSize 每页的查询数量
	 * @return
	 */
	public List<User> findAll(int pageNum, int pageSize) {
		return null;
	}

	/**
	 * 依据用户名找到 该用户名头像地址 Path
	 * @param accountName
	 * @return  返回头像地址
	 */
	public String findPathById(String accountName) {
		return this.userDao.findPathById(accountName);
	}


}
