package cn.wj.domain;

import java.io.Serializable;
import java.util.Date;

public class User implements Serializable {
	private Integer userId;//用户ID


	private String nextUrl;//下一步操作地址

	private String accountName;//用户名

	private String password;//用户密码

	private String realName;//用户真实姓名

	private Integer roleId;//用户角色ID 对应着相应的角色

	private Integer factoryId;// 所属的生产商

	private Integer agencyId;// 所属的运营商

	private String nickName;//  用户昵称

	private String email;//  电子邮箱

	private Date lastLoginTime;// 最近一次登录时间

	private String fixPhone;// 传真电话

	private String mobilePhone;// 移动电话

	private String qq;// qq号码

	private String postcode;// 邮编

	private String idcard;// 身份证号

	private Integer loginCount;// 登录次数

	private String postAdress;// 家庭地址

	private Date creatTime;// 创建时间

	private String headImage;//头像地址

	private Byte approved;// 是否通过验证， 1通过验证就是没有被删除，


	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getNextUrl() {
		return nextUrl;
	}

	public void setNextUrl(String nextUrl) {
		this.nextUrl = nextUrl;
	}

	public String getAccountName() {
		return accountName;
	}

	public void setAccountName(String accountName) {
		this.accountName = accountName == null ? null : accountName.trim();
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password == null ? null : password.trim();
	}

	public String getRealName() {
		return realName;
	}

	public void setRealName(String realName) {
		this.realName = realName == null ? null : realName.trim();
	}

	public Integer getRoleId() {
		return roleId;
	}

	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
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

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName == null ? null : nickName.trim();
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email == null ? null : email.trim();
	}

	public Date getLastLoginTime() {
		return lastLoginTime;
	}

	public void setLastLoginTime(Date lastLoginTime) {
		this.lastLoginTime = lastLoginTime;
	}

	public String getFixPhone() {
		return fixPhone;
	}

	public void setFixPhone(String fixPhone) {
		this.fixPhone = fixPhone == null ? null : fixPhone.trim();
	}

	public String getMobilePhone() {
		return mobilePhone;
	}

	public void setMobilePhone(String mobilePhone) {
		this.mobilePhone = mobilePhone == null ? null : mobilePhone.trim();
	}

	public String getQq() {
		return qq;
	}

	public void setQq(String qq) {
		this.qq = qq == null ? null : qq.trim();
	}

	public String getPostcode() {
		return postcode;
	}

	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}

	public String getIdcard() {
		return idcard;
	}

	public void setIdcard(String idcard) {
		this.idcard = idcard == null ? null : idcard.trim();
	}

	public Integer getLoginCount() {
		return loginCount;
	}

	public void setLoginCount(Integer loginCount) {
		this.loginCount = loginCount;
	}

	public String getPostAdress() {
		return postAdress;
	}

	public void setPostAdress(String postAdress) {
		this.postAdress = postAdress == null ? null : postAdress.trim();
	}

	public Date getCreatTime() {
		return creatTime;
	}

	public void setCreatTime(Date creatTime) {
		this.creatTime = creatTime;
	}

	public String getHeadImage() {
		return headImage;
	}

	public void setHeadImage(String headImage) {
		this.headImage = headImage == null ? null : headImage.trim();
	}

	public Byte getApproved() {
		return approved;
	}

	public void setApproved(Byte approved) {
		this.approved = approved;
	}

	@Override
	public String toString() {
		return "User{" +
				"userId='" + userId + '\'' + "nextUrl='" + nextUrl + '\'' + ", accountName='" + accountName + '\'' +
				", password='" + password + '\'' + ", realName='" + realName + '\'' + ", roleId='" + roleId + '\'' +
				", factoryId=" + factoryId + ", agencyId='" + agencyId + '\'' + ", nickName='" + nickName + '\'' +
				", email='" + email + '\'' + ", lastLoginTime='" + lastLoginTime + '\'' + ", fixPhone='" + fixPhone + '\'' +
				", mobilePhone='" + mobilePhone + '\'' + ", qq='" + qq + '\'' + ", postcode='" + postcode + '\'' +
				", idcard='" + idcard + '\'' + ", loginCount='" + loginCount + '\'' + ", idcard='" + idcard + '\'' +
				", postAdress='" + postAdress + '\'' + ", creatTime='" + creatTime + '\'' + ", headImage='" + headImage + '\'' +
				", approved='" + approved +
				'}';
	}

}