package com.zytboa.controller;



import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zytboa.service.UserService;
import com.zytboa.vo.User;

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
	
}
