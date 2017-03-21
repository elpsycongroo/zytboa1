package com.zytboa.controller;



import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import com.alibaba.fastjson.JSON;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zytboa.service.UserService;
import com.zytboa.vo.User;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Resource
	private UserService userServiceImpl;
	
	@RequestMapping("/userList")
	public String userList(HttpServletRequest req,Model model){
		List<User> userList = userServiceImpl.getAll();
		model.addAttribute("userList",userList);
		return "userList";
	}

	@RequestMapping("/userTable")
	@ResponseBody
	public Object userTable(int limit,int offset,String name){
		Map<String,Object> resMap = new HashMap<>();
		List<User> userList = userServiceImpl.getAll();
		resMap.put("total",2);
		resMap.put("rows",userList);
		return JSON.toJSONString(resMap);
	}
	
}
