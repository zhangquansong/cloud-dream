package com.cloud.dream.stream.consumer.mq.impl;

import com.cloud.dream.stream.consumer.entity.User;
import com.cloud.dream.stream.consumer.mq.IMessageProvider;
import com.cloud.dream.stream.consumer.mq.Source;
import org.springframework.cloud.stream.annotation.EnableBinding;
import org.springframework.integration.support.MessageBuilder;
import org.springframework.messaging.MessageChannel;

import javax.annotation.Resource;

/**
 * @ClassName MessageProviderImpl
 * @Description TODO
 * @Auther zhangquansong
 * @Date 2019/7/13 18:45
 * @Version 1.0
 **/
@EnableBinding(Source.class) // 可以理解为是一个消息的发送管道的定义
public class MessageProviderImpl implements IMessageProvider {
    @Resource
    private MessageChannel output; // 消息的发送管道

    @Override
    public void send(User user) {
        this.output.send(MessageBuilder.withPayload(user).build()); // 创建并发送消息
    }
}