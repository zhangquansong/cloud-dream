package com.cloud.dream.clouddreamzipkinserver;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;
import zipkin2.server.internal.EnableZipkinServer;

@SpringBootApplication
@EnableEurekaClient
@EnableZipkinServer //启用zipkin服务
public class CloudDreamZipkinServerApplication {

    public static void main(String[] args) {
        SpringApplication.run(CloudDreamZipkinServerApplication.class, args);
    }

}
