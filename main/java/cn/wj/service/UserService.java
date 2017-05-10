package cn.wj.service;

import cn.wj.domain.User;

import java.util.List;

/**
 * Created by ThinkPad on 2017/4/8.
 */
public interface UserService extends BaseService<User> {
	/**
	 * 注册用户
	 *
	 * @param user
	 * @throws Exception
	 */
	void add(User user) throws Exception;

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
	 * @param user
	 * @throws Exception
	 */
	void updateImage(User user) throws Exception;

	/**
	 * 查找数据库中用户（注册时查重和登录时判空）
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


}
