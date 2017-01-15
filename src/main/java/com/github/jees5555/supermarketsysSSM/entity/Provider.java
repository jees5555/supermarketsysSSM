package com.github.jees5555.supermarketsysSSM.entity;

import javax.validation.constraints.DecimalMin;

import org.hibernate.validator.constraints.NotEmpty;

public class Provider {
private Integer providerId;
@NotEmpty
private String providerName;
private String providerInfo;
private String providerAtten;
@DecimalMin("0")
private Long providerTel;
@DecimalMin("0")
private Long providerFax;
private String providerAddress;
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
public String getProviderInfo() {
	return providerInfo;
}
public void setProviderInfo(String providerInfo) {
	this.providerInfo = providerInfo;
}
public String getProviderAtten() {
	return providerAtten;
}
public void setProviderAtten(String providerAtten) {
	this.providerAtten = providerAtten;
}
public Long getProviderTel() {
	return providerTel;
}
public void setProviderTel(Long providerTel) {
	this.providerTel = providerTel;
}
public Long getProviderFax() {
	return providerFax;
}
public void setProviderFax(Long providerFax) {
	this.providerFax = providerFax;
}
public String getProviderAddress() {
	return providerAddress;
}
public void setProviderAddress(String providerAddress) {
	this.providerAddress = providerAddress;
}


}
