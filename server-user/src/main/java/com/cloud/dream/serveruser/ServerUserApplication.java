package com.cloud.dream.serveruser;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.context.config.annotation.RefreshScope;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@RestController
@MapperScan(basePackages = {"com.cloud.dream.serveruser.dao.mapper"})
@EnableEurekaClient
@RefreshScope
public class ServerUserApplication {
    public static void main(String[] args) {
        SpringApplication.run(ServerUserApplication.class, args);
    }
}
