package com.github.jees5555.supermarketsysSSM.service;

import java.util.List;

import com.github.jees5555.supermarketsysSSM.entity.Provider;
import com.github.jees5555.supermarketsysSSM.util.Page;

public interface ProviderService {
	
 public List<Provider> getProviderList(Provider provider,Page page);
 
 public Provider getProvider(String id);
 
 public int isProviderExistById(String id);
 
 public int addProvider(Provider provider);
 
 public int updateProvider(Provider provider);
 
 public int deleteProvider(String id);
}
