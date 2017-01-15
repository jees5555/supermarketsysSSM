package com.github.jees5555.supermarketsysSSM.entity;

import javax.validation.constraints.DecimalMax;
import javax.validation.constraints.DecimalMin;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;

public class User {
private Integer userId;
@NotEmpty
private String userName;
private String userPassword;
@NotNull
private Integer userSex;
@NotNull
@DecimalMin("0")
@DecimalMax("150")
private Integer userAge;
@NotNull
@DecimalMin("0")
private Long userTel;
private String userAddress;
private Integer userRole;
public Integer getUserId() {
	return userId;
}
public void setUserId(Integer userId) {
	this.userId = userId;
}
public String getUserName() {
	return userName;
}
public void setUserName(String userName) {
	this.userName = userName;
}
public String getUserPassword() {
	return userPassword;
}
public void setUserPassword(String userPassword) {
	this.userPassword = userPassword;
}
public Integer getUserSex() {
	return userSex;
}
public void setUserSex(Integer userSex) {
	this.userSex = userSex;
}
public Integer getUserAge() {
	return userAge;
}
public void setUserAge(Integer userAge) {
	this.userAge = userAge;
}
public Long getUserTel() {
	return userTel;
}
public void setUserTel(Long userTel) {
	this.userTel = userTel;
}
public String getUserAddress() {
	return userAddress;
}
public void setUserAddress(String userAddress) {
	this.userAddress = userAddress;
}
public Integer getUserRole() {
	return userRole;
}
public void setUserRole(Integer userRole) {
	this.userRole = userRole;
}


}
