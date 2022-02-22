package com.hungpick.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	
	@Autowired
	MenuController menuCtrl;

	@RequestMapping("main")
	public void main(Model model) throws Exception{
		menuCtrl.menu(model);
	}
}
