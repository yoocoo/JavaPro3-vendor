package cn.wj.domain;

import java.io.Serializable;

/**
 * date:2017.05.28
 * anthor: 王娇
 *
 * @SuppressWarnings
 * 可以抑制一些能通过编译但是存在有可能运行异常的代码会发出警告，
 * 你确定代码运行时不会出现警告提示的情况下，可以使用这个注释。
 * ("serial")是序列化警告，当实现了序列化接口的类上缺少serialVersionUID属性的定义时，
 * 会出现黄色警告。可以使用@SuppressWarnings将警告关闭
 */
@SuppressWarnings("serial")
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
				"agencyId='" + agencyId + '\'' + ",agencyName='" + agencyName +
				", accountName='" + accountName + '\''+
				'}';
	}
}