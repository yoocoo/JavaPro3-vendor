package cn.wj.domain;

import java.io.Serializable;

public class Channel implements Serializable {



	private Integer channelId;

	private Integer channelIndex;

	private Integer vendorId;

	private String channelName;

	private Double price;

	private String groupCode;

	private String goodsCode;

	private Integer stockNumber;

	private Integer motorStatus;

	private Byte disabled;

	public Integer getChannelId() {
		return channelId;
	}

	public void setChannelId(Integer channelId) {
		this.channelId = channelId;
	}

	public Integer getChannelIndex() {
		return channelIndex;
	}

	public void setChannelIndex(Integer channelIndex) {
		this.channelIndex = channelIndex;
	}

	public Integer getVendorId() {
		return vendorId;
	}

	public void setVendorId(Integer vendorId) {
		this.vendorId = vendorId;
	}

	public String getChannelName() {
		return channelName;
	}

	public void setChannelName(String channelName) {
		this.channelName = channelName == null ? null : channelName.trim();
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public String getGroupCode() {
		return groupCode;
	}

	public void setGroupCode(String groupCode) {
		this.groupCode = groupCode == null ? null : groupCode.trim();
	}

	public String getGoodsCode() {
		return goodsCode;
	}

	public void setGoodsCode(String goodsCode) {
		this.goodsCode = goodsCode == null ? null : goodsCode.trim();
	}

	public Integer getStockNumber() {
		return stockNumber;
	}

	public void setStockNumber(Integer stockNumber) {
		this.stockNumber = stockNumber;
	}

	public Integer getMotorStatus() {
		return motorStatus;
	}

	public void setMotorStatus(Integer motorStatus) {
		this.motorStatus = motorStatus;
	}

	public Byte getDisabled() {
		return disabled;
	}

	public void setDisabled(Byte disabled) {
		this.disabled = disabled;
	}
}