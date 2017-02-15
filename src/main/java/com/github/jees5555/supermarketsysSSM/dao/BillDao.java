package com.github.jees5555.supermarketsysSSM.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.github.jees5555.supermarketsysSSM.entity.Bill;
import com.github.jees5555.supermarketsysSSM.util.Page;

public interface BillDao {
	 public int getBillTotalItems(Bill bill);
	 
	 public List<Bill> getBillList(@Param("bill") Bill bill,@Param("page") Page page);
	 
	 public Bill getBill(String id);
	 
	 public int isBillExistById(String id);
	 
	 public int addBill(Bill bill);
	 
	 public int updateBill(Bill bill);
	 
	 public int deleteBill(String id);
}
