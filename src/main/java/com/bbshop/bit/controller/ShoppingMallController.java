package com.bbshop.bit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller

public class ShoppingMallController {

	@RequestMapping(value="shopping_main_temp.do" ,method=RequestMethod.GET)
	public String shopmain() {
		return "shoppingMall/main/shopping_main";
	}
}
