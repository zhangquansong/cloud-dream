package com.cloud.dream.user.controller;

import com.alibaba.fastjson.JSONObject;
import com.cloud.dream.commons.redis.RedisUtils;
import com.cloud.dream.commons.result.UserLoginVO;
import com.cloud.dream.commons.utils.R;
import com.cloud.dream.user.UserService;
import com.cloud.dream.user.entity.User;
import com.cloud.dream.user.feign.VersionFeign;
import com.cloud.dream.user.param.UserAddParam;
import com.cloud.dream.user.param.UserUpdateParam;
import com.netflix.hystrix.contrib.javanica.annotation.HystrixCommand;
import com.netflix.hystrix.contrib.javanica.annotation.HystrixProperty;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;

import java.math.BigDecimal;
import java.util.Date;
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
//        userService.saveUser();
        R cloudDreamVersion = versionFeign.getCloudDreamVersion(cloudDream);
        log.info("cloudDreamVersion:{}", cloudDreamVersion);
//        R<User> userR = restTemplate.getForObject("http://127.0.0.1:8783/user/getCloudDream?version=1", R.class);
//        R<User> userR = restTemplate.getForObject("http://cloud-dream-server-version/user/getCloudDream?version=1", R.class);
        return R.successResponse();
    }

    @GetMapping("/save")
    public R saveUser(@RequestParam String version) throws Exception {
        userService.saveUser();
        return R.successResponse();
    }

    @PostMapping("/saveUser")
    public R saveUser(@RequestBody UserAddParam param) throws Exception {
        User user = new User();
        user.setUserLoginName(param.getUserLoginName());
        user.setUserName(param.getUserName());
        user.setUserPhone("");
        user.setUserSex(0);
        user.setUserIdCard("");
        user.setUserFace("");
        user.setUserCode("");
        user.setUserType(0);
        user.setUserPassword(param.getUserPassword());
        user.setUserAsset(new BigDecimal("0"));
        user.setUserAddress("");
        user.setUserLonginLastTime(new Date());
        user.setUserStatus(0);
        user.setCreateTime(new Date());
        user.setUpdateTime(new Date());
        user.setUserVersion(0L);
        userService.saveUser(user);
        log.info("新增成功。userId:{}", user.getUserId());
        return R.successResponse();
    }

    @PostMapping("/updateUser")
    public R updateUsers(@RequestBody UserUpdateParam param) throws Exception {
        User user = new User();
        user.setUserId(param.getId());
        user.setUserLoginName(param.getUserLoginName());
        user.setUserName(param.getUserName());
        user.setUserPhone("11");
        user.setUserSex(0);
        user.setUserType(0);
        user.setUserPassword(param.getUserPassword());
        user.setUserStatus(0);
        user.setUserVersion(0L);
        userService.updateUser(user);
        log.info("修改成功。userId:{}", user.getUserId());
        return R.successResponse();
    }

    @PostMapping("/deleteUser")
    public R deleteUser(@RequestParam Long id) throws Exception {
        userService.deleteUser(id);
        log.info("删除成功。userId:{}", id);
        return R.successResponse();
    }

    @PostMapping("/findById")
    public R findById(@RequestParam Long id) throws Exception {
        log.info("查询详情成功。userId:{}", id);
        return R.successResponse(userService.findById(id));
    }
}