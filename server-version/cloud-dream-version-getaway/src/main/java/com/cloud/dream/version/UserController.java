package com.cloud.dream.version;

import com.cloud.dream.commons.utils.R;
import com.cloud.dream.version.entity.User;
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
    private RestTemplate restTemplate;

    /**
     * @param
     * @return java.util.List<com.cloud.dream.serveruser.dao.entity.User>
     * @Author zhangquansong
     * @Date 2019/3/19 0019 下午 4:20
     * @Description :查询所有用户列表
     **/
    @GetMapping("/listAll")
    @ResponseBody
    public List<User> listAll() {
        log.info("cloudDream:{}", cloudDream);
        return userService.listAll();
    }

    @GetMapping("/getCloudDream")
    public R getCloudDream(@RequestParam String version) {
        log.info("cloudDream:{},version:{}", cloudDream, version);
        List<User> users = userService.listAll();
//        R<User> userR = restTemplate.getForObject("http://cloud-dream-server-user/user/getCloudDream?version=1", R.class);
        return R.successResponse(users);
    }

}