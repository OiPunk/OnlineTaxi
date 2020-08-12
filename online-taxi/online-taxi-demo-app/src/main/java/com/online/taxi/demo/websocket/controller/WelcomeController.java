package com.online.taxi.demo.websocket.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
/**
 * 
 * @author oi
 * @date 2019年1月27日 上午8:49:10
 */
@RestController
public class WelcomeController {
	/**
	 * 首页
	 * 
	 * @return 测试
	 */
	@RequestMapping(value = "/welcome")
	@ResponseBody
	public String welcome() {
		return "Hello World";
	}

	@RequestMapping(value = "/index")
	public ModelAndView index(ModelAndView view) {
		// 设置jsp名字
		view.setViewName("index");

		// 传递数据
		view.addObject("name", "张三");

		return view;
	}
}