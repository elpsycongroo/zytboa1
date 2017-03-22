package com.zytboa.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.zytboa.dao.UserDao;
import com.zytboa.service.UserService;
import com.zytboa.vo.User;

@Service(value="userService")
public class UserServiceImpl implements UserService{

	@Resource
	private UserDao userDao;

	@Override
	public int add(User user) {
		return userDao.add(user);
	}

	@Override
	public List<User> getAll() {
		return userDao.getAll();
	}

	@Override
	public int update(User user) {
		return userDao.update(user);
	}


}
