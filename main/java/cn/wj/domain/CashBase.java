package cn.wj.domain;
/**
 *
 */

import java.math.BigDecimal;
import java.util.Date;

public class CashBase {
    private Integer cashId;

    private Integer vendorId;

    private BigDecimal money;

    private Date time;

    private Byte transBorder;

    public Integer getCashId() {
        return cashId;
    }

    public void setCashId(Integer cashId) {
        this.cashId = cashId;
    }

    public Integer getVendorId() {
        return vendorId;
    }

    public void setVendorId(Integer vendorId) {
        this.vendorId = vendorId;
    }

    public BigDecimal getMoney() {
        return money;
    }

    public void setMoney(BigDecimal money) {
        this.money = money;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public Byte getTransBorder() {
        return transBorder;
    }

    public void setTransBorder(Byte transBorder) {
        this.transBorder = transBorder;
    }
}