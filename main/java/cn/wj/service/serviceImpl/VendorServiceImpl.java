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
	 * 1.1 功能说明： 生产商用户 ：注册新的售货机
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
			System.out.println("生产商注册新的售货机 失败");
			//其他用户添加失败异常
			throw new OtherThingsException(e);
		}
		if (result > 0) {
			System.out.println("生产商注册新的售货机 成功！");
		}
	}


	/**
	 * 功能说明：2.1.1 生产商售货机 列表
	 * 时间：2017 年 07 月 10 日
	 *
	 * @param pageNum  页码
	 * @param pageSize 每页的查询数量
	 * @return
	 */
	public List<Vendor> getAllShengVendor( int factoryId,int pageNum, int pageSize) {
		List<Vendor> vendorShengList = vendorDao.getAllShengVendor(factoryId,1, 10);
		return vendorShengList;
	}

	/**
	 * 功能说明：2.1.2 得到生产商所有的售货机 数量(jquery DataTable +PageHelper  服务器端分页)
	 * 时间：2017 年 07 月 10 日
	 *
	 * @return
	 */
	public int getAllCount( int factoryId) {
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
	public void shengPassVendor(int vendorId) throws OtherThingsException {
		int result1 = 0;//受影响的行数默认为零
		try {
			result1 = vendorDao.shengPassVendor(vendorId);
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
	public List<Vendor> getAllXiVendor( int pageNum, int pageSize) {
		List<Vendor> vendorXiList = vendorDao.getAllXiVendor(1,10);
		return vendorXiList;
	}

	/**
	 * 功能说明：2.3.2 得到生产商所有的售货机 数量(jquery DataTable +PageHelper  服务器端分页)
	 * 时间：2017 年 07 月 11 日
	 *
	 * @return
	 */
	public int getAllXiCount( ) {
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
	public List<Vendor> getAllYunVendor( int agencyId,int pageNum, int pageSize) {
		List<Vendor> vendorYunList = vendorDao.getAllYunVendor(agencyId,1, 10);
		return vendorYunList;
	}

	/**
	 * 功能说明：2.4.2  运营商管理员的 所有的售货机 数量(jquery DataTable +PageHelper  服务器端分页)
	 * 时间：2017 年 07 月 12 日
	 *
	 * @return
	 */
	public int getAllYunCount( int agencyId) {
		return vendorDao.getAllYunCount(agencyId);
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
