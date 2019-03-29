package com.clt.api.utils;

import com.clt.api.mq.RewardMq;
import com.clt.api.result.UserLoginVO;
import com.clt.api.sender.RabbitAckSender;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * @ClassName : RedisExtendUtils
 * @Author : zhangquansong
 * @Date : 2019/1/5 0005 下午 3:18
 * @Description : redis业务工具类
 **/
@Component
public class RedisExtendUtils {

    /**
     * 默认24小时后过期
     */
    @Value("${token.expire: 18000}")
    private int expire;

    @Autowired
    RedisUtils redisUtils;
    @Autowired
    private RabbitAckSender rabbitAckSender;

    /**
     * 登录token操作
     *
     * @param user 用户信息
     */
    @Async
    public void setLoginToken(UserLoginVO user, String token) {
        Map<String, Object> getToken = redisUtils.hmgetToken(String.valueOf(user.getId()));
        if (null != getToken && StringUtils.isNotBlank((String) getToken.get(Constants.KEY_NAME_TOKEN))) { // 删除用户上次登录的token
            redisUtils.deleteToken((String) getToken.get(Constants.KEY_NAME_TOKEN));
            redisUtils.deleteToken(String.valueOf(user.getId()));
        }
        Map<String, Object> map = new HashMap<>(Constants.INTEGER_VALUE_1);
        map.put(Constants.KEY_NAME_TOKEN, token);
        redisUtils.hmsetToken(String.valueOf(user.getId()), map);
        user.setExpireTime(DateUtils.addDay(new Date(), Constants.INTEGER_VALUE_1));
        redisUtils.setToken(token, user);
        RewardMq rewardMq = new RewardMq(user.getId(), user.getUserPhone(), String.valueOf(user.getUserType()), "用户登录奖励");
        rabbitAckSender.sendReward(rewardMq);
    }

    /**
     * @param userId 用户id
     * @return void
     * @Author zhangquansong
     * @Date 2019/1/5 0005 下午 6:22
     * @Description :   删除用户token
     **/
    @Async
    public void loginOutToken(Long userId) {
        Map<String, Object> getToken = redisUtils.hmgetToken(String.valueOf(userId));
        if (null != getToken && StringUtils.isNotBlank((String) getToken.get(Constants.KEY_NAME_TOKEN))) { // 删除用户上次登录的token
            redisUtils.deleteToken((String) getToken.get(Constants.KEY_NAME_TOKEN));
            redisUtils.deleteToken(String.valueOf(userId));
        }
    }
}