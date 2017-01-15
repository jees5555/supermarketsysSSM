package com.github.jees5555.supermarketsysSSM.web.controllers;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.github.jees5555.supermarketsysSSM.entity.Provider;
import com.github.jees5555.supermarketsysSSM.exception.MyException;
import com.github.jees5555.supermarketsysSSM.service.ProviderService;

@Controller
public class ProviderController {
	
    @Resource
	private ProviderService providerService;
	
	@RequestMapping("providerList")
	public ModelAndView providerList(Provider provider){
		List<Provider> providerList=providerService.getProviderList(provider);
		ModelAndView mav =new ModelAndView("provider/providerList");
		mav.addObject("providerList", providerList);
		mav.addObject("providerName", provider.getProviderName());
		mav.addObject("providerInfo", provider.getProviderInfo());
		return mav;
   }
	
	@RequestMapping("toProviderUpdate")
	public String toProviderUpdate (String providerId,Model model){
		Provider provider =providerService.getProvider(providerId);
		model.addAttribute("provider", provider);
		return "provider/providerAddOrUpdate";
	}
	
	@RequestMapping("providerAddOrUpdate")
	public String providerAddOrUpdate(@Validated Provider provider,BindingResult result){
		if(result.hasErrors()){
			throw new MyException("参数错误");
			}
		if(provider.getProviderId()==null){
			providerService.addProvider(provider);
		}else{
			providerService.updateProvider(provider);
		}
		return "redirect:providerList";
	}
	
	@RequestMapping("providerDelete")
	public String providerDelete(String providerId){
		providerService.deleteProvider(providerId);
		return "redirect:providerList";
	}
}
