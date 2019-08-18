package com.github.jees5555.supermarketsysSSM.web.controllers;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.jees5555.supermarketsysSSM.entity.Supplier;
import com.github.jees5555.supermarketsysSSM.exception.MyException;
import com.github.jees5555.supermarketsysSSM.service.SupplierService;
import com.github.jees5555.supermarketsysSSM.util.ServletUtil;
import com.github.jees5555.supermarketsysSSM.util.LanguageUtil;
import com.github.jees5555.supermarketsysSSM.util.Page;

import static com.github.jees5555.supermarketsysSSM.constants.OperateContants.*;

@Controller
@RequestMapping("supplier")
public class SupplierController {
	
    @Resource
	private SupplierService ss;
	
	@RequestMapping("supplierList")
	public ModelAndView supplierList(Supplier supplier,Page page,HttpServletRequest request){
		Cookie supplierItemsPerPage=ServletUtil.getCookieByName(request, "supplierItemsPerPage");
		if(supplierItemsPerPage!=null&& !page.isItemsPerPageSetted()){
		     page.setItemsPerPage(Integer.parseInt(supplierItemsPerPage.getValue()));
		}
		List<Supplier> supplierList=ss.getSupplierList(supplier,page);
		ModelAndView mav =new ModelAndView("supplier/supplierList");
		mav.addObject("supplierList", supplierList);
		mav.addObject("supplierName", supplier.getSupplierName());
		mav.addObject("supplierInfo", supplier.getSupplierInfo());
		mav.addObject("page",page);
		mav.addObject("displaykey",LanguageUtil.getDisplayKey((String)request.getSession().getAttribute("language")));
		return mav;
   }
	@RequestMapping("toSupplierAdd")
	public String toSupplierAdd (Model model,HttpServletRequest request){
		Cookie supplierSkip=ServletUtil.getCookieByName(request, "supplierSkip");
		if(supplierSkip!=null){
			model.addAttribute("supplierSkip",supplierSkip.getValue());
		}else{
			model.addAttribute("supplierSkip","false");
		}
		model.addAttribute("displaykey",LanguageUtil.getDisplayKey((String)request.getSession().getAttribute("language")));
		return "supplier/supplierAddOrUpdate";
	}
	
	@RequestMapping("toSupplierUpdate")
	public String toSupplierUpdate (String supplierId,Model model,HttpServletRequest request){
		Supplier supplier =ss.getSupplier(supplierId);
		model.addAttribute("supplier", supplier);
		model.addAttribute("displaykey",LanguageUtil.getDisplayKey((String)request.getSession().getAttribute("language")));
		return "supplier/supplierAddOrUpdate";
	}
	
	@RequestMapping("supplierAddOrUpdate")
	@ResponseBody
	public String supplierAddOrUpdate(@Validated Supplier supplier,BindingResult result) throws UnsupportedEncodingException{
		if(result.hasErrors()){
			throw new MyException("参数错误");
			}
		if(supplier.getSupplierId()==null){
			ss.addSupplier(supplier);
		}else{
			System.out.println( new String(supplier.getSupplierInfo().getBytes("ISO-8859-1"), "UTF-8"));
			ss.updateSupplier(supplier);
		}
		return SUCCESS.getName();
	}
	
	@RequestMapping("supplierDelete")
	@ResponseBody
	public String supplierDelete(String supplierId){
		ss.deleteSupplier(supplierId);
		return SUCCESS.getName();
	}
}
