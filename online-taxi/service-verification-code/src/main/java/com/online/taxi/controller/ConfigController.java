package com.online.taxi.controller;

import com.online.taxi.component.GitConfig;
import com.online.taxi.service.ConfigService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cloud.context.config.annotation.RefreshScope;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
/**测试获取属性的类
 * @author oi
 */
@RefreshScope
@RestController
@RequestMapping("/config")
public class ConfigController {

	@Autowired
	private GitConfig gitConfig;

	@Autowired
	private ConfigService configService;

	@GetMapping("/env")
	public String env() {
		return gitConfig.getEnv();
	}
	
	@GetMapping("/env1")
	public String env1() {

		return configService.getEnv1();
	}

	@GetMapping("/env2")
	public String env2() {
		return configService.getEnv2();
	}
}
