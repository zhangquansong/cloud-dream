package com.cloud.dream.version;

import com.baomidou.mybatisplus.service.IService;
import com.cloud.dream.version.entity.User;

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

}