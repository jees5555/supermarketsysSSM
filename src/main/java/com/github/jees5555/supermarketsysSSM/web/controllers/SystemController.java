package com.github.jees5555.supermarketsysSSM.web.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.jees5555.supermarketsysSSM.entity.Setting;

import static com.github.jees5555.supermarketsysSSM.constants.OperateContants.*;

@Controller
@RequestMapping("system")
public class SystemController {
	@RequestMapping("toSystemSetting")
	public String userSetting(){
		return "system/systemSetting";
	}
	@RequestMapping("saveSetting")
	@ResponseBody
	public String saveSetting(Setting setting){
		return SUCCESS.getName();
	}
}
