package cn.wj.utils;

import java.util.List;
import java.util.ArrayList;

/**
 * 基于 Mybatside pageHelper 物理分页插件 工具类
 * 时间：2017/6/20.
 * 作者： 王娇
 *
 */
public class Datagrid {
	private long total;


//=================================================================
	private int length =10;
	private int draw =1;

	public int getDraw() {
		return draw;
	}

	public void setDraw(int draw) {
		this.draw = draw;
	}
	public int getLength() {
		return length;
	}

	public void setLength(int length) {
		this.length = length;
	}
	//===============================================================
	private List rows = new ArrayList();

	public Datagrid() {
		super();
	}

	public Datagrid(long total, List rows) {
		super();
		this.total = total;
		this.rows = rows;
	}

	public long getTotal() {
		return total;
	}

	public void setTotal(long total) {
		this.total = total;
	}

	public List getRows() {
		return rows;
	}

	public void setRows(List rows) {
		this.rows = rows;
	}

}

