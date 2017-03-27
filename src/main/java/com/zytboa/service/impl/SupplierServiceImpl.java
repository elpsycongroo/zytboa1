package com.zytboa.service.impl;


import com.alibaba.fastjson.JSONObject;
import com.zytboa.dao.SupplierMapper;
import com.zytboa.service.SupplierService;
import com.zytboa.vo.Page;
import com.zytboa.vo.Supplier;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2017/3/27.
 */
@Service
public class SupplierServiceImpl implements SupplierService{

    @Resource
    private SupplierMapper mapper;

    @Override
    public List<Supplier> selectByPage(Page page, JSONObject json) {
        String key = "",value = "";
        Map<String,Object> resMap = new HashMap<>();
        if(json != null && json.size() > 0){
            for(String k : json.keySet()){
                key = k;
            }
            value = json.getString(key);
        resMap.put(key,value);
        }
        //修改分页总记录数
        page.setTotal(mapper.selectCount());
        resMap.put("page",page);
        return mapper.selectByPage(page);
    }
}
