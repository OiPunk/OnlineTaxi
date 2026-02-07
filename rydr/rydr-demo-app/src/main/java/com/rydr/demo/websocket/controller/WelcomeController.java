package com.rydr.demo.websocket.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
/**
 *
 * @author oi
 * @date 2019-01-27 08:49:10
 */
@RestController
public class WelcomeController {
	/**
	 * Home page
	 *
	 * @return test
	 */
	@RequestMapping(value = "/welcome")
	@ResponseBody
	public String welcome() {
		return "Hello World";
	}

	@RequestMapping(value = "/index")
	public ModelAndView index(ModelAndView view) {
		// Set JSP name
		view.setViewName("index");

		// Pass data
		view.addObject("name", "Zhang San");

		return view;
	}
}
