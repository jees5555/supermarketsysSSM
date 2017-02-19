package com.github.jees5555.supermarketsysSSM.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.github.jees5555.supermarketsysSSM.entity.User;
import com.github.jees5555.supermarketsysSSM.util.Page;

public interface UserDao{
	 public User login(User user);
	 
	 public int getUserTotalItems(User user);
	
	 public List<User> getUserList(@Param("user") User user,@Param("page") Page page);
	 
	 public User getUser(String id);
	 
	 public int isUserExistById(String id);
	 
	 public int isUserExistByName(String userName);
	 
	 public int isUserPasswordCorrect(User user);
	 
	 public int addUser(User user);
	 
	 public int updateUser(User user);
	 
	 public int updateUserPassword(User user);
	 
	 public int deleteUser(String id);
	 
	

}
