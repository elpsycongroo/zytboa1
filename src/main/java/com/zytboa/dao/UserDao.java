package com.zytboa.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.zytboa.vo.User;

@Repository(value="userDao")
public interface UserDao {
	
	public int add(User user);
	
	public List<User> getAll();

	public int update(User user);
	
}
