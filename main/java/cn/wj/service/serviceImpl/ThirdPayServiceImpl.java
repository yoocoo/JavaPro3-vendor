package cn.wj.service.serviceImpl;

import cn.wj.dao.ThirdPayDao;
import cn.wj.domain.ThirdPay;
import cn.wj.exception.OtherThingsException;
import cn.wj.service.ThirdPayService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 说明： 售货机--注册业务 第三方支付东西
 * 作者： 王娇
 * 时间： 2017 年 07 月 25 日
 * 一更时间： 2017 年 07 月 ** 日
 */
@Service("thirdPayService")
public class ThirdPayServiceImpl implements ThirdPayService {
	@Autowired//这里是重点,spring事务管理时,那就一定要加上注解
	private ThirdPayDao thirdPayDao;
	/**
	 * 说明：1.1 生产商管理员注册售货机 在第三方支付表中 添加记录
	 *  日期： 2017 年 07 月 25 日
	 *  作者： 王娇
	 * @param thirdPay
	 * @return
	 * @throws OtherThingsException
	 */
	public void addVendor(ThirdPay thirdPay) throws OtherThingsException {
		int result = 0;//受影响的行数默认为零
		try {
			result = thirdPayDao.addVendor(thirdPay);
		} catch (Exception e) {
			System.out.println(" 生产商 第三方支付 失败");
			//其他用户添加失败异常
			throw new OtherThingsException(e);
		}
		if (result > 0) {
			System.out.println("生产商 第三方支付 售货机 成功！");
		}

	}

	/**
	 *
	 * @param vendorId
	 * @param thirdpayKey
	 * @throws Exception
	 */
	public void updateVendorId( int vendorId,  String thirdpayKey) throws OtherThingsException {
		int result = 0;//受影响的行数默认为零
		try {
			result = thirdPayDao.updateVendorId(vendorId,thirdpayKey);
		} catch (Exception e) {
			System.out.println("第三方表 更新vendorid  失败");
			//其他用户添加失败异常
			throw new OtherThingsException(e);
		}
		if (result > 0) {
			System.out.println("第三方表 更新vendorid 成功");
		}

	}


	//=================自动生成================================
	@Override
	public void add(ThirdPay thirdPay) throws Exception {

	}

	@Override
	public void update(ThirdPay thirdPay) throws Exception {

	}

	@Override
	public List<ThirdPay> findAll(int pageNum, int pageSize) {
		return null;
	}



}
