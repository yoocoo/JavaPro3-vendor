package cn.wj.domain;

import java.io.Serializable;

public class RoleInMenu implements Serializable {
	private Integer id; // 菜单角色关联ID

	private Integer roleId; //角色ID

	private Integer menuId; //菜单ID

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getRoleId() {
		return roleId;
	}

	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}

	public Integer getMenuId() {
		return menuId;
	}

	public void setMenuId(Integer menuId) {
		this.menuId = menuId;
	}

	@Override
	public String toString() {
		return "{"
					 + '\"' +   "id"    + '\"'+ ":" + '\"' + id + '\"'
				+"," + '\"' +  "roleId" +'\"' + ":" + '\"'+ roleId +'\"'
				+"," + '\"' +  "menuId" +'\"' + ":" + '\"'+ menuId  +'\"'
				+ '}';

	}
}