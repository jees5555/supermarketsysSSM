package com.github.jees5555.supermarketsysSSM.service;

import java.util.List;

import com.github.jees5555.supermarketsysSSM.entity.User;

public interface UserService {
	
	 public User login(User user);
		
	 public List<User> getUserList(User user);
	 
	 public User getUser(String id);
	 
	 public int isUserExist(User user);
	 
	 public int isUserPasswordCorrect(User user);
	 
	 public int addUser(User user);
	 
	 public int updateUser(User user);
	 
	 public int updateUserPassword(User user);
	 
	 public int deleteUser(String id);
}
