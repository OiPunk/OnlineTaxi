package com.online.taxi.demo.taxi.passenger;

import java.util.List;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.online.taxi.demo.taxi.entity.Order;

@RestController
@RequestMapping("/order")
public class OrderController {

	@RequestMapping("/list")
	public List<Order> list(){
		
		for(int i=0;i<3;i++) {
			
		}
		return null;
	}
}
