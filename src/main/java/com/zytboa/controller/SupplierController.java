package com.zytboa.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Administrator on 2017/3/25.
 */
@Controller
@RequestMapping("/supplier")
public class SupplierController {

    @RequestMapping("/supplierList")
    public Object getSupplierList(){
        return null;
    }

}
