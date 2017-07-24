package cn.wj.service.serviceImpl;

import cn.wj.dao.UserVendorDao;
import cn.wj.domain.UserVendor;
import cn.wj.service.UserVendorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 说明：用户售货机产权分配表 业务逻辑
 * 作者： 王娇
 * 时间：2017/7/10
 */
@Service("UserVendorService")
public class UserVendorServiceImpl  implements UserVendorService {
	@Autowired//这里是重点,spring事务管理时,那就一定要加上注解
	private UserVendorDao userVendorDao;

//==============================自动生成========================
	@Override
	public int insert(UserVendor record) {
		return 0;
	}

	@Override
	public int insertSelective(UserVendor record) {
		return 0;
	}

	@Override
	public void add(UserVendor userVendor) throws Exception {

	}

	@Override
	public void update(UserVendor userVendor) throws Exception {

	}

	@Override
	public List<UserVendor> findAll(int pageNum, int pageSize) {
		return null;
	}
}
