package cn.wj.domain;

import java.io.Serializable;

public class Factory implements Serializable {
	private Integer factoryId;

	private String factoryName;

	private String accountName;

	private String factoryType;

	private String cashTableName;

	private String orderTableName;

	private String saleTableName;

	private String alarmTableName;

	private String factoryLogoPath;

	private String cashSaleTableName;

	private Double sfeeReturnRate;

	private Double qrReturnRate;

	private String receiveAccount;

	private String openBankName;

	private String openAccountName;

	public Integer getFactoryId() {
		return factoryId;
	}

	public void setFactoryId(Integer factoryId) {
		this.factoryId = factoryId;
	}

	public String getFactoryName() {
		return factoryName;
	}

	public void setFactoryName(String factoryName) {
		this.factoryName = factoryName == null ? null : factoryName.trim();
	}

	public String getAccountName() {
		return accountName;
	}

	public void setAccountName(String accountName) {
		this.accountName = accountName;
	}

	public String getFactoryType() {
		return factoryType;
	}

	public void setFactoryType(String factoryType) {
		this.factoryType = factoryType;
	}

	public String getCashTableName() {
		return cashTableName;
	}

	public void setCashTableName(String cashTableName) {
		this.cashTableName = cashTableName == null ? null : cashTableName.trim();
	}

	public String getOrderTableName() {
		return orderTableName;
	}

	public void setOrderTableName(String orderTableName) {
		this.orderTableName = orderTableName == null ? null : orderTableName.trim();
	}

	public String getSaleTableName() {
		return saleTableName;
	}

	public void setSaleTableName(String saleTableName) {
		this.saleTableName = saleTableName == null ? null : saleTableName.trim();
	}

	public String getAlarmTableName() {
		return alarmTableName;
	}

	public void setAlarmTableName(String alarmTableName) {
		this.alarmTableName = alarmTableName == null ? null : alarmTableName.trim();
	}

	public String getFactoryLogoPath() {
		return factoryLogoPath;
	}

	public void setFactoryLogoPath(String factoryLogoPath) {
		this.factoryLogoPath = factoryLogoPath == null ? null : factoryLogoPath.trim();
	}

	public String getCashSaleTableName() {
		return cashSaleTableName;
	}

	public void setCashSaleTableName(String cashSaleTableName) {
		this.cashSaleTableName = cashSaleTableName;
	}

	public Double getSfeeReturnRate() {
		return sfeeReturnRate;
	}

	public void setSfeeReturnRate(Double sfeeReturnRate) {
		this.sfeeReturnRate = sfeeReturnRate;
	}

	public Double getQrReturnRate() {
		return qrReturnRate;
	}

	public void setQrReturnRate(Double qrReturnRate) {
		this.qrReturnRate = qrReturnRate;
	}

	public String getReceiveAccount() {
		return receiveAccount;
	}

	public void setReceiveAccount(String receiveAccount) {
		this.receiveAccount = receiveAccount;
	}

	public String getOpenBankName() {
		return openBankName;
	}

	public void setOpenBankName(String openBankName) {
		this.openBankName = openBankName == null ? null : openBankName.trim();
	}

	public String getOpenAccountName() {
		return openAccountName;
	}

	public void setOpenAccountName(String openAccountName) {
		this.openAccountName = openAccountName == null ? null : openAccountName.trim();
	}

	@Override
	public String toString() {
		return "Factory{" +
				"factoryId='" + factoryId + '\'' +
				"factoryName='" + factoryName + '\'' +
				", accountName='" + accountName + '\'' +
				", cashTableName='" + cashTableName + '\'' +
				", orderTableName='" + orderTableName + '\'' + ", saleTableName='" + saleTableName + '\'' + ", alarmTableName='" + alarmTableName + '\'' +
				", factoryLogoPath=" + factoryLogoPath +
				", cashSaleTableName='" + cashSaleTableName + '\'' +
				", sfeeReturnRate='" + sfeeReturnRate + '\'' +
				", qrReturnRate='" + qrReturnRate + '\'' + ", receiveAccount='" + receiveAccount + '\'' + ", openBankName='" + openBankName + '\'' +
				", openAccountName='" + openAccountName + '}';
	}
}