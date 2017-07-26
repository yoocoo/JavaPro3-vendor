package cn.wj.domain;

import java.io.Serializable;

public class ThirdPay implements Serializable {
    private Integer thirdpayId;

    private String thirdpayKey;

    public String getThirdpayKey() {
        return thirdpayKey;
    }

    public void setThirdpayKey(String thirdpayKey) {
        this.thirdpayKey = thirdpayKey;
    }

    private Integer vendorId;

    public Integer getThirdpayId() {
        return thirdpayId;
    }

    public void setThirdpayId(Integer thirdpayId) {
        this.thirdpayId = thirdpayId;
    }

    public Integer getVendorId() {
        return vendorId;
    }

    public void setVendorId(Integer vendorId) {
        this.vendorId = vendorId;
    }
}