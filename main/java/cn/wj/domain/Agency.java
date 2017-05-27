package cn.wj.domain;

import java.io.Serializable;

public class Agency implements Serializable {

	private Integer agencyId;//运营商ID

	private String agencyName;//运营商单位描述

	private String accountName;//运营商对应用户表中 唯一的账户名


	private String agecynextUrl; //下一步的的操作地址

	public String getAgecynextUrl() {
		return agecynextUrl;
	}

	public void setAgecynextUrl(String agecynextUrl) {
		this.agecynextUrl = agecynextUrl;
	}

	public Integer getAgencyId() {
		return agencyId;
	}

	public void setAgencyId(Integer agencyId) {
		this.agencyId = agencyId;
	}

	public String getAgencyName() {
		return agencyName;
	}

	public void setAgencyName(String agencyName) {
		this.agencyName = agencyName == null ? null : agencyName.trim();
	}

	public String getAccountName() {
		return accountName;
	}

	public void setAccountName(String accountName) {
		this.accountName = accountName == null ? null : accountName.trim();
	}

	@Override
	public String toString() {
		return "Agency{" +
				"agencyId='" + agencyId + '\'' + "agencyName='" + agencyName +
				", accountName='" + accountName + '}';
	}
}