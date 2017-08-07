package cn.wj.domain;

import java.io.Serializable;
import java.math.BigDecimal;
import java.sql.Timestamp;

/**
 * 说明： 售货机实时数据
 * 作者： 王娇
 * 时间： 2017 年 07 月 10 日
 */
public class Vendor implements Serializable {

	//================08.06新增云端===========================
	private  Integer cloudSet;//1：表示启用了云端商城模式

	public Integer getCloudSet() {
		return cloudSet;
	}

	public void setCloudSet(Integer cloudSet) {
		this.cloudSet = cloudSet;
	}
	//================08.06新增云端===========================

	private Integer vendorId;

	private String vendorName;

	public String getCommPassword() {
		return commPassword;
	}

	public void setCommPassword(String commPassword) {
		this.commPassword = commPassword;
	}

	private String commPassword;

	private Integer factoryId;

	private Integer agencyId;

	private Integer checked;

	private String checkUser;


	private Integer mdbbillAlarmCode;

	private Integer mdbchangerAlarmCode;

	private Integer temperature;

	private Integer leavedBill;

	private Integer leavedCoin;

	private String softVersion;

	private String hardwareVersion;

	private Integer maxChannelNum;

	private String boardTemperature;


	private Integer actived;

	private String inactiveReason;

	private Integer totalSaled;

	private BigDecimal totalMoney;

	private BigDecimal totalBill;

	private BigDecimal totalCoin;

	private BigDecimal totalChange;

	private BigDecimal totalCashless;

	private BigDecimal totalExtraIncome;

	private Integer currentSaled;

	private BigDecimal currentMoney;

	private BigDecimal currentBill;


	private BigDecimal currentCoin;

	private BigDecimal currentChange;

	private BigDecimal currentCashless;

	private BigDecimal currentExtraIncome;

	private String modelNumber;

	private String thirdpayId;

	public String getThirdpayId() {
		return thirdpayId;
	}

	public void setThirdpayId(String thirdpayId) {
		this.thirdpayId = thirdpayId;
	}

	private String thirdpayKey;

	private Integer wirelessPayEnabled;

	private Integer gprsLevel;
	//===========================7.28===货道表接受统计对象属性========================================
	private Integer sum; //库存数量
	private Integer countNum;//库存状态
	private Integer countStatus;//马达状态

	public Integer getSum() {
		return sum;
	}

	public void setSum(Integer sum) {
		this.sum = sum;
	}

	public Integer getCountNum() {
		return countNum;
	}

	public void setCountNum(Integer countNum) {
		this.countNum = countNum;
	}

	public Integer getCountStatus() {
		return countStatus;
	}

	public void setCountStatus(Integer countStatus) {
		this.countStatus = countStatus;
	}
	//===================================================================================
	//===========================7.26===日期这个格式真头疼========================================
	private Timestamp lastUpdateTime;

	private Timestamp registeredTime;

	private Timestamp expireDate;
	private Timestamp timestamps;

	private Timestamp lastSaleTime;
	private Timestamp dateOfProduct;

	public Timestamp getLastUpdateTime() {
		return lastUpdateTime;
	}

	public void setLastUpdateTime(Timestamp lastUpdateTime) {
		this.lastUpdateTime = lastUpdateTime;
	}

	public Timestamp getRegisteredTime() {
		return registeredTime;
	}

	public void setRegisteredTime(Timestamp registeredTime) {
		this.registeredTime = registeredTime;
	}

	public Timestamp getExpireDate() {
		return expireDate;
	}

	public void setExpireDate(Timestamp expireDate) {
		this.expireDate = expireDate;
	}

	public Timestamp getTimestamps() {
		return timestamps;
	}

	public void setTimestamps(Timestamp timestamps) {
		this.timestamps = timestamps;
	}

	public Timestamp getLastSaleTime() {
		return lastSaleTime;
	}

	public void setLastSaleTime(Timestamp lastSaleTime) {
		this.lastSaleTime = lastSaleTime;
	}

	public Timestamp getDateOfProduct() {
		return dateOfProduct;
	}

	public void setDateOfProduct(Timestamp dateOfProduct) {
		this.dateOfProduct = dateOfProduct;
	}
	//====================================================================

	//====================================================================
	private String agencyName;//打印 售货机列表 需要前端的字段

	public String getAgencyName() {
		return agencyName;
	}

	public void setAgencyName(String agencyName) {
		this.agencyName = agencyName;
	}

	//=====================================================================
	public Integer getVendorId() {
		return vendorId;
	}

	public void setVendorId(Integer vendorId) {
		this.vendorId = vendorId;
	}

	public String getVendorName() {
		return vendorName;
	}

	public void setVendorName(String vendorName) {
		this.vendorName = vendorName == null ? null : vendorName.trim();
	}

	public Integer getFactoryId() {
		return factoryId;
	}

	public void setFactoryId(Integer factoryId) {
		this.factoryId = factoryId;
	}

	public Integer getAgencyId() {
		return agencyId;
	}

	public void setAgencyId(Integer agencyId) {
		this.agencyId = agencyId;
	}

	public Integer getChecked() {
		return checked;
	}

	public void setChecked(Integer check) {
		this.checked = check;
	}

	public String getCheckUser() {
		return checkUser;
	}

	public void setCheckUser(String checkUser) {
		this.checkUser = checkUser == null ? null : checkUser.trim();
	}

	//public Date getLastUpdateTime() {
	//	return lastUpdateTime;
	//}
	//
	//public void setLastUpdateTime(Date lastUpdateTime) {
	//	this.lastUpdateTime = lastUpdateTime;
	//}
	//
	//public Date getRegisteredTime() {
	//	return registeredTime;
	//}
	//
	//public void setRegisteredTime(Date registeredTime) {
	//	this.registeredTime = registeredTime;
	//}
	//
	//public Date getExpireDate() {
	//	return expireDate;
	//}
	//
	//public void setExpireDate(Date expireDate) {
	//	this.expireDate = expireDate;
	//}

	public Integer getMdbbillAlarmCode() {
		return mdbbillAlarmCode;
	}

	public void setMdbbillAlarmCode(Integer mdbbillAlarmCode) {
		this.mdbbillAlarmCode = mdbbillAlarmCode;
	}

	public Integer getMdbchangerAlarmCode() {
		return mdbchangerAlarmCode;
	}

	public void setMdbchangerAlarmCode(Integer mdbchangerAlarmCode) {
		this.mdbchangerAlarmCode = mdbchangerAlarmCode;
	}

	public Integer getTemperature() {
		return temperature;
	}

	public void setTemperature(Integer temperature) {
		this.temperature = temperature;
	}

	public Integer getLeavedBill() {
		return leavedBill;
	}

	public void setLeavedBill(Integer leavedBill) {
		this.leavedBill = leavedBill;
	}

	public Integer getLeavedCoin() {
		return leavedCoin;
	}

	public void setLeavedCoin(Integer leavedCoin) {
		this.leavedCoin = leavedCoin;
	}

	public String getSoftVersion() {
		return softVersion;
	}

	public void setSoftVersion(String softVersion) {
		this.softVersion = softVersion == null ? null : softVersion.trim();
	}

	public String getHardwareVersion() {
		return hardwareVersion;
	}

	public void setHardwareVersion(String hardwareVersion) {
		this.hardwareVersion = hardwareVersion == null ? null : hardwareVersion.trim();
	}

	public Integer getMaxChannelNum() {
		return maxChannelNum;
	}

	public void setMaxChannelNum(Integer maxChannelNum) {
		this.maxChannelNum = maxChannelNum;
	}

	public String getBoardTemperature() {
		return boardTemperature;
	}

	public void setBoardTemperature(String boardTemperature) {
		this.boardTemperature = boardTemperature == null ? null : boardTemperature.trim();
	}
	//
	//public Date getTimestamps() {
	//	return timestamps;
	//}
	//
	//public void setTimestamps(Date timestamps) {
	//	this.timestamps = timestamps;
	//}
	//
	//public Date getLastSaleTime() {
	//	return lastSaleTime;
	//}
	//
	//public void setLastSaleTime(Date lastSaleTime) {
	//	this.lastSaleTime = lastSaleTime;
	//}

	public Integer getActived() {
		return actived;
	}

	public void setActived(Integer actived) {
		this.actived = actived;
	}

	public String getInactiveReason() {
		return inactiveReason;
	}

	public void setInactiveReason(String inactiveReason) {
		this.inactiveReason = inactiveReason == null ? null : inactiveReason.trim();
	}

	public Integer getTotalSaled() {
		return totalSaled;
	}

	public void setTotalSaled(Integer totalSaled) {
		this.totalSaled = totalSaled;
	}

	public BigDecimal getTotalMoney() {
		return totalMoney;
	}

	public void setTotalMoney(BigDecimal totalMoney) {
		this.totalMoney = totalMoney;
	}

	public BigDecimal getTotalBill() {
		return totalBill;
	}

	public void setTotalBill(BigDecimal totalBill) {
		this.totalBill = totalBill;
	}

	public BigDecimal getTotalCoin() {
		return totalCoin;
	}

	public void setTotalCoin(BigDecimal totalCoin) {
		this.totalCoin = totalCoin;
	}

	public BigDecimal getTotalChange() {
		return totalChange;
	}

	public void setTotalChange(BigDecimal totalChange) {
		this.totalChange = totalChange;
	}

	public BigDecimal getTotalCashless() {
		return totalCashless;
	}

	public void setTotalCashless(BigDecimal totalCashless) {
		this.totalCashless = totalCashless;
	}

	public BigDecimal getTotalExtraIncome() {
		return totalExtraIncome;
	}

	public void setTotalExtraIncome(BigDecimal totalExtraIncome) {
		this.totalExtraIncome = totalExtraIncome;
	}

	public Integer getCurrentSaled() {
		return currentSaled;
	}

	public void setCurrentSaled(Integer currentSaled) {
		this.currentSaled = currentSaled;
	}

	public BigDecimal getCurrentMoney() {
		return currentMoney;
	}

	public void setCurrentMoney(BigDecimal currentMoney) {
		this.currentMoney = currentMoney;
	}

	public BigDecimal getCurrentBill() {
		return currentBill;
	}

	public void setCurrentBill(BigDecimal currentBill) {
		this.currentBill = currentBill;
	}

	public BigDecimal getCurrentCoin() {
		return currentCoin;
	}

	public void setCurrentCoin(BigDecimal currentCoin) {
		this.currentCoin = currentCoin;
	}

	public BigDecimal getCurrentChange() {
		return currentChange;
	}

	public void setCurrentChange(BigDecimal currentChange) {
		this.currentChange = currentChange;
	}

	public BigDecimal getCurrentCashless() {
		return currentCashless;
	}

	public void setCurrentCashless(BigDecimal currentCashless) {
		this.currentCashless = currentCashless;
	}

	public BigDecimal getCurrentExtraIncome() {
		return currentExtraIncome;
	}

	public void setCurrentExtraIncome(BigDecimal currentExtraIncome) {
		this.currentExtraIncome = currentExtraIncome;
	}

	public String getModelNumber() {
		return modelNumber;
	}

	public void setModelNumber(String modelNumber) {
		this.modelNumber = modelNumber == null ? null : modelNumber.trim();
	}

	//public String getThirdpayId() {
	//	return thirdpayId;
	//}
	//
	//public void setThirdpayId(String thirdpayId) {
	//	this.thirdpayId = thirdpayId == null ? null : thirdpayId.trim();
	//}

	public String getThirdpayKey() {
		return thirdpayKey;
	}

	public void setThirdpayKey(String thirdpayKey) {
		this.thirdpayKey = thirdpayKey == null ? null : thirdpayKey.trim();
	}

	public Integer getWirelessPayEnabled() {
		return wirelessPayEnabled;
	}

	public void setWirelessPayEnabled(Integer wirelessPayEnabled) {
		this.wirelessPayEnabled = wirelessPayEnabled;
	}

	//public Date getDateOfProduct() {
	//	return dateOfProduct;
	//}
	//
	//public void setDateOfProduct(Date dateOfProduct) {
	//	this.dateOfProduct = dateOfProduct;
	//}

	public Integer getGprsLevel() {
		return gprsLevel;
	}

	public void setGprsLevel(Integer gprsLevel) {
		this.gprsLevel = gprsLevel;
	}

}