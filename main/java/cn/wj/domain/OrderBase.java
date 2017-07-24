package cn.wj.domain;

import java.io.Serializable;
import java.sql.Timestamp;

//import java.sql.Date;

/**
 * 说明： 售货机订单实时数据
 * 作者： 王娇
 * 时间： 2017 年 07 月 14 日
 */
public class OrderBase implements Serializable {
    private Integer orderId;

    private Integer saleId;

    private Integer vendorId;

    private String cubePartnerId;

    private Integer price;

    //private Date creatTime;
    //private Date endTime;
    //private Date paidTime;
	//
    //public Date getCreatTime() {
    //    return creatTime;
    //}
	//
    //public void setCreatTime(Date creatTime) {
    //    this.creatTime = creatTime;
    //}
    //public Date getEndTime() {
    //    return endTime;
    //}
    //public void setEndTime(Date endTime) {
    //    this.endTime = endTime;
    //}
    //public Date getPaidTime() {
    //    return paidTime;
    //}
	//
    //public void setPaidTime(Date paidTime) {
    //    this.paidTime = paidTime;
    //}

    private Integer paidMoney;

    private String paidSource;

    private String status;

    private String payUrl;

    private Double discount;

    private Integer refound;

    private Byte cubeCreatResult;

    private Integer channel;

    //================================================
    private String vendorName;
    public String getVendorName() {
        return vendorName;
    }

    public void setVendorName(String vendorName) {
        this.vendorName = vendorName;
    }

    private Timestamp endTime;//作为 条件查询时间段选择的结束时间
    private Timestamp createTime;// 可作为条件查询时间段选择的开始时间
    private Timestamp paidTime;

    public void setCreatTime(Timestamp createTime) {
        this.createTime = createTime;
    }
    public Timestamp getCreatTime() {
        return createTime;
    }

    public Timestamp getEndTime() {
        return endTime;
    }
    public void setEndTime(Timestamp endTime) {
        this.endTime = endTime;
    }
    public void setPaidTime(Timestamp paidTime) {
        this.paidTime = paidTime;
    }
    public Timestamp getPaidTime() {
        return paidTime;
    }

    //======================================================
    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public Integer getSaleId() {
        return saleId;
    }

    public void setSaleId(Integer saleId) {
        this.saleId = saleId;
    }

    public Integer getVendorId() {
        return vendorId;
    }

    public void setVendorId(Integer vendorId) {
        this.vendorId = vendorId;
    }

    public String getCubePartnerId() {
        return cubePartnerId;
    }

    public void setCubePartnerId(String cubePartnerId) {
        this.cubePartnerId = cubePartnerId == null ? null : cubePartnerId.trim();
    }

    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }


    public Integer getPaidMoney() {
        return paidMoney;
    }

    public void setPaidMoney(Integer paidMoney) {
        this.paidMoney = paidMoney;
    }

    public String getPaidSource() {
        return paidSource;
    }

    public void setPaidSource(String paidSource) {
        this.paidSource = paidSource == null ? null : paidSource.trim();
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status == null ? null : status.trim();
    }

    public String getPayUrl() {
        return payUrl;
    }

    public void setPayUrl(String payUrl) {
        this.payUrl = payUrl == null ? null : payUrl.trim();
    }

    public Double getDiscount() {
        return discount;
    }

    public void setDiscount(Double discount) {
        this.discount = discount;
    }

    public Integer getRefound() {
        return refound;
    }

    public void setRefound(Integer refound) {
        this.refound = refound;
    }

    public Byte getCubeCreatResult() {
        return cubeCreatResult;
    }

    public void setCubeCreatResult(Byte cubeCreatResult) {
        this.cubeCreatResult = cubeCreatResult;
    }

    public Integer getChannel() {
        return channel;
    }

    public void setChannel(Integer channel) {
        this.channel = channel;
    }
}