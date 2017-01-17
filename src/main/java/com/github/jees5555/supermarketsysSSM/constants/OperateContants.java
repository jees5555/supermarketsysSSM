package com.github.jees5555.supermarketsysSSM.constants;

public enum OperateContants {
SUCCESS("success"),FAILURE("failure");

private String name;
	
private OperateContants(String name){
	this.name= name;
}
public String getName(){
	return name;
}
}
