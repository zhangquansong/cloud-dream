package com.cloud.dream.eureka.serverc;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.server.EnableEurekaServer;

@SpringBootApplication
@EnableEurekaServer
public class CloudDreamEurekaServerApplicationC {

    public static void main(String[] args) {
        SpringApplication.run(CloudDreamEurekaServerApplicationC.class, args);
    }

}
