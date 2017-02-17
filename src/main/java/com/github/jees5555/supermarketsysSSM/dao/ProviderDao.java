package com.github.jees5555.supermarketsysSSM.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.github.jees5555.supermarketsysSSM.entity.Provider;
import com.github.jees5555.supermarketsysSSM.util.Page;

public interface ProviderDao {
	 public int getProviderTotalItems(Provider provider);
	
     public List<Provider> getProviderList(@Param("provider") Provider provider,@Param("page") Page page);
	 
	 public Provider getProvider(String id);
	 
	 public int isProviderExistById(String id);
	 
	 public int addProvider(Provider provider);
	 
	 public int updateProvider(Provider provider);
	 
	 public int deleteProvider(String id);

}
