package com.github.jees5555.supermarketsysSSM.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.jees5555.supermarketsysSSM.dao.UserDao;
import com.github.jees5555.supermarketsysSSM.entity.User;
import com.github.jees5555.supermarketsysSSM.service.UserService;
import com.github.jees5555.supermarketsysSSM.util.Page;
@Service
public class UserServiceImpl implements UserService{
	@Autowired
	private UserDao ud;

	@Override
	public User login(User user) {
		return ud.login(user);
	}

	@Override
	public List<User> getUserList(User user,Page page) {
		if(page!=null){
			page.setTotalPage(ud.getUserTotalItems(user));
		}
		return ud.getUserList(user,page);
	}

	@Override
	public User getUser(String id) {
		return ud.getUser(id);
	}

	@Override
	public boolean isUserExist(User user) {
	int isExistByName= ud.isUserExistByName(user.getUserName());
	if(user.getUserId()==null){
		return isExistByName>=1;
	}else{
		String userName2=(ud.getUser(user.getUserId().toString())).getUserName();
		if(user.getUserName().equals(userName2)){
			return false;
		}else{
			return isExistByName>=1;
		}
			
	}
		
	
	}
	
	@Override
	public boolean isUserPasswordCorrect(User user){
		int userCount= ud.isUserPasswordCorrect(user);
		if(userCount==1){
		    return true;
		}else{
		    return false;
		}
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
