package cn.wj.utils;

import java.util.List;
import java.util.ArrayList;
/**
 * pageHelper
 * Created by ThinkPad on 2017/6/20.
 */
public class Datagrid {
	private long total;
	private List rows = new ArrayList();

	public Datagrid(){
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

