package com.github.jees5555.supermarketsysSSM.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.jees5555.supermarketsysSSM.dao.SupplierDao;
import com.github.jees5555.supermarketsysSSM.entity.Supplier;
import com.github.jees5555.supermarketsysSSM.service.SupplierService;
import com.github.jees5555.supermarketsysSSM.util.Page;

@Service
public class SupplierServiceImpl implements SupplierService{
	@Autowired
	private SupplierDao sd;

	@Override
	public List<Supplier> getSupplierList(Supplier supplier,Page page) {
		if(page != null){
			page.setTotalPage(sd.getSupplierTotalItems(supplier));
		}
		return sd.getSupplierList(supplier,page);
	}

	@Override
	public Supplier getSupplier(String id) {
		return sd.getSupplier(id);
	}

	@Override
	public int isSupplierExistById(String id) {
		return sd.isSupplierExistById(id);
	}

	@Override
	public int addSupplier(Supplier supplier) {
		return sd.addSupplier(supplier);
	}

	@Override
	public int updateSupplier(Supplier supplier) {
		return sd.updateSupplier(supplier);
	}

	@Override
	public int deleteSupplier(String id) {
		return sd.deleteSupplier(id);
	}
	
	

}
