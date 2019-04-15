package com.cloud.dream.gateway;

import com.cloud.dream.gateway.filter.LimitFilter;
import com.cloud.dream.gateway.filter.RequestTimeGatewayFilterFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.client.loadbalancer.LoadBalanced;
import org.springframework.cloud.context.config.annotation.RefreshScope;
import org.springframework.cloud.gateway.route.RouteLocator;
import org.springframework.cloud.gateway.route.builder.RouteLocatorBuilder;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;
import org.springframework.cloud.netflix.hystrix.EnableHystrix;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.context.annotation.Bean;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import java.time.Duration;

@SpringBootApplication
@RestController
@EnableEurekaClient
@RefreshScope
@EnableDiscoveryClient
@EnableHystrix
@EnableFeignClients
//@EnableOAuth2Sso
//@EnableWebFluxSecurity
//@EnableHystrixDashboard
public class CloudDreamGatewayApplication {

    public static void main(String[] args) {
        SpringApplication.run(CloudDreamGatewayApplication.class, args);
    }

    @Value("${cloudDream}")
    String cloudDream;//springcloud-config-client从git中获取
    @Value("${capacity}")
    int capacity;
    @Value("${refillTokens}")
    int refillTokens;
    @Value("${refillDuration}")
    int refillDuration;

    @Bean
    @LoadBalanced
    RestTemplate restTemplate() {
        return new RestTemplate();
    }

    /*@Bean
    public TokenFilter tokenFilter() {
        return new TokenFilter();
    }*/

    /*@Bean
    public HostAddrKeyResolver hostAddrKeyResolver() {
        return new HostAddrKeyResolver();
    }*/

    @Bean
    public RequestTimeGatewayFilterFactory elapsedGatewayFilterFactory() {
        return new RequestTimeGatewayFilterFactory();
    }

    @Bean
    public RouteLocator customerRouteLocator(RouteLocatorBuilder builder) {
        return builder.routes()
                .route(r -> r.path("/CLOUD-DREAM-SERVER-USER/user/**")
                        .filters(f -> f.stripPrefix(1)
                                .filter(new LimitFilter(capacity, refillTokens, Duration.ofSeconds(refillDuration))))
                        .uri("lb://cloud-dream-server-user")
                        .order(0)
                        .id("server_user_path_route")
                ).build();
    }

   /* @Bean
    RedisUtils redisUtils() {
        return new RedisUtils();
    }*/

}
