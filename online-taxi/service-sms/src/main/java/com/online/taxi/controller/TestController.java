package com.online.taxi.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
/**
 * @author oi
 */
@RestController
@RequestMapping("/test")
public class TestController {
	
	@GetMapping("/api2")
	public String test() {
		return "service-sms started";
	}
}
