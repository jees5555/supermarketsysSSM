package com.github.jees5555.supermarketsysSSM.dao;

import java.util.List;

import com.github.jees5555.supermarketsysSSM.entity.Bill;

public interface BillDao {
	 public List<Bill> getBillList(Bill bill);
	 
	 public Bill getBill(String id);
	 
	 public int isBillExistById(String id);
	 
	 public int addBill(Bill bill);
	 
	 public int updateBill(Bill bill);
	 
	 public int deleteBill(String id);
}
