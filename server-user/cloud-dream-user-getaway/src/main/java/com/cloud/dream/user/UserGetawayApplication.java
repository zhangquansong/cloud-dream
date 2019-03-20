package com.cloud.dream.user;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.context.config.annotation.RefreshScope;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@RestController
@MapperScan(basePackages = {"com.cloud.dream.user.mapper"})
@EnableEurekaClient
@RefreshScope
public class UserGetawayApplication {
    public static void main(String[] args) {
        SpringApplication.run(UserGetawayApplication.class, args);
    }
}
