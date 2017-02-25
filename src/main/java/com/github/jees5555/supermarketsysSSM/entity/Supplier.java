package com.github.jees5555.supermarketsysSSM.entity;

import javax.validation.constraints.DecimalMin;

import org.hibernate.validator.constraints.NotEmpty;

public class Supplier {
private Integer supplierId;
@NotEmpty
private String supplierName;
private String supplierInfo;
private String supplierAtten;
@DecimalMin("0")
private Long supplierTel;
@DecimalMin("0")
private Long supplierFax;
private String supplierAddress;
public Integer getSupplierId() {
	return supplierId;
}
public void setSupplierId(Integer supplierId) {
	this.supplierId = supplierId;
}
public String getSupplierName() {
	return supplierName;
}
public void setSupplierName(String supplierName) {
	this.supplierName = supplierName;
}
public String getSupplierInfo() {
	return supplierInfo;
}
public void setSupplierInfo(String supplierInfo) {
	this.supplierInfo = supplierInfo;
}
public String getSupplierAtten() {
	return supplierAtten;
}
public void setSupplierAtten(String supplierAtten) {
	this.supplierAtten = supplierAtten;
}
public Long getSupplierTel() {
	return supplierTel;
}
public void setSupplierTel(Long supplierTel) {
	this.supplierTel = supplierTel;
}
public Long getSupplierFax() {
	return supplierFax;
}
public void setSupplierFax(Long supplierFax) {
	this.supplierFax = supplierFax;
}
public String getSupplierAddress() {
	return supplierAddress;
}
public void setSupplierAddress(String supplierAddress) {
	this.supplierAddress = supplierAddress;
}


}
