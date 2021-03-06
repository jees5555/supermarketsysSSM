package com.github.jees5555.supermarketsysSSM.service;

import java.util.List;

import com.github.jees5555.supermarketsysSSM.entity.User;
import com.github.jees5555.supermarketsysSSM.util.Page;

public interface UserService {
	
	 public User login(User user);
		
	 public List<User> getUserList(User user,Page page);
	 
	 public User getUser(String id);
	 
	 public boolean isUserExist(User user);
	 
	 public boolean isUserPasswordCorrect(User user);
	 
	 public int addUser(User user);
	 
	 public int updateUser(User user);
	 
	 public int updateUserPassword(User user);
	 
	 public int deleteUser(String id);
}
