package cn.wj.service.serviceImpl;

import cn.wj.dao.VendorDao;
import cn.wj.domain.Vendor;
import cn.wj.exception.OtherThingsException;
import cn.wj.service.VendorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 说明： 售货机实时数据
 * 作者： 王娇
 * 时间： 2017 年 07 月 10 日
 */
@Service("vendorService")
public class VendorServiceImpl implements VendorService {
	@Autowired
	private VendorDao vendorDao;

	/**
	 * 1.1.1 功能说明： 生产商用户 ：注册新的售货机
	 * 时间：2017 年 07 月 10 日
	 *
	 * @param vendor
	 * @throws OtherThingsException
	 */
	public void shengAddVendor(Vendor vendor) throws OtherThingsException {
		int result = 0;//受影响的行数默认为零
		try {
			result = vendorDao.shengAddVendor(vendor);
		} catch (Exception e) {
			System.out.println("生产商 注册新的售货机 失败");
			//其他用户添加失败异常
			throw new OtherThingsException(e);
		}
		if (result > 0) {
			System.out.println("生产商 注册新的售货机 成功！");
		}
	}

	/**
	 * 1.1.2 功能说明：更新第三方支付ID  依据第三放支付KEy
	 * 时间： 2017 年 07 月 25 日 （等待重新使用）
	 * @param thirdpayKey
	 * @throws OtherThingsException
	 */
	//public void updateThirdId(int thirdpayId, String thirdpayKey) throws OtherThingsException {
	//	int result = 0;//受影响的行数默认为零
	//	try {
	//		result = vendorDao.updateThirdId(thirdpayId,thirdpayKey);
	//	} catch (Exception e) {
	//		System.out.println("生产商管理用户注册售货机更新第三方ID  失败");
	//		//其他用户添加失败异常
	//		throw new OtherThingsException(e);
	//	}
	//	if (result > 0) {
	//		System.out.println("生产商管理用户注册售货机更新第三方ID 成功");
	//	}
	//}
	/**
	 * 1.1.3 查找-售货机名称，查找该售货机名称是否已经被命名
	 *时间： 2017 年 07 月 25 日
	 * @param vendor 用户bean
	 * @return 返回用户名
	 * @throws Exception
	 */
	public Vendor findVendor(Vendor vendor) {
		return vendorDao.findOneById(vendor.getVendorName());
	}



	/**
	 * 功能说明：2.1.1 生产商售货机 列表
	 * 时间：2017 年 07 月 10 日
	 *
	 * @param pageNum  页码
	 * @param pageSize 每页的查询数量
	 * @return
	 */
	public List<Vendor> getAllShengVendor(int factoryId, int pageNum, int pageSize) {
		List<Vendor> vendorShengList = vendorDao.getAllShengVendor(factoryId, 1, 10);
		return vendorShengList;
	}

	/**
	 * 功能说明：2.1.2 得到生产商所有的售货机 数量(jquery DataTable +PageHelper  服务器端分页)
	 * 时间：2017 年 07 月 10 日
	 *
	 * @return
	 */
	public int getAllCount(int factoryId) {
		return vendorDao.getAllCount(factoryId);
	}

	/**
	 * 功能说明：2.2.2   生产商用户 冻结 售货机 ，使得 vendor表里 check ==1 即可，
	 * 说明:生产商管理员：  冻结可疑售货机，过期售货机
	 * 时间：2017 年 07 月 10 日
	 *
	 * @param vendorId
	 * @throws OtherThingsException
	 */
	public void ShengRemoveVendor(int vendorId) throws OtherThingsException {
		int result1 = 0;//受影响的行数默认为零
		try {
			result1 = vendorDao.ShengRemoveVendor(vendorId);
		} catch (Exception e) {
			System.out.println("冻结 生产商的售货机列表 失败");
			//其他用户添加失败异常
			throw new OtherThingsException(e);
		}
		if (result1 > 0) {
			System.out.println("冻结 生产商的售货机列表 成功！");
		}

	}

	/**
	 * 功能说明：2.2.3  生产商用户 通过新注册 售货机 ，使得 vendor表里 check ==1 即可，
	 * 说明:生产商管理员：  审核新注册售货机
	 * 时间：2017 年 07 月 10 日
	 *
	 * @param vendorId
	 * @throws OtherThingsException
	 */
	public void shengPassVendor(int vendorId,String checkUser) throws OtherThingsException {
		int result1 = 0;//受影响的行数默认为零
		try {
			result1 = vendorDao.shengPassVendor(vendorId,checkUser);
		} catch (Exception e) {
			System.out.println("审核 生产商的售货机列表 失败");
			//其他用户添加失败异常
			throw new OtherThingsException(e);
		}
		if (result1 > 0) {
			System.out.println("审核 生产商的售货机列表 成功！");
		}

	}

	/**
	 * 功能说明：2.3.1 生产商售货机 列表
	 * 时间：2017 年 07 月 11 日
	 *
	 * @param pageNum  页码
	 * @param pageSize 每页的查询数量
	 * @return
	 */
	public List<Vendor> getAllXiVendor(int pageNum, int pageSize) {
		List<Vendor> vendorXiList = vendorDao.getAllXiVendor(1, 10);
		return vendorXiList;
	}

	/**
	 * 功能说明：2.3.2 得到生产商所有的售货机 数量(jquery DataTable +PageHelper  服务器端分页)
	 * 时间：2017 年 07 月 11 日
	 *
	 * @return
	 */
	public int getAllXiCount() {
		return vendorDao.getAllXiCount();
	}


	/**
	 * 功能说明：2.4.1 运营商管理员的 售货机 列表
	 * 时间：2017 年 07 月 12 日
	 *
	 * @param pageNum  页码
	 * @param pageSize 每页的查询数量
	 * @return
	 */
	public List<Vendor> getAllYunVendor(int agencyId, int pageNum, int pageSize) {
		List<Vendor> vendorYunList = vendorDao.getAllYunVendor(agencyId, 1, 10);
		return vendorYunList;
	}

	/**
	 * 功能说明：2.4.2  运营商管理员的 所有的售货机 数量(jquery DataTable +PageHelper  服务器端分页)
	 * 时间：2017 年 07 月 12 日
	 *
	 * @return
	 */
	public int getAllYunCount(int agencyId) {
		return vendorDao.getAllYunCount(agencyId);
	}

	/**
	 * 时间： 2017 年08 月 05 日
	 * 功能说明： 运营商更新 售货机资料
	 * @param vendorId
	 * @param vendorName
	 * @throws Exception
	 */
	public void updateVendorName(  String vendorName, int vendorId) throws OtherThingsException {
		int result = 0;//受影响的行数默认为零
		try {
			result = vendorDao.updateVendorName(vendorName,vendorId);
		} catch (Exception e) {
			System.out.println("运营商更新售货机资料  失败");
			//其他用户添加失败异常
			throw new OtherThingsException(e);
		}
		if (result > 0) {
			System.out.println("service运营商更新售货机资料 成功");
		}
	}

	/**
	 * 2.5.1 (1) 条件查询一： 按生产商所拥有的售货机名称列表 查询
	 *
	 * @param factoryId
	 * @throws OtherThingsException
	 */
	public List<Vendor> getAllSvendorName(int factoryId,int roleId) {
			List<Vendor> svendorNameList = vendorDao.getAllSvendorName(factoryId,roleId);
			System.out.println(" 得到 生产商的售货机名称列表 成功！");
			return svendorNameList;

	}

	/**
	 *  2.5.1 (1) 条件查询一： 按生产商所拥有的售货机名称列表 查询
	 * @param factoryId
	 * @return
	 * @throws Exception
	 */
	public List<Vendor> getAgencyNameList( int factoryId) throws Exception {
		List<Vendor> agencynameList =vendorDao.getAgencyNameList(factoryId);
		return agencynameList;
	}

	/**
	 * 2.5.1  条件查询一： 按生产商所拥有的售货机名称列表 查询
	 *
	 * @param agencyId
	 * @throws OtherThingsException
	 */
	public List<Vendor> getAllYvendorName(int agencyId,int roleId) {

		//try {
		List<Vendor> yvendorNameList = vendorDao.getAllYvendorName(agencyId,roleId);
		System.out.println(" 得到 运营商的售货机名称列表 成功！");
		return yvendorNameList;
		//} catch (Exception e) {
		//	System.out.println(" 得到 生产商的售货机名称列表 失败");
		//	//其他用户添加失败异常
		//	throw new OtherThingsException(e);
		//}
	}

	//=======================自动生成======================================
	@Override
	public void add(Vendor vendor) throws Exception {

	}

	@Override
	public void update(Vendor vendor) throws Exception {

	}

	@Override
	public List<Vendor> findAll(int pageNum, int pageSize) {
		return null;
	}
}
