package cn.wj.domain;

import java.util.Date;

public class OrderBase {
    private Integer orderId;

    private Integer saleId;

    private Integer vendorId;

    private String cubePartnerId;

    private Integer price;

    private Date creatTime;

    private Date paidTime;

    private Integer paidMoney;

    private String paidSource;

    private String status;

    private String payUrl;

    private Double discount;

    private Integer refound;

    private Byte cubeCreatResult;

    private Integer channel;

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

    public Date getCreatTime() {
        return creatTime;
    }

    public void setCreatTime(Date creatTime) {
        this.creatTime = creatTime;
    }

    public Date getPaidTime() {
        return paidTime;
    }

    public void setPaidTime(Date paidTime) {
        this.paidTime = paidTime;
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