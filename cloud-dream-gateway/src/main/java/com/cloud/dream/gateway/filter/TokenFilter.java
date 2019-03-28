package com.cloud.dream.gateway.filter;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.cloud.gateway.filter.GatewayFilterChain;
import org.springframework.cloud.gateway.filter.GlobalFilter;
import org.springframework.core.Ordered;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.SetOperations;
import org.springframework.http.server.reactive.ServerHttpRequest;
import org.springframework.stereotype.Component;
import org.springframework.web.server.ServerWebExchange;
import reactor.core.publisher.Mono;

import java.util.Set;

/**
 * @ClassName : TokenFilter
 * @Author : zhangquansong
 * @Date : 2019/3/27 0027下午 5:04
 * @Description :
 **/
@Component
public class TokenFilter implements GlobalFilter, Ordered {

    @Value("${oauth_token_url}")
    String oauthTokenUrl;
    @Value("${access_token_name}")
    String accessToken;

    @Override
    public Mono<Void> filter(ServerWebExchange exchange, GatewayFilterChain chain) {

        String requestUrl = exchange.getRequest().getURI().toString();
        if (requestUrl.contains(oauthTokenUrl)) {
            return chain.filter(exchange);
        }
        String token = exchange.getRequest().getHeaders().getFirst(accessToken);
        if (StringUtils.isBlank(token)) {
            //token为空
//            throw new MyException(RestConstants.BIZ_TOKEN_NULL_10002.getCode(), RestConstants.BIZ_TOKEN_NULL_10002.getMessage());
        }
        //向headers中放文件，记得build
        ServerHttpRequest host = exchange.getRequest().mutate().header("user", "888").build();
        //将现在的request 变成 change对象
        ServerWebExchange build = exchange.mutate().request(host).build();
        return chain.filter(build);
    }

    @Override
    public int getOrder() {
        return 0;
    }
}
