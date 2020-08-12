package com.online.taxi.demo.taxi.common.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/router")
public class RouterController {
	
	
	@RequestMapping("/user")
	public ModelAndView user() {
		ModelAndView mav=new ModelAndView("/index");
		return mav;
	}
	
	@RequestMapping("/driver")
	public String driver() {
		System.out.println("driver");
		return "index";
	}
}
