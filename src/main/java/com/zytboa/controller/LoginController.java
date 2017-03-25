package com.zytboa.controller;

import com.zytboa.Constants.Constants;
import com.zytboa.service.UserService;
import com.zytboa.vo.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Created by Administrator on 2017/3/23.
 */
@Controller
public class LoginController {

    @Resource
    private UserService userService;

    @RequestMapping("/login")
    public String login(){
        return "forward:/WEB-INF/jsp/login.jsp";
    }

    @RequestMapping(value="/loginValidate",method = RequestMethod.POST)
    public String loginValidate(User userlogin, HttpSession session){
        User user = userService.login(userlogin);
        if(user != null){
            session.setAttribute("user",user);
            if(session.getAttribute("msg") != null){
                session.removeAttribute("msg");
            }
            return "redirect:/index";
        }
        session.setAttribute("msg", Constants.INVALID_LOGIN);
        return "redirect:/login";
    }
    @RequestMapping("/index")
    public String index(){
        return "index.jsp";
    }

}
