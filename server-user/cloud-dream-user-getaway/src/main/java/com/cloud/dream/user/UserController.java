package com.cloud.dream.user;

import com.cloud.dream.user.entity.User;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

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


}