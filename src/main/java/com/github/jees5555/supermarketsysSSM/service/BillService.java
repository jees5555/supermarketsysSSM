package com.github.jees5555.supermarketsysSSM.service;

import java.util.List;

import com.github.jees5555.supermarketsysSSM.entity.Bill;
import com.github.jees5555.supermarketsysSSM.util.Page;

public interface BillService {
	
	
     public List<Bill> getBillList(Bill bill,Page page);
	 
	 public Bill getBill(String id);
	 
	 public int isBillExistById(String id);
	 
	 public int addBill(Bill bill);
	 
	 public int updateBill(Bill bill);
	 
	 public int deleteBill(String id);
}
