package com.cloud.dream.stream.consumer;

import com.baomidou.mybatisplus.service.IService;
import com.cloud.dream.commons.result.UserLoginVO;
import com.cloud.dream.commons.utils.R;
import com.cloud.dream.stream.consumer.entity.User;

/**
 * @ClassName : UserExtendService
 * @Author : zhangquansong
 * @Date : 2019/1/5 0005 下午 3:25
 * @Description :用户复杂业务操作接口
 **/
public interface UserExtendService extends IService<User> {

    /**
     * 用户登录操作
     *
     * @param loginName 登录名
     * @param password  密码
     * @return
     */
    R<UserLoginVO> userLogin(String loginName, String password);

}