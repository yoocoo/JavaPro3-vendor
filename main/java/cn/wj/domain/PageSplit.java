package cn.wj.domain;

/**
 * Created by 王娇 on 2017/06/27.
 * doT.min.js版本物理分页 使用到这种
 */
public class PageSplit {
    private int pageNum,pageSize;

    @Override
    public String toString() {
        return "PageSplit{" +
                "pageNum=" + pageNum +
                ", pageSize=" + pageSize +
                '}';
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
}
