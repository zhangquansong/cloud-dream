package com.cloud.dream.user.mq;

import com.cloud.dream.user.entity.User;

/**
 * @author zhangquansong
 * @title: IMessageProvider
 * @projectName cloud-dream
 * @description: TODO
 * @date 2019/7/1318:44
 */
public interface IMessageProvider {

    /**
     * @param user
     * @return void
     * @Author zhangquansong
     * @Description : 实现消息的发送，本次发送的消息是一个对象（自动变为json）
     * @Date 18:45 2019/7/13
     **/
    void send(User user);
}