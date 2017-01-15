package com.github.jees5555.supermarketsysSSM.entity;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.validation.constraints.DecimalMin;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;

public class Bill {
private Integer billId;
@NotEmpty
private String productName;
@NotNull
@DecimalMin("0")
private Integer productNum;
@NotNull
@DecimalMin("0")
private Integer billMoney;
private Integer payStatus;
private Integer providerId;
private String providerName;
private String productInfo;
private Date billTime;
public Integer getBillId() {
	return billId;
}
public void setBillId(Integer billId) {
	this.billId = billId;
}
public String getProductName() {
	return productName;
}
public void setProductName(String productName) {
	this.productName = productName;
}
public Integer getProductNum() {
	return productNum;
}
public void setProductNum(Integer productNum) {
	this.productNum = productNum;
}
public Integer getBillMoney() {
	return billMoney;
}
public void setBillMoney(Integer billMoney) {
	this.billMoney = billMoney;
}
public Integer getPayStatus() {
	return payStatus;
}
public void setPayStatus(Integer payStatus) {
	this.payStatus = payStatus;
}
public Integer getProviderId() {
	return providerId;
}
public void setProviderId(Integer providerId) {
	this.providerId = providerId;
}
public String getProviderName() {
	return providerName;
}
public void setProviderName(String providerName) {
	this.providerName = providerName;
}
public String getProductInfo() {
	return productInfo;
}
public void setProductInfo(String productInfo) {
	this.productInfo = productInfo;
}
public Date getBillTime() {
	return billTime;
}
public void setBillTime(Date billTime) {
	this.billTime = billTime;
}
public String getFormatBillTime(){
	SimpleDateFormat sdf =new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	String formatBillTime=sdf.format(this.billTime);
	return formatBillTime;
}

}
