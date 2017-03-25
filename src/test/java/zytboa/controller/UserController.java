package zytboa.controller;



import java.lang.reflect.Array;
import java.util.ArrayList;
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
	private UserService userService;
	@Resource
	private User user;
	
	@RequestMapping("/userList")
	public String userList(HttpServletRequest req,Model model){
		List<User> userList = userService.getAll();
		model.addAttribute("userList",userList);
		return "forward:/WEB-INF/jsp/userList.jsp";
	}

	@RequestMapping("/userTable")
	@ResponseBody
	public Object userTable(int limit,int offset,String name){
		Map<String,Object> resMap = new HashMap<>();
		List<User> userList = userService.getAll();
		//如果前台设置了服务器分页则必须有total 和rows属性
		resMap.put("total",userList.size());
		resMap.put("rows",userList);
		return JSON.toJSONString(resMap);
	}

	/**
	 * 父子表测试代码
	 * 如果上面的没有规定服务器端分页则下面的需要直接返回list集合
	 * 否则也和上面一样返回total+rows(严格命名)
	 * @param parentid
	 * @return
	 */
	@RequestMapping("/subUserTable")
	@ResponseBody
	public Object subUserTable(int parentid){
		Map<String,Object> resMap = new HashMap<>();
		List<User> userList = new ArrayList<>();
		User resUser = userService.findByUserId(parentid);
		resMap.put("total",1);
		userList.add(resUser);
		resMap.put("rows",userList);
		return JSON.toJSONString(resMap);
	}

	@RequestMapping("/updateUser")
    @ResponseBody
	public Object updateUser(User user){
	    String res;
	    try{
			userService.update(user);
        }catch (Exception e){
	        e.printStackTrace();
            res = "Exception Raised...";
            return res;
        }
        res = "success";
        return res;
    }

	
}
