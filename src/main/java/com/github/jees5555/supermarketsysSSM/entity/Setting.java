package com.github.jees5555.supermarketsysSSM.entity;

public class Setting {
private Boolean billSkip;
private Boolean supplierSkip;
private Boolean userSkip;
private Integer billItemsPerPage;
private Integer supplierItemsPerPage;
private Integer userItemsPerPage;
public Boolean getBillSkip() {
	return billSkip;
}
public void setBillSkip(Boolean billSkip) {
	this.billSkip = billSkip;
}
public Boolean getSupplierSkip() {
	return supplierSkip;
}
public void setSupplierSkip(Boolean supplierSkip) {
	this.supplierSkip = supplierSkip;
}
public Boolean getUserSkip() {
	return userSkip;
}
public void setUserSkip(Boolean userSkip) {
	this.userSkip = userSkip;
}
public Integer getBillItemsPerPage() {
	return billItemsPerPage;
}
public void setBillItemsPerPage(Integer billItemsPerPage) {
	this.billItemsPerPage = billItemsPerPage;
}
public Integer getSupplierItemsPerPage() {
	return supplierItemsPerPage;
}
public void setSupplierItemsPerPage(Integer supplierItemsPerPage) {
	this.supplierItemsPerPage = supplierItemsPerPage;
}
public Integer getUserItemsPerPage() {
	return userItemsPerPage;
}
public void setUserItemsPerPage(Integer userItemsPerPage) {
	this.userItemsPerPage = userItemsPerPage;
}


}
