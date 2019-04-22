package com.cloud.dream.version.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.cloud.dream.version.UserService;
import com.cloud.dream.version.entity.User;
import com.cloud.dream.version.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

/**
 * @ClassName : UserServiceImpl
 * @Author : zhangquansong
 * @Date : 2019/3/19 0019 下午 4:20
 * @Description :用户基本CURD操作实现类
 **/
@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements UserService {


    @Autowired
    private UserMapper userMapper;


    /**
     * @param
     * @return java.util.List<com.cloud.dream.serveruser.dao.entity.User>
     * @Author zhangquansong
     * @Date 2019/3/19 0019 下午 4:21
     * @Description :查询所有用户列表
     **/
    @Override
    public List<User> listAll() {
        return this.selectList(null);
    }

    @Transactional(rollbackFor = RuntimeException.class)
    @Override
    public void saveUser() {
        User user = new User();
        user.setUserLoginName("11");
        user.setUserName("22version" + new Date());
        this.insert(user);
        throw new RuntimeException("我就是故意出错");
    }
}