package com.cloud.dream.gateway.resolve;

import org.springframework.cloud.gateway.filter.ratelimit.KeyResolver;
import org.springframework.web.server.ServerWebExchange;
import reactor.core.publisher.Mono;

/**
 * @ClassName : HostAddrKeyResolver
 * @Author : zhangquansong
 * @Date : 2019/3/28 0028下午 2:17
 * @Description :
 **/
public class HostAddrKeyResolver implements KeyResolver {

    /**
     * @param exchange
     * @Author zhangquansong
     * @Date 2019/3/28 0028 下午 2:18
     * @Description : KeyResolver需要实现resolve方法，比如根据Hostname进行限流，则需要用hostAddress去判断。
     * 实现完KeyResolver之后，需要将这个类的Bean注册到Ioc容器中。
     **/
    @Override
    public Mono<String> resolve(ServerWebExchange exchange) {
        return Mono.just(exchange.getRequest().getRemoteAddress().getAddress().getHostAddress());
    }

}