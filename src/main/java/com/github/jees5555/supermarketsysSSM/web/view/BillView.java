package com.github.jees5555.supermarketsysSSM.web.view;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.github.jees5555.supermarketsysSSM.entity.Bill;
import com.github.jees5555.supermarketsysSSM.entity.Provider;
import com.github.jees5555.supermarketsysSSM.service.ProviderService;

@Controller
public class BillView {
	@Resource
	private ProviderService providerService;
	
	@RequestMapping("toBillAdd")
	public String toBillAdd (Model model){
		model.addAttribute("bill", new Bill());
		List<Provider> providerList =providerService.getProviderList(new Provider());
		model.addAttribute("providerList", providerList);
		return "bill/billAddOrUpdate";
	}
}
