package com.zytboa.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.zytboa.Constants.Constants;
import com.zytboa.service.SupplierService;
import com.zytboa.vo.Page;
import com.zytboa.vo.Supplier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2017/3/25.
 */
@Controller
public class SupplierController {

    @Resource
    private SupplierService supplierService;

    @RequestMapping("/supplier")
    public Object supplier() {
        return "forward:/WEB-INF/supplier/supplier.jsp";
    }

    @RequestMapping("/supplier/export")
    public Object exportSupplier() {
        return "forward:/WEB-INF/supplier/supplierExport.jsp";
    }

    @RequestMapping("/supplier/supplierList")
    @ResponseBody
    public Object getSupplierList(Page page, String filter, String flag) {
        Map<String, Object> map = new HashMap<>();
        List<Supplier> resList;
        JSONObject json = JSON.parseObject(filter);
        if (flag.equals("false")) {
            resList = supplierService.selectByPage(page, json, Constants.METHOD_SUP_TYPE_FALSE);
        } else {
            resList = supplierService.selectByPage(page,json,Constants.METHOD_SUP_TYPE_TRUE);
        }
        map.put("total", page.getTotal());
        map.put("rows", resList);
        return JSON.toJSONString(map);
    }

    @RequestMapping("/supplier/saveSupplier")
    @ResponseBody
    public Object saveSupplier(Supplier supplier) {
        try {
            supplierService.addRow(supplier);
        } catch (Exception e) {
            e.printStackTrace();
            return e.getMessage();
        }
        return "success";
    }

    @RequestMapping("/supplier/deleteSupplier")
    @ResponseBody
    public Object deleteSupplier(String data) {
        try {
            List<Supplier> resList = JSON.parseArray(data, Supplier.class);
            supplierService.deleteRows(resList);
        } catch (Exception e) {
            e.printStackTrace();
            return e.getMessage();
        }
        return "success";
    }

    @RequestMapping("supplier/updateSupplier")
    @ResponseBody
    public Object updateSupplier(Supplier supplier) {
        try {
            supplierService.updateRow(supplier);
        } catch (Exception e) {
            e.printStackTrace();
            return e.getMessage();
        }
        return "success";
    }

    /**
     * 返回类型json 避免中文编码问题
     * @return
     */
    @RequestMapping(value="supplier/supplierType",produces = "text/html;charset=UTF-8")
    @ResponseBody
    public Object getSupplierType(){
        Map<String,String> resMap;
        try {
            resMap = supplierService.findSupplierType();
        }catch (Exception e){
            e.printStackTrace();
            return "{'1':'发生错误'}";
        }
        return JSON.toJSONString(resMap);
    }

}
