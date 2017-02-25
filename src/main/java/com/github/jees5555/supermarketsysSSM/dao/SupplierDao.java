package com.github.jees5555.supermarketsysSSM.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.github.jees5555.supermarketsysSSM.entity.Supplier;
import com.github.jees5555.supermarketsysSSM.util.Page;

public interface SupplierDao {
	 public int getSupplierTotalItems(Supplier supplier);
	
     public List<Supplier> getSupplierList(@Param("supplier") Supplier supplier,@Param("page") Page page);
	 
	 public Supplier getSupplier(String id);
	 
	 public int isSupplierExistById(String id);
	 
	 public int addSupplier(Supplier supplier);
	 
	 public int updateSupplier(Supplier supplier);
	 
	 public int deleteSupplier(String id);

}
