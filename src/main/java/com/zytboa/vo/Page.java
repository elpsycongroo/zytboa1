package com.zytboa.vo;

/**
 * Created by Administrator on 2017/3/27.
 */
public class Page {
    private int total;//总记录数
    private int rows;//当前页记录
    private int offset;//起始记录编号
    private int limit;//每页记录数

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public int getRows() {
        return rows;
    }

    public void setRows(int rows) {
        this.rows = rows;
    }

    public int getOffset() {
        return offset;
    }

    public void setOffset(int offset) {
        this.offset = offset;
    }

    public int getLimit() {
        return limit;
    }

    public void setLimit(int limit) {
        this.limit = limit;
    }
}
