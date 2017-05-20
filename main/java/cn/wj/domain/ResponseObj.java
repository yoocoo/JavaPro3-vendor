package cn.wj.domain;

import java.util.List;

public class ResponseObj<T> {
	public final static int OK = 1, FAILED = 0, EMPUTY = -1;
	public final static String OK_STR = "成功", FAILED_STR = "失败", EMPUTY_STR = "数据为空";

	private int code; // 状态码,0成功;1空数据;-1请求失败
	private String msg;
	private String path;//数据库中头像地址
	private String fileName;//上传头像地址
	private Object userMessage;//得到用户信息
	private Object data;
	private Object menulist;//数据库中筛选出来的 权限菜单
	private Object treeList;//通过 tree 重新组装 权限菜单


	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public Object getData() {
		return data;
	}

	public void setData(Object data) {
		this.data = data;
	}

	public Object getTreelist(List<Tree> treeList) {
		return this.treeList;
	}

	public void setTreelist(List<Tree> treeList) {
		this.treeList = treeList;
	}

	public Object getMenulist() {
		return menulist;
	}

	/**
	 * 筛选出来所有的用户权限菜单
	 *
	 * @param menuList
	 */
	public void setMenulist(List<Menu> menuList) {
		this.menulist = menulist;
	}

	/**
	 * 获得图片在数据库中的地址
	 *
	 * @return
	 */
	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	/**
	 * 获得上传文件 名称
	 *
	 * @param fileName
	 */
	public void setfileName(String fileName) {
		this.fileName = fileName;
	}

	public String getfileName() {
		return fileName;
	}

	/**
	 * 提供用户原来资料
	 *
	 * @param userMessage
	 */
	public void setuserMessage(Object userMessage) {
		this.userMessage = userMessage;
	}

	public Object getuserMessage() {
		return userMessage;
	}
}
