package cn.wj.service;

import cn.wj.domain.User;

import java.util.List;

/**
 * Created by ThinkPad on 2017/4/8.
 */
public interface UserService extends  BaseService<User> {
	void add(User user) throws  Exception;

	void  update(User user)throws  Exception;

	void updateImage(User user) throws  Exception;

	User findUser(User user) throws  Exception;

	void updateLoginSession(String sessionId, String accountName) throws Exception;

	List<User> findAll(int pageNum,int pageSize);

	public  String  findPathById(String accountName);

}
