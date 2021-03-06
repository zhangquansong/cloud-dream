package com.cloud.dream.oauth.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.cloud.dream.commons.utils.Constants;
import com.cloud.dream.oauth.entity.User;
import com.cloud.dream.oauth.mapper.UserMapper;
import com.cloud.dream.oauth.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @ClassName : UserServiceImpl
 * @Author : zhangquansong
 * @Date : 2019/3/19 0019 下午 4:20
 * @Description :用户基本CURD操作实现类
 **/
@Service
@Transactional
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


    /**
     * 根据登录名和密码查询可用用户信息
     *
     * @param loginName 登录名
     * @param password  密码
     * @return
     */
    @Override
    public User findUserByLoginNameAndPassword(String loginName, String password) {
        EntityWrapper<User> userEntityWrapper = new EntityWrapper<>();
        userEntityWrapper.and("user_login_name={0}", loginName)
                .and("user_password={0}", password)
                .and("is_delete={0}", Constants.IS_DELETE_0)//未删除状态
                .and("user_status={0}", Constants.USER_STATUS_0);//启用状态
        List<User> userList = this.selectList(userEntityWrapper);
        if (null != userList && userList.size() > 0) {
            return userList.get(Constants.INTEGER_VALUE_0);
        } else {
            return null;
        }
    }

    /**
     * 根据用户id查询可用用户信息
     *
     * @param userId 用户id
     * @return
     */
    @Override
    public User findUserByUserId(Long userId) {
        EntityWrapper<User> userEntityWrapper = new EntityWrapper<>();
        userEntityWrapper.and("id={0}", userId)
                .and("is_delete={0}", Constants.IS_DELETE_0)//未删除状态
                .and("user_status={0}", Constants.USER_STATUS_0);//启用状态
        List<User> userList = this.selectList(userEntityWrapper);
        if (null != userList) {
            return userList.get(Constants.INTEGER_VALUE_0);
        } else {
            return null;
        }
    }

}