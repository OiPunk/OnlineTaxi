package com.online.taxi.demo.websocket.controller;

import java.io.IOException;

import com.online.taxi.demo.websocket.server.WebSocketServer;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 * 
 * @author oi
 * @date 2019年1月27日 上午8:49:05
 */
@Controller
@RequestMapping("/message")
public class SocketMessageController {

	//页面请求
	@GetMapping("/socket/{cid}")
	public ModelAndView socket(@PathVariable String cid) {
		ModelAndView mav=new ModelAndView("/socket");
		mav.addObject("cid", cid);
		return mav;
	}
	//推送数据接口
	@ResponseBody
	@RequestMapping("/socket/push/{cid}")
	public String pushToWeb(@PathVariable String cid,@RequestBody String message) {  
		try {
			WebSocketServer.sendInfo(message,cid);
		} catch (IOException e) {
			e.printStackTrace();
			return "失败";
		}  
		return "成功";
	}
	//推送数据接口
	@ResponseBody
	@RequestMapping("/socket/pushAll")
	public String pushAll(String message) {  
		try {
			WebSocketServer.sendInfo(message,null);
		} catch (IOException e) {
			e.printStackTrace();
			return "失败";
		}  
		return "成功";
	}
} 
