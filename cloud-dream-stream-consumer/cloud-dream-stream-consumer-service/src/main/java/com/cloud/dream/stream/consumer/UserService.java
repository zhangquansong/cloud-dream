package com.cloud.dream.stream.consumer;

import com.baomidou.mybatisplus.service.IService;
import com.cloud.dream.stream.consumer.entity.User;

import java.util.List;

/**
 * @ClassName : UserService
 * @Author : zhangquansong
 * @Date : 2019/3/19 0019 下午 4:21
 * @Description :用户基本操作CURD接口
 **/
public interface UserService extends IService<User> {

    /**
     * @param
     * @return java.util.List<com.cloud.dream.serveruser.dao.entity.User>
     * @Author zhangquansong
     * @Date 2019/3/19 0019 下午 4:21
     * @Description :查询所有用户列表
     **/
    List<User> listAll();

    void saveUser() throws Exception;

    /**
     * 根据登录名和密码查询可用用户信息
     *
     * @param loginName 登录名
     * @param password  密码
     * @return
     */
    User findUserByLoginNameAndPassword(String loginName, String password);

    /**
     * 根据用户id查询可用用户信息
     *
     * @param userId 用户id
     * @return
     */
    User findUserByUserId(Long userId);
}