package com.cloud.dream.eureka.servera;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.server.EnableEurekaServer;

@SpringBootApplication
@EnableEurekaServer
public class CloudDreamEurekaServerApplicationA {

    public static void main(String[] args) {
        SpringApplication.run(CloudDreamEurekaServerApplicationA.class, args);
    }

}
