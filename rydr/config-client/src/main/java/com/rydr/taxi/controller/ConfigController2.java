package com.rydr.taxi.controller;

import com.rydr.taxi.service.ConfigService;
import com.rydr.taxi.component.GitConfig;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
/**Class for testing property retrieval
 * @author oi
 */
@RestController
@RequestMapping("/config2")
public class ConfigController2 {

	@Autowired
	private GitConfig gitConfig;

	@Autowired
	private ConfigService configService;

	@Value("${env1}")
	private String env;

	@GetMapping("/env01")
	public String env0() {
		return "Remote: "+env;
	}

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
