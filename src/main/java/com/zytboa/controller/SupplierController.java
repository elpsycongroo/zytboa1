package com.zytboa.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.zytboa.service.SupplierService;
import com.zytboa.vo.Page;
import com.zytboa.vo.Supplier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
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
    public Object supplier(){
        return "forward:/WEB-INF/supplier/supplier.jsp";
    }

    @RequestMapping("/supplier/supplierList")
    @ResponseBody
    public Object getSupplierList(Page page,String filter){
        Map<String,Object> map = new HashMap<>();
        JSONObject json = JSON.parseObject(filter);
        List<Supplier> resList = supplierService.selectByPage(page,json);
        map.put("total",page.getTotal());
        map.put("rows",resList);
        return JSON.toJSONString(map);
    }

}
