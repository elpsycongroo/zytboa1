package com.zytboa.service;

import com.alibaba.fastjson.JSONObject;
import com.zytboa.vo.Page;
import com.zytboa.vo.Supplier;

import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2017/3/27.
 */
public interface SupplierService {
    List<Supplier> selectByPage(Page page, JSONObject json,boolean flag);
    int addRow(Supplier supplier);
    int deleteRows(List<Supplier> suppliers);
    int updateRow(Supplier supplier);
    Object findSupplierType(String type);
}
