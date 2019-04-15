package com.cloud.dream.oauth;

import com.cloud.dream.commons.redis.RedisExtendUtils;
import com.cloud.dream.commons.redis.RedisUtils;
import com.cloud.dream.commons.redis.RedissLock;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.client.loadbalancer.LoadBalanced;
import org.springframework.cloud.context.config.annotation.RefreshScope;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;
import org.springframework.cloud.netflix.hystrix.EnableHystrix;
import org.springframework.cloud.netflix.hystrix.dashboard.EnableHystrixDashboard;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.context.annotation.Bean;
import org.springframework.security.oauth2.config.annotation.web.configuration.EnableAuthorizationServer;
import org.springframework.web.client.RestTemplate;

@SpringBootApplication
@EnableAuthorizationServer
@MapperScan(basePackages = {"com.cloud.dream.oauth.mapper"})
@EnableEurekaClient
@RefreshScope
@EnableDiscoveryClient
@EnableHystrix
@EnableFeignClients
@EnableHystrixDashboard
public class CloudDreamOauthApplication {

    public static void main(String[] args) {
        SpringApplication.run(CloudDreamOauthApplication.class, args);
    }

    @Bean
    @LoadBalanced
    RestTemplate restTemplate() {
        return new RestTemplate();
    }


    @Bean
    RedisUtils redisUtils() {
        return new RedisUtils();
    }

    @Bean
    RedisExtendUtils redisExtendUtils() {
        return new RedisExtendUtils();
    }

    @Bean
    RedissLock redissLock() {
        return new RedissLock();
    }

}
