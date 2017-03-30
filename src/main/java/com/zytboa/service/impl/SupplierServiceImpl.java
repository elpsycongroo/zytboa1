package com.zytboa.service.impl;


import com.alibaba.fastjson.JSONObject;
import com.zytboa.Constants.Constants;
import com.zytboa.dao.SupplierMapper;
import com.zytboa.dao.TableMappingMapper;
import com.zytboa.service.SupplierService;
import com.zytboa.vo.Page;
import com.zytboa.vo.Supplier;
import com.zytboa.vo.TableMapping;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2017/3/27.
 */
@Service
public class SupplierServiceImpl implements SupplierService {

    @Resource
    private SupplierMapper supplierMapper;

    @Resource
    private TableMappingMapper tableMappingMapper;

    @Resource
    private TableMapping tableMapping;

    /**
     * 提供商分页综合方法
     * @param page 分页实体
     * @param json 前台传来的查询信息
     * @param flag 是否转换type到文字（用于导出）
     * @return List 分页结果列表
     */
    @Override
    public List<Supplier> selectByPage(Page page, JSONObject json, boolean flag) {
        String value;
        Map<String, Object> resMap = new HashMap<>();
        if (json != null && json.size() > 0) {
            for (String key : json.keySet()) {
                value = json.getString(key);
                resMap.put(key, "%" + value + "%");//此处键值对属性名-属性值
            }
        }
        resMap.put("offset", page.getOffset());
        resMap.put("limit", page.getLimit());
        List<Supplier> resList = supplierMapper.selectByPage(resMap);
        if (flag) {
            tableMapping.setTmTableId(Constants.TABLE_ID_SUPPLIER);
            tableMapping.setTmTableCol(Constants.TABLE_COL_SUPPLIER_TYPE);
            List<TableMapping> mappingList = tableMappingMapper.selectByTableId(tableMapping);
            for (Supplier s : resList) {
                for (TableMapping t : mappingList) {
                    if (Integer.parseInt(s.getSupType()) == t.getTmTableColKey()) {
                        s.setSupType(t.getTmTableColVal());
                        break;
                    }
                }
            }
        }
        //修改分页总记录数 这里用resList.size()显然会只取到一页的行数
        page.setTotal(supplierMapper.selectCount(resMap));
        return resList;
    }

    @Override
    public int addRow(Supplier supplier) {
        return supplierMapper.insertSelective(supplier);
    }

    @Override
    public int deleteRows(List<Supplier> suppliers) {
        String[] ids = new String[suppliers.size()];
        for (int i = 0; i < suppliers.size(); i++) {
            ids[i] = suppliers.get(i).getSupId();
        }
        return supplierMapper.deleteSeleted(ids);
    }

    @Override
    public int updateRow(Supplier supplier) {
        return supplierMapper.updateByPrimaryKeySelective(supplier);
    }

}
