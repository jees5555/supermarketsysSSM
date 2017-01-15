package com.github.jees5555.supermarketsysSSM.web.view;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProviderView {

	@RequestMapping("toProviderAdd")
	public String toProviderAdd (){
		return "provider/providerAddOrUpdate";
	}
}
