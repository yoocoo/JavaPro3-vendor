package cn.wj.domain;

import java.util.List;

/**
 * EasyUI tree模型
 */
public class Tree {

	private int id;                        //节点的ID  =====menuId;//菜单ID
	private String text;        //节点显示的文字  ========menuName;//菜单名
	private String state = "open";        //默认open,如果为'closed'的时候，将不自动展开该节点。
	private boolean checked = false;    //指示节点是否被选中
	private Object attributes;            //给一个节点追加的自定义属性  =========countChildrens;
	private List<Tree> children;        //定义了一些子节点的节点数组   孩子节点的List
	private String iconCls;                //定义该节点的样式	  ====menuIcon;//菜单图标
	private int pid;                    //定义该节点的父节点

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public boolean isChecked() {
		return checked;
	}

	public void setChecked(boolean checked) {
		this.checked = checked;
	}

	public Object getAttributes() {
		return attributes;
	}

	public void setAttributes(Object attributes) {
		this.attributes = attributes;
	}


	public List<Tree> getChildren() {
		return children;
	}

	public void setChildren(List<Tree> children) {
		this.children = children;
	}

	public String getIconCls() {
		return iconCls;
	}

	public void setIconCls(String iconCls) {
		this.iconCls = iconCls;
	}

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	@Override
	public String toString() {
		return "Menu{" +
				"id='" + id + '\''
				+ ",text='" + text + '\''
				+ ", state='" + state + '\''
				+ ", checked='" + checked + '\''
				+ ", attributes='" + attributes + '\''
				+ ", children='" + children + '\''
				+ ", iconCls='" + iconCls + '\''
				+ ", pid='" + pid +
				'}';
	}
}
