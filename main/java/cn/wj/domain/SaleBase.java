package cn.wj.domain;

import java.io.Serializable;
import java.math.BigDecimal;
import java.sql.Timestamp;
//import java.util.Date;

/**
 * 创建时间： 2017 年 07 月17 日
 * 一更时间： 2017 年 07 月 19 日
 */
public class SaleBase implements Serializable {
	private Integer saleId;
	//================08.06新增=================================
	private  String saleCode;
	private String  groupCode;
	private  Integer saleType;
	private  Integer orderId;
	private  Integer successNot;

	public Integer getSaleType() {
		return saleType;
	}

	public void setSaleType(Integer saleType) {
		this.saleType = saleType;
	}

	public Integer getOrderId() {
		return orderId;
	}

	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}

	public Integer getSuccessNot() {
		return successNot;
	}

	public void setSuccessNot(Integer successNot) {
		this.successNot = successNot;
	}

	public String getSaleCode() {
		return saleCode;
	}

	public void setSaleCode(String saleCode) {
		this.saleCode = saleCode;
	}


	public String getGroupCode() {
		return groupCode;
	}

	public void setGroupCode(String groupCode) {
		this.groupCode = groupCode;
	}

	//================08.06新增=================================
	private Integer vendorId;

	private Integer channelId;

	private BigDecimal price;

	private Integer number;
	//======================抽取作为 条件查询对应实体属性============================
	private String vendorName;// 销售表需要的 售货机名称

	public String getVendorName() {
		return vendorName;
	}

	public void setVendorName(String vendorName) {
		this.vendorName = vendorName;
	}

	private Timestamp createTime;//作为销售表条件查询条件 ----开始时间

	public void setCreatTime(Timestamp createTime) {
		this.createTime = createTime;
	}

	public Timestamp getCreatTime() {
		return createTime;
	}

	private Timestamp endTime;//作为销售表条件-----结束时间

	public Timestamp getEndTime() {
		return endTime;
	}

	public void setEndTime(Timestamp endTime) {
		this.endTime = endTime;
	}

	//========================抽取作为 条件查询对应实体属性====================================
	private Timestamp time;

	public Timestamp getTime() {
		return time;
	}

	public void setTime(Timestamp time) {
		this.time = time;
	}

	//============2017年 07月17 日 ==============================
	//private Date time;
	//public Date getTime() {
	//    return time;
	//}
	//
	//public void setTime(Date time) {
	//    this.time = time;
	//}
//=====================================
	private Integer goodsCode;

	private String goodsName;

	private Integer agencyId;

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

	public Integer getChannelId() {
		return channelId;
	}

	public void setChannelId(Integer channelId) {
		this.channelId = channelId;
	}

	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public Integer getNumber() {
		return number;
	}

	public void setNumber(Integer number) {
		this.number = number;
	}

	public Integer getGoodsCode() {
		return goodsCode;
	}

	public void setGoodsCode(Integer goodsCode) {
		this.goodsCode = goodsCode;
	}

	public String getGoodsName() {
		return goodsName;
	}

	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName == null ? null : goodsName.trim();
	}

	public Integer getAgencyId() {
		return agencyId;
	}

	public void setAgencyId(Integer agencyId) {
		this.agencyId = agencyId;
	}
}