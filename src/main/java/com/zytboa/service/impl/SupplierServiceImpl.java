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
        String value;
        Map<String,Object> resMap = new HashMap<>();
        if(json != null && json.size() > 0){
            for(String key : json.keySet()){
                value = json.getString(key);
                resMap.put(key,"%"+value+"%");//此处键值对属性名-属性值
            }
        }
        resMap.put("offset",page.getOffset());
        resMap.put("limit",page.getLimit());
        List<Supplier> resList = mapper.selectByPage(resMap);
        //修改分页总记录数 这里用resList.size()显然会只取到一页的行数
        page.setTotal(mapper.selectCount(resMap));
        return resList;
    }

    @Override
    public int addRow(Supplier supplier) {
        return mapper.insertSelective(supplier);
    }

    @Override
    public int deleteRows(List<Supplier> suppliers){
        String[] ids = new String[suppliers.size()];
        for(int i = 0; i < suppliers.size(); i ++){
            ids[i] = suppliers.get(i).getSupId();
        }
        return mapper.deleteSeleted(ids);
    }

    @Override
    public int updateRow(Supplier supplier) {
        return mapper.updateByPrimaryKeySelective(supplier);
    }

}
