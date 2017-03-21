package com.zytboa.service;

import java.util.List;

import com.zytboa.vo.User;


public interface UserService {
	
	public int add(User user);
	
	public List<User> getAll();

}
