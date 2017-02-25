package com.github.jees5555.supermarketsysSSM.service;

import java.util.List;

import com.github.jees5555.supermarketsysSSM.entity.Supplier;
import com.github.jees5555.supermarketsysSSM.util.Page;

public interface SupplierService {
	
 public List<Supplier> getSupplierList(Supplier supplier,Page page);
 
 public Supplier getSupplier(String id);
 
 public int isSupplierExistById(String id);
 
 public int addSupplier(Supplier supplier);
 
 public int updateSupplier(Supplier supplier);
 
 public int deleteSupplier(String id);
}
