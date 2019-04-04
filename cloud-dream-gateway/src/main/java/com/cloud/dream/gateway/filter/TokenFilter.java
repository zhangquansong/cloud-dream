package com.cloud.dream.gateway.filter;

import com.alibaba.fastjson.JSONObject;
import com.cloud.dream.commons.exception.MyException;
import com.cloud.dream.commons.result.UserLoginVO;
import com.cloud.dream.commons.utils.Constants;
import com.cloud.dream.commons.utils.R;
import com.cloud.dream.commons.utils.RestConstants;
import com.cloud.dream.gateway.uitls.RedisUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.cloud.gateway.filter.GatewayFilterChain;
import org.springframework.cloud.gateway.filter.GlobalFilter;
import org.springframework.core.Ordered;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.http.server.reactive.ServerHttpRequest;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.server.ServerWebExchange;
import reactor.core.publisher.Mono;

import java.util.Map;

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
    @Autowired
    private RedisUtils redisUtils;
    @Autowired
    private RedisTemplate redisTemplate;
    @Autowired
    private RestTemplate restTemplate;

    @Override
    public Mono<Void> filter(ServerWebExchange exchange, GatewayFilterChain chain) {
        String requestUrl = exchange.getRequest().getURI().getRawPath();
        if (oauthTokenUrl.contains(requestUrl)) {
            return chain.filter(exchange);
        }
        String token = exchange.getRequest().getHeaders().getFirst(accessToken);
        if (StringUtils.isBlank(token)) {
            //token为空
            throw new MyException(RestConstants.BIZ_TOKEN_NULL_10002.getCode(), RestConstants.BIZ_TOKEN_NULL_10002.getMessage());
        }
        UserLoginVO redisUser = redisUtils.getToken(token, UserLoginVO.class);//查询redis中token对应的用户信息
        if (null == redisUser
                || (null != redisUser && redisUser.getExpireTime().getTime() < System.currentTimeMillis())) {
            //token失效
            throw new MyException(RestConstants.BIZ_TOKEN_EFFECT_10003.getCode(), RestConstants.BIZ_TOKEN_EFFECT_10003.getMessage());
        }
        Map<String, Object> map = redisUtils.hmgetToken(String.valueOf(redisUser.getUserId()));//查询redis中token信息
        if (null == map
                || !StringUtils.equalsIgnoreCase((String) map.get(Constants.KEY_NAME_TOKEN), redisUser.getToken())) {
            //token异常
            throw new MyException(RestConstants.BIZ_TOKEN_EXCEPTION_10004.getCode(), RestConstants.BIZ_TOKEN_EXCEPTION_10004.getMessage());
        }
        R<UserLoginVO> user = restTemplate.getForObject("http://cloud-dream-server-user/user/findUserByUserId/" + redisUser.getUserId(), R.class);
        if (null == user.getData()) {
            //用户不存在
            throw new MyException(RestConstants.BIZ_USER_NULL_10005.getCode(), RestConstants.BIZ_USER_NULL_10005.getMessage());
        }
        //向headers中放文件，记得build
        ServerHttpRequest host = exchange.getRequest().mutate().header("user", JSONObject.toJSONString(user.getData())).build();
        //将现在的request 变成 change对象
        ServerWebExchange build = exchange.mutate().request(host).build();
        return chain.filter(build);
    }

    @Override
    public int getOrder() {
        return 0;
    }

}
