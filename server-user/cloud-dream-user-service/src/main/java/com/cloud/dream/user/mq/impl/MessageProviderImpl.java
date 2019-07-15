package com.cloud.dream.user.mq.impl;

import com.cloud.dream.user.entity.User;
import com.cloud.dream.user.mq.DefaultProcess;
import com.cloud.dream.user.mq.IMessageProvider;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.cloud.stream.annotation.EnableBinding;
import org.springframework.integration.support.MessageBuilder;
import org.springframework.messaging.MessageChannel;
import org.springframework.stereotype.Component;

/**
 * @ClassName MessageProviderImpl
 * @Description TODO
 * @Auther zhangquansong
 * @Date 2019/7/13 18:45
 * @Version 1.0
 **/
@Component
@EnableBinding(DefaultProcess.class) // 可以理解为是一个消息的发送管道的定义
public class MessageProviderImpl implements IMessageProvider {
    @Autowired
    @Qualifier(DefaultProcess.OUTPUT)
    private MessageChannel output; // 消息的发送管道

    @Override
    public void send(User user) {
        this.output.send(MessageBuilder.withPayload(user).build()); // 创建并发送消息
    }
}