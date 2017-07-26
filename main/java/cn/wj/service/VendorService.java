package cn.wj.service;

import cn.wj.domain.Vendor;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by ThinkPad on 2017/7/10.
 */
public interface VendorService extends BaseService<Vendor> {

	//1.1 .1功能说明： 生产商用户 ：注册新的售货机
	void shengAddVendor(Vendor vendor) throws Exception;

	//1.1.2 功能说明：更新第三方支付ID  依据第三放支付KEy   -->
	void updateThirdId(@Param("thirdpayId") int thirdpayId,@Param("thirdpayKey") String thirdpayKey) throws Exception;

	//2.1.1 生产商售货机 列表

	List<Vendor> getAllShengVendor(@Param("factoryId") int factoryId, int pageNum, int pageSize) throws Exception;

	//2.1.2 得到生产商所有的售货机 数量(jquery DataTable +PageHelper  服务器端分页)
	int getAllCount(@Param("factoryId") int factoryId);

	//2.2.2   生产商用户 冻结 售货机 ，使得 vendor表里 check ==1 即可， 说明:生产商管理员：  冻结可疑售货机，过期售货机-->
	void ShengRemoveVendor(@Param("vendorId") int vendorId) throws Exception;

	//2.2.3   生产商用户 通过新注册 售货机 ，使得 vendor表里 check ==1 即可， 说明:生产商管理员：  审核新注册售货机-->
	void shengPassVendor(@Param("vendorId") int vendorId) throws Exception;

	//2.3.1 系统管理员的售货机 列表
	List<Vendor> getAllXiVendor(@Param("pageNum") int pageNum, @Param("pageSize") int pageSize);

	//2.3.2 系统管理员的jquery DataTable +PageHelper  服务器端分页
	int getAllXiCount();

	//2.4.1  运营商管理员的售货机 列表
	List<Vendor> getAllYunVendor(@Param("agencyId") int agencyId, @Param("pageNum") int pageNum, @Param("pageSize") int pageSize);

	//2.4.2 运营商管理员jquery DataTable +PageHelper  服务器端分页
	int getAllYunCount(@Param("agencyId") int agencyId);

	//2.5.1 生产商售货机 数据查询统计的准备条件： 按指定生产商售货机名称列表 查询
	List<Vendor> getAllSvendorName(@Param("factoryId") int factoryId, @Param("roleId") int roleId) throws Exception;

	//2.5.2 运营商售货机 数据查询统计的准备条件： 按指运营商售货机名称列表 查询
	List<Vendor> getAllYvendorName(@Param("agencyId") int agencyId, @Param("roleId") int roleId) throws Exception;
}
