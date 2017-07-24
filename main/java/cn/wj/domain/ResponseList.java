package cn.wj.domain;

/**
 * 用户日志列表
 * 具体看情况
 * Created by ThinkPad on 2017/4/24.
 */
public class ResponseList<T> {
	public final static int OK = 1, FAILED = 0, EMPUTY = -1;
	public final static String OK_STR = "成功", FAILED_STR = "失败", EMPUTY_STR = "数据为空";

	private int code; // 状态码,0成功;1空数据;-1请求失败
	private String msg;
	private Object data;
	private int pageNum;//显示页码
	private int pageSize;//每页多少行
	private int totalNum;//总条数
//====================================================================
	private int sEcho;//记录操作的次数，每次加一，相当于页码
	private int iDisplayStart;//数据总条数

	public int getsEcho() {return sEcho;}

	public void setsEcho(int sEcho) {
		this.sEcho = sEcho;
	}

	public int getiDisplayStart() {
		return iDisplayStart;
	}

	public void setiDisplayStart(int iDisplayStart) {
		this.iDisplayStart = iDisplayStart;
	}

//=============================================================================
	public int getTotalNum() {
		return totalNum;
	}

	public void setTotalNum(int totalNum) {
		this.totalNum = totalNum;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

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

}

