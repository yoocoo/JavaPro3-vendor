package cn.wj.dao;

import cn.wj.domain.ThirdPay;
import org.apache.ibatis.annotations.Param;

public interface ThirdPayDao extends Dao<ThirdPay>{


    /**
     * date： 2017.07 .25
     * author： 王娇
     * 生产商管理元 注册新的售货
     *1.1 生产商管理员注册售货机 在第三方支付表中 添加记录
     * @param thirdPay
     * @return
     */
    int addVendor(ThirdPay thirdPay);
    //1.1.2 功能说明：更新售货机id  依据从 售货机表 拷贝过来
   int updateVendorId(@Param("vendorId") int vendorId, @Param("thirdpayKey") String thirdpayKey);
    //==================自动生成==============================

}