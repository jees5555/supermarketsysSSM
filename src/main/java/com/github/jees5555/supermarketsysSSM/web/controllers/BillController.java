package com.github.jees5555.supermarketsysSSM.web.controllers;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.jees5555.supermarketsysSSM.entity.Bill;
import com.github.jees5555.supermarketsysSSM.entity.Provider;
import com.github.jees5555.supermarketsysSSM.exception.MyException;
import com.github.jees5555.supermarketsysSSM.service.BillService;
import com.github.jees5555.supermarketsysSSM.service.ProviderService;
import com.github.jees5555.supermarketsysSSM.util.Page;

import static com.github.jees5555.supermarketsysSSM.constants.OperateContants.*;
@Controller
@RequestMapping("bill")
public class BillController {
	@Resource
    private BillService billService;
	@Resource
	private ProviderService providerService;
	
	@RequestMapping("billList")
	public ModelAndView userList(Bill bill,Page page){
		List<Bill> billList=billService.getBillList(bill,page);
		ModelAndView mav =new ModelAndView("bill/billList");
		mav.addObject("billList", billList);
		mav.addObject("productName", bill.getProductName());
		mav.addObject("payStatus", bill.getPayStatus());
		mav.addObject("page",page);
		return mav;
	}
	
	@RequestMapping("toBillAdd")
	public String toBillAdd (Model model){
		model.addAttribute("bill", new Bill());
		List<Provider> providerList =providerService.getProviderList(null,null);
		model.addAttribute("providerList", providerList);
		return "bill/billAddOrUpdate";
	}
	
	@RequestMapping("toBillUpdate")
	public String toBillUpdate (String billId,Model model){
		Bill bill=billService.getBill(billId);
		model.addAttribute("bill", bill);
		List<Provider> providerList =providerService.getProviderList(null,null);
		model.addAttribute("providerList", providerList);
		return "bill/billAddOrUpdate";
	}
	
	@RequestMapping("billAddOrUpdate")
	@ResponseBody
	public String billAddOrUpdate(@Validated Bill bill,BindingResult result){
		if(result.hasErrors()){
			throw new MyException("参数错误");
			}
		if(bill.getBillId()==null){
			billService.addBill(bill);
		}else{
			billService.updateBill(bill);
		}
		return SUCCESS.getName();
	}
	
	@RequestMapping("billDelete")
	@ResponseBody
	public String billDelete(String billId){
		billService.deleteBill(billId);
		return SUCCESS.getName();
	}
}
