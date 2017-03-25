package zytboa.service;

import java.util.List;

import com.zytboa.vo.User;


public interface UserService {
	
	public int add(User user);
	
	public List<User> getAll();

	public int update(User user);

	public User login(User user);

	public User findByUserId(int id);

}
