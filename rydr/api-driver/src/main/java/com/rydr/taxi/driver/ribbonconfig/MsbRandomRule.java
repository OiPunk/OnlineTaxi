package com.rydr.taxi.driver.ribbonconfig;

import java.util.List;

import com.netflix.client.config.IClientConfig;
import com.netflix.loadbalancer.AbstractLoadBalancerRule;
import com.netflix.loadbalancer.ILoadBalancer;
import com.netflix.loadbalancer.Server;

public class MsbRandomRule extends AbstractLoadBalancerRule{


	public Server choose(ILoadBalancer lb, Object key) {

		if (lb == null) {
			return null;
		}
		Server server = null;

		while (server == null) {
			if (Thread.interrupted()) {
				return null;
			}
			List<Server> upList = lb.getReachableServers();  // Active available servers
			List<Server> allList = lb.getAllServers();  // All servers

			int serverCount = allList.size();
			if (serverCount == 0) {
				return null;
			}
			// Select server with custom metadata, choose the service whose port ends with 2.
			for (int i = 0; i < upList.size(); i++) {
				server = upList.get(i);
				String port = server.getHostPort();
				if(port.endsWith("2")) {
					break;
				}

			}


			if (server == null) {
				Thread.yield();
				continue;
			}

			if (server.isAlive()) {
				return (server);
			}

			// Shouldn't actually happen.. but must be transient or a bug.
			server = null;
			Thread.yield();
		}
		return server;
	}
	@Override
	public Server choose(Object key){
		return choose(getLoadBalancer(), key);
	}

	@Override
	public void initWithNiwsConfig(IClientConfig clientConfig){
	}
}
