package com.zytboa.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Administrator on 2017/3/25.
 */
@Controller
public class SupplierController {

    @RequestMapping("/supplier")
    public Object getSupplierList(){
        return "forward:/WEB-INF/supplier/supplier.jsp";
    }

}
