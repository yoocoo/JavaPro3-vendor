package cn.wj.domain;

/**
 * 6.20 日配置 分页拦截器 参考一个项目里的代码
 * 作者： 王娇
 * 时间：2017 年 06 月 20 日
 * @param <O>
 */
public class PageObject <O>{

	//每个界面的记录总条数
	private int number;
	//当前页
	private int page;
	//总的页数
	private int pages;
	//总的记录条数
	private int count;
	private O obj;
	
	private void init(){
		this.number = 10;
		this.page = 1;
		this.pages = 1;
		this.count = 0;
	}
	
	public PageObject(){
		init();
	}

	public PageObject(int number){
		init();
		this.number = ((number>0) ?number:this.number);
	}
	
	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getPages() {
		return pages;
	}

	public void setPages(int pages) {
		this.pages = pages;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public O getObj() {
		return obj;
	}

	public void setObj(O obj) {
		this.obj = obj;
	}
	
}
