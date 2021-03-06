package com.cloud.dream.stream.consumer.controller;

import com.alibaba.fastjson.JSONObject;
import com.cloud.dream.commons.redis.RedisUtils;
import com.cloud.dream.commons.result.UserLoginVO;
import com.cloud.dream.commons.utils.R;
import com.cloud.dream.stream.consumer.UserService;
import com.cloud.dream.stream.consumer.entity.User;
import com.cloud.dream.stream.consumer.feign.VersionFeign;
import com.netflix.hystrix.contrib.javanica.annotation.HystrixCommand;
import com.netflix.hystrix.contrib.javanica.annotation.HystrixProperty;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;

import java.util.List;

/**
 * @ClassName : UserController
 * @Author : zhangquansong
 * @Date : 2019/3/19 0019 下午 4:20
 * @Description :用户控制层
 **/
@Slf4j
@RestController
@RequestMapping("/user")
public class UserController {

    @Value("${cloudDream}")
    String cloudDream;//springcloud-config-client从git中获取


    @Autowired
    private UserService userService;
    @Autowired
    private VersionFeign versionFeign;
    @Autowired
    private RestTemplate restTemplate;
    @Autowired
    private RedisUtils redisUtils;

    /**
     * @param
     * @return java.util.List<com.cloud.dream.serveruser.dao.entity.User>
     * @Author zhangquansong
     * @Date 2019/3/19 0019 下午 4:20
     * @Description :查询所有用户列表
     **/
    @GetMapping("/listAll")
    @ResponseBody
    public R<List<User>> listAll() {
        log.info("cloudDream:{}", cloudDream);
        return R.successResponse(userService.listAll());
    }

    @GetMapping("/findUserByUserId/{userId}")
    @ResponseBody
    public R<User> listAll(@PathVariable("userId") Long userId) {
        return R.successResponse(userService.findUserByUserId(userId));
    }

    @HystrixCommand(
//            fallbackMethod = "xx方法",
            threadPoolKey = "getCloudDreamVersionThreadPool",
            threadPoolProperties = {
                    @HystrixProperty(name = "coreSize", value = "30"),
                    @HystrixProperty(name = "maxQueueSize", value = "10")
            },
            commandProperties = {
                    @HystrixProperty(name = "circuitBreaker.requestVolumeThreshold", value = "10"),
                    @HystrixProperty(name = "circuitBreaker.errorThresholdPercentage", value = "75"),
                    @HystrixProperty(name = "circuitBreaker.sleepWindowInMilliseconds", value = "7000"),
                    @HystrixProperty(name = "metrics.rollingStats.timeInMilliseconds", value = "150000"),
                    @HystrixProperty(name = "metrics.rollingStats.numBuckets", value = "5"),
            }
    )
    @GetMapping("/getCloudDream")
    public R getCloudDream(@RequestParam String version, @RequestHeader String user) throws Exception {
        log.info("cloudDream:{},version:{}", cloudDream, version);
        UserLoginVO userLoginVO = JSONObject.parseObject(user, UserLoginVO.class);
        System.out.println(userLoginVO);
        userService.saveUser();
//        R cloudDreamVersion = versionFeign.getCloudDreamVersion(cloudDream);
//        log.info("cloudDreamVersion:{}", cloudDreamVersion);
//        R<User> userR = restTemplate.getForObject("http://127.0.0.1:8783/user/getCloudDream?version=1", R.class);
//        R<User> userR = restTemplate.getForObject("http://cloud-dream-server-version/user/getCloudDream?version=1", R.class);
        return R.successResponse();
    }

    @GetMapping("/saveUser")
    public R saveUser(@RequestParam String version) throws Exception {
        userService.saveUser();
        return R.successResponse();
    }


}