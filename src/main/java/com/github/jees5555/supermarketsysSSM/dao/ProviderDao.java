package com.github.jees5555.supermarketsysSSM.dao;

import java.util.List;

import com.github.jees5555.supermarketsysSSM.entity.Provider;

public interface ProviderDao {
     public List<Provider> getProviderList(Provider provider);
	 
	 public Provider getProvider(String id);
	 
	 public int isProviderExistById(String id);
	 
	 public int addProvider(Provider provider);
	 
	 public int updateProvider(Provider provider);
	 
	 public int deleteProvider(String id);
}
