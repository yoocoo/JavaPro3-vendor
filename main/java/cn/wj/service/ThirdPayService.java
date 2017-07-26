package cn.wj.service;

import cn.wj.domain.ThirdPay;
import org.apache.ibatis.annotations.Param;

/**
 * Created by ThinkPad on 2017/7/25.
 */
public interface ThirdPayService extends BaseService<ThirdPay> {
	//1.1 .1生产商管理员注册售货机 在第三方支付表中 添加记录
	void addVendor(ThirdPay thirdPay) throws Exception;

	//1.1.2 功能说明：更新售货机id  依据从 售货机表 拷贝过来
	void updateVendorId(@Param("vendorId") int vendorId, @Param("thirdpayKey") String thirdpayKey) throws Exception;

}
