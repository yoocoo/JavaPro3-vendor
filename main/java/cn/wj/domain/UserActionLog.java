package cn.wj.domain;

import java.io.Serializable;
import java.sql.Date;


/**
 * Created by ThinkPad on 2017/4/24.
 * 新增用户日志表，作为安全管理，监控异常用户操作等行为
 * <p>
 * CREATE TABLE `user_action_log` (
 * `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
 * `account_name` VARCHAR(50) NULL DEFAULT NULL COMMENT '登录的用户名',
 * `session_id` VARCHAR(50) NULL DEFAULT NULL COMMENT '访问session的ID\r\n',
 * `time` DATETIME NULL DEFAULT CURRENT_TIMESTAMP COMMENT '操作时间',
 * `ip_addr_v4` VARCHAR(15) NULL DEFAULT NULL COMMENT 'ipV4地址',
 * `ip_addr_v6` VARCHAR(128) NULL DEFAULT NULL COMMENT 'ipv6地址\r\n',
 * `os_name` VARCHAR(20) NULL DEFAULT NULL COMMENT '操作系统名称',
 * `os_version` VARCHAR(20) NULL DEFAULT NULL,
 * `bro_name` VARCHAR(20) NULL DEFAULT NULL COMMENT '浏览器名称',
 * `bro_version` VARCHAR(20) NULL DEFAULT NULL COMMENT '浏览器版本',
 * `request_body` VARCHAR(60) NULL DEFAULT NULL COMMENT '请求体信息',
 * `description` VARCHAR(100) NULL DEFAULT NULL COMMENT '操作描述',
 * `other` VARCHAR(150) NULL DEFAULT NULL,
 * `method` VARCHAR(10) NULL DEFAULT NULL COMMENT 'HTTP请求方法',
 * PRIMARY KEY (`id`)
 * )
 * COMMENT='行为日志表'
 * ENGINE=InnoDB
 * ;
 */
public class UserActionLog implements Serializable {

	private long id;
	private String accountName, sessionId, ipAddrV4, ipAddrV6, osName, osVersion, broName, broVersion, requestBody, description, other, method;
	private Date time;

	public long getId() {
		return id;
	}

	public String getAccountName() {
		return accountName;
	}

	public void setAccountName(String accountName) {
		this.accountName = accountName;
	}

	public String getSessionId() {
		return sessionId;
	}

	public void setSessionId(String sessionId) {
		this.sessionId = sessionId;
	}

	public String getIpAddrV4() {
		return ipAddrV4;
	}

	public void setIpAddrV4(String ipAddrV4) {
		this.ipAddrV4 = ipAddrV4;
	}

	public String getIpAddrV6() {
		return ipAddrV6;
	}

	public void setIpAddrV6(String ipAddrV6) {
		this.ipAddrV6 = ipAddrV6;
	}

	public String getOsName() {
		return osName;
	}

	public void setOsName(String osName) {
		this.osName = osName;
	}

	public String getOsVersion() {
		return osVersion;
	}

	public void setOsVersion(String osVersion) {
		this.osVersion = osVersion;
	}

	public String getBroName() {
		return broName;
	}

	public void setBroName(String broName) {
		this.broName = broName;
	}

	public String getBroVersion() {
		return broVersion;
	}

	public void setBroVersion(String broVersion) {
		this.broVersion = broVersion;
	}

	public String getRequestBody() {
		return requestBody;
	}

	public void setRequestBody(String requestBody) {
		this.requestBody = requestBody;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getOther() {
		return other;
	}

	public void setOther(String other) {
		this.other = other;
	}

	public String getMethod() {
		return method;
	}

	public void setMethod(String method) {
		this.method = method;
	}

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	public void setId(long id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "UserActionLog{" +
				"id=" + id +
				", accountName='" + accountName + '\'' +
				", sessionId='" + sessionId + '\'' +
				", ipAddrV4='" + ipAddrV4 + '\'' +
				", ipAddrV6='" + ipAddrV6 + '\'' +
				", osName='" + osName + '\'' +
				", osVersion='" + osVersion + '\'' +
				", broName='" + broName + '\'' +
				", broVersion='" + broVersion + '\'' +
				", requestBody='" + requestBody + '\'' +
				", description='" + description + '\'' +
				", other='" + other + '\'' +
				", method='" + method + '\'' +
				", time=" + time +
				'}';
	}

}
