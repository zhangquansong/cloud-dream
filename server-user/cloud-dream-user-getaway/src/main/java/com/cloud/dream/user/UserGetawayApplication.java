package com.cloud.dream.user;

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
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

@SpringBootApplication
@RestController
@MapperScan(basePackages = {"com.cloud.dream.user.mapper"})
@EnableEurekaClient
@RefreshScope
@EnableDiscoveryClient
@EnableHystrix
@EnableFeignClients
@EnableHystrixDashboard
public class UserGetawayApplication {
    public static void main(String[] args) {
        SpringApplication.run(UserGetawayApplication.class, args);
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
