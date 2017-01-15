package com.github.jees5555.supermarketsysSSM.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.jees5555.supermarketsysSSM.dao.UserDao;
import com.github.jees5555.supermarketsysSSM.entity.User;
import com.github.jees5555.supermarketsysSSM.service.UserService;
@Service
public class UserServiceImpl implements UserService{
	@Autowired
	private UserDao ud;

	@Override
	public User login(User user) {
		return ud.login(user);
	}

	@Override
	public List<User> getUserList(User user) {
		return ud.getUserList(user);
	}

	@Override
	public User getUser(String id) {
		return ud.getUser(id);
	}

	@Override
	public int isUserExist(User user) {
	int isExistByName= ud.isUserExistByName(user.getUserName());
	if(user.getUserId()==null){
		return isExistByName;
	}else{
		String userName2=(ud.getUser(user.getUserId().toString())).getUserName();
		if(user.getUserName().equals(userName2)){
			return 0;
		}else{
			return 1;
		}
			
	}
		
	
	}
	
	@Override
	public int isUserPasswordCorrect(User user){
		return ud.isUserPasswordCorrect(user);
		 
	 }

	@Override
	public int addUser(User user) {
		return ud.addUser(user);
	}

	@Override
	public int updateUser(User user) {
		return ud.updateUser(user);
	}

	@Override
	public int updateUserPassword(User user) {
		return ud.updateUserPassword(user);
	}

	@Override
	public int deleteUser(String id) {
		return ud.deleteUser(id);
	}


}
