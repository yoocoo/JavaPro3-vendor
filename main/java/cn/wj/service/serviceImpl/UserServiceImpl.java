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
	 * @param user 用户bean
	 * @return  返回用户名
	 * @throws Exception
	 */
	public User findUser(User user) {
		return userDao.findOneById(user.getAccountName());
	}

	public void updateLoginSession(String sessionId, String accountName) throws Exception {
		userDao.updateLoginSession(sessionId, accountName);
	}

	public List<User> findAll(int pageNum, int pageSize) {
		return null;
	}
}
