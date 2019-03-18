package com.cloud.dream.config.client;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.context.config.annotation.RefreshScope;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @Author zhangquansong
 * @Date 23:02 2019/3/10
 * @Param  * @param null 
 * @Description :   云梦配置中心连接端
 * @return 
 **/
@SpringBootApplication
@EnableEurekaClient
@RestController
@RefreshScope
public class CloudDreamConfigClientApplication {

    public static void main(String[] args) {
        SpringApplication.run(CloudDreamConfigClientApplication.class, args);
    }

    @Value("${cloudDream}")
    String cloudDream;

    /**
     * @Author zhangquansong
     * @Date 23:03 2019/3/10
     * @Param  * @param  
     * @Description :     获取git配置中cloudDream值
     * @return java.lang.String
     **/
    @RequestMapping(value = "/getCloudDream")
    public String getCloudDream(){
        return cloudDream;
    }

}
