package com.cloud.dream.user.controller;

import com.cloud.dream.commons.result.UserLoginVO;
import com.cloud.dream.commons.utils.R;
import com.cloud.dream.user.UserExtendService;
import com.cloud.dream.user.UserService;
import com.cloud.dream.user.param.UserLoginParam;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * @ClassName : LoginController
 * @Author : zhangquansong
 * @Date : 2019/1/5 0005 下午 3:27
 * @Description :登录控制层
 **/
@Slf4j
@RestController
@RequestMapping("/user")
public class LoginController {

    @Autowired
    private UserService userService;

    @Autowired
    private UserExtendService userExtendService;

    /**
     * @param userLoginParam
     * @return com.clt.api.utils.RestResult<com.clt.api.result.UserLoginVO>
     * @Author zhangquansong
     * @Date 2019/1/5 0005 下午 3:27
     * @Description : 用户登录
     **/
    @PostMapping("/login")
    @ResponseBody
    public R<UserLoginVO> login(@RequestBody UserLoginParam userLoginParam) {
        return userExtendService.userLogin(userLoginParam.getUserLoginName(), userLoginParam.getUserPassword());
    }
}