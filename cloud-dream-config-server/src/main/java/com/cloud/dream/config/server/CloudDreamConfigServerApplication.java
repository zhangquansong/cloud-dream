package com.cloud.dream.config.server;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.cloud.config.server.EnableConfigServer;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;

/**
 * @Author zhangquansong
 * @Date 23:05 2019/3/10
 * @Param  * @param null
 * @Description : 云梦配置中心
 * @return
 **/
@SpringBootApplication(exclude = {DataSourceAutoConfiguration.class})
@EnableConfigServer//开启配置服务器
//@EnableDiscoveryClient//通过注解@EnableDiscoveryClient 表明自己是一个eurekaclient
@EnableEurekaClient
public class CloudDreamConfigServerApplication {

    public static void main(String[] args) {
        SpringApplication.run(CloudDreamConfigServerApplication.class, args);
    }

}
