package cn.wj.service;
import cn.wj.domain.UserVendor;

/**
 * 说明：用户售货机产权分配表 业务逻辑
 * 作者： 王娇
 * 时间：2017/7/10
 */
public interface UserVendorService extends BaseService<UserVendor> {

	//===========自动生成=================
	int insert(UserVendor record);

	int insertSelective(UserVendor record);
}
