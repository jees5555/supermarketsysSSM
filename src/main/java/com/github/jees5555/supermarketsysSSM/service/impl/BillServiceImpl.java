package com.github.jees5555.supermarketsysSSM.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.jees5555.supermarketsysSSM.dao.BillDao;
import com.github.jees5555.supermarketsysSSM.entity.Bill;
import com.github.jees5555.supermarketsysSSM.service.BillService;

@Service
public class BillServiceImpl implements BillService{
	@Autowired
    private BillDao bd;
	
	public void setBillDao(BillDao bd) {
	this.bd = bd;
}

	public List<Bill> getBillList(Bill bill) {
		return bd.getBillList(bill);
		
	}

	public Bill getBill(String billId) {
		return bd.getBill(billId);
	}

	public int isBillExistById(String billId) {
		return bd.isBillExistById(billId);
		
	}

	public int addBill(Bill bill) {
		return bd.addBill(bill);
		
	}

	public int updateBill(Bill bill) {
		return bd.updateBill(bill);
		
	}

	public int deleteBill(String billId) {
		return bd.deleteBill(billId);
		
	}

}
