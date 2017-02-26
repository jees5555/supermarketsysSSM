package com.github.jees5555.supermarketsysSSM.util;

public class Page {
private Integer itemsPerPage =5;
private Integer currPage =1;
private Integer totalPage;
public Integer getItemsPerPage() {
	return this.itemsPerPage;
}
public void setItemsPerPage(Integer itemsPerPage) {
	this.itemsPerPage = itemsPerPage;
}
public Integer getCurrPage() {
	return this.currPage;
}
public void setCurrPage(Integer currPage) {
	this.currPage = currPage;
}
public Integer getTotalPage() {
	if (totalPage ==null){
		throw new NullPointerException("the totalPage is not setted");
	}
	return totalPage;
}
public void setTotalPage(Integer totalItems) {
	if(totalItems%this.itemsPerPage==0){
	    this.totalPage = totalItems/this.itemsPerPage;
	}else{
		this.totalPage = totalItems/this.itemsPerPage+1;
	}
	
}
//mysql分页使用
public Integer getMySQLLimitStart() {
	return itemsPerPage*(currPage-1);
}

}
