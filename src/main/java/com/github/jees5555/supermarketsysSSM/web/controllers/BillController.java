package com.github.jees5555.supermarketsysSSM.web.controllers;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.jees5555.supermarketsysSSM.entity.Bill;
import com.github.jees5555.supermarketsysSSM.entity.Supplier;
import com.github.jees5555.supermarketsysSSM.exception.MyException;
import com.github.jees5555.supermarketsysSSM.service.BillService;
import com.github.jees5555.supermarketsysSSM.service.SupplierService;
import com.github.jees5555.supermarketsysSSM.util.ServletUtil;
import com.github.jees5555.supermarketsysSSM.util.LanguageUtil;
import com.github.jees5555.supermarketsysSSM.util.Page;

import static com.github.jees5555.supermarketsysSSM.constants.OperateContants.*;
@Controller
@RequestMapping("bill")
public class BillController {
	@Resource
    private BillService bs;
	@Resource
	private SupplierService ss;
	
	@RequestMapping("billList")
	public ModelAndView billList(Bill bill,Page page,HttpServletRequest request){
		Cookie billItemsPerPage=ServletUtil.getCookieByName(request, "billItemsPerPage");
		if(billItemsPerPage!=null&& !page.isItemsPerPageSetted()){
		     page.setItemsPerPage(Integer.parseInt(billItemsPerPage.getValue()));
		}
		List<Bill> billList=bs.getBillList(bill,page);
		ModelAndView mav =new ModelAndView("bill/billList");
		mav.addObject("billList", billList);
		mav.addObject("productName", bill.getProductName());
		mav.addObject("payStatus", bill.getPayStatus());
		mav.addObject("page",page);
		mav.addObject("displaykey",LanguageUtil.getDisplayKey((String)request.getSession().getAttribute("language")));
		return mav;
	}
	
	@RequestMapping("toBillAdd")
	public String toBillAdd (Model model,HttpServletRequest request){
		model.addAttribute("bill", new Bill());
		List<Supplier> supplierList =ss.getSupplierList(null,null);
		model.addAttribute("supplierList", supplierList);
		Cookie billSkip=ServletUtil.getCookieByName(request, "billSkip");
		if(billSkip!=null){
			model.addAttribute("billSkip",billSkip.getValue());
		}else{
			model.addAttribute("billSkip","false");
		}
		return "bill/billAddOrUpdate";
	}
	
	@RequestMapping("toBillUpdate")
	public String toBillUpdate (String billId,Model model){
		Bill bill=bs.getBill(billId);
		model.addAttribute("bill", bill);
		List<Supplier> supplierList =ss.getSupplierList(null,null);
		model.addAttribute("supplierList", supplierList);
		return "bill/billAddOrUpdate";
	}
	
	@RequestMapping("billAddOrUpdate")
	@ResponseBody
	public String billAddOrUpdate(@Validated Bill bill,BindingResult result){
		if(result.hasErrors()){
			throw new MyException("参数错误");
			}
		if(bill.getBillId()==null){
			bs.addBill(bill);
		}else{
			bs.updateBill(bill);
		}
		return SUCCESS.getName();
	}
	
	@RequestMapping("billDelete")
	@ResponseBody
	public String billDelete(String billId){
		bs.deleteBill(billId);
		return SUCCESS.getName();
	}
}
