package com.cloud.dream.gateway;

import com.cloud.dream.gateway.filter.RequestTimeGatewayFilterFactory;
import com.cloud.dream.gateway.resolve.HostAddrKeyResolver;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.client.loadbalancer.LoadBalanced;
import org.springframework.cloud.context.config.annotation.RefreshScope;
import org.springframework.cloud.gateway.route.RouteLocator;
import org.springframework.cloud.gateway.route.builder.RouteLocatorBuilder;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;
import org.springframework.cloud.netflix.hystrix.EnableHystrix;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.context.annotation.Bean;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

@SpringBootApplication
@RestController
@EnableEurekaClient
@RefreshScope
@EnableDiscoveryClient
@EnableHystrix
@EnableFeignClients
//@EnableHystrixDashboard
public class CloudDreamGatewayApplication {

    public static void main(String[] args) {
        SpringApplication.run(CloudDreamGatewayApplication.class, args);
    }

    @Value("${cloudDream}")
    String cloudDream;//springcloud-config-client从git中获取

    @Bean
    @LoadBalanced
    RestTemplate restTemplate() {
        return new RestTemplate();
    }

    /*@Bean
    public TokenFilter tokenFilter() {
        return new TokenFilter();
    }*/

    @Bean
    public HostAddrKeyResolver hostAddrKeyResolver() {
        return new HostAddrKeyResolver();
    }

    @Bean
    public RequestTimeGatewayFilterFactory elapsedGatewayFilterFactory() {
        return new RequestTimeGatewayFilterFactory();
    }

   /* @Bean
    RedisUtils redisUtils() {
        return new RedisUtils();
    }*/

}
