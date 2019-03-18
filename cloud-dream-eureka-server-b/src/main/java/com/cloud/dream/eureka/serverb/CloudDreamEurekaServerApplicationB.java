package com.cloud.dream.eureka.serverb;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.server.EnableEurekaServer;

@SpringBootApplication
@EnableEurekaServer
public class CloudDreamEurekaServerApplicationB {

    public static void main(String[] args) {
        SpringApplication.run(CloudDreamEurekaServerApplicationB.class, args);
    }

}
