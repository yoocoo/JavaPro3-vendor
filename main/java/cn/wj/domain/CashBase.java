package cn.wj.domain;
/**
 * 说明： 售货机-- 现金表 实时数据
 * 作者： 王娇
 * 时间： 2017 年 07 月 20 日
 * 一更时间： 2017 年 07 月 **日
 */


import java.io.Serializable;
import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.Date;

public class CashBase implements Serializable {

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