package com.github.jees5555.supermarketsysSSM.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.jees5555.supermarketsysSSM.dao.ProviderDao;
import com.github.jees5555.supermarketsysSSM.entity.Provider;
import com.github.jees5555.supermarketsysSSM.service.ProviderService;
import com.github.jees5555.supermarketsysSSM.util.Page;

@Service
public class ProviderServiceImpl implements ProviderService{
	@Autowired
	private ProviderDao pd;

	@Override
	public List<Provider> getProviderList(Provider provider,Page page) {
		if(page != null){
			page.setTotalPage(pd.getProviderTotalItems(provider));
		}
		return pd.getProviderList(provider,page);
	}

	@Override
	public Provider getProvider(String id) {
		return pd.getProvider(id);
	}

	@Override
	public int isProviderExistById(String id) {
		return pd.isProviderExistById(id);
	}

	@Override
	public int addProvider(Provider provider) {
		return pd.addProvider(provider);
	}

	@Override
	public int updateProvider(Provider provider) {
		return pd.updateProvider(provider);
	}

	@Override
	public int deleteProvider(String id) {
		return pd.deleteProvider(id);
	}
	
	

}
