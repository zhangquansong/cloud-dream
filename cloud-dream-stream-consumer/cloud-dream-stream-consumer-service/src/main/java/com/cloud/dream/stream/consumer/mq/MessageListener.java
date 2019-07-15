package com.cloud.dream.stream.consumer.mq;

import com.cloud.dream.stream.consumer.entity.User;
import lombok.extern.slf4j.Slf4j;
import org.springframework.cloud.stream.annotation.EnableBinding;
import org.springframework.cloud.stream.annotation.StreamListener;
import org.springframework.messaging.Message;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Component;

/**
 * @ClassName MessageListener
 * @Description TODO
 * @Auther zhangquansong
 * @Date 2019/7/13 18:53
 * @Version 1.0
 **/
@Slf4j
@Component
@EnableBinding(MyProcessor.class)
public class MessageListener {
    @StreamListener(MyProcessor.INPUT)
//    @SendTo(MyProcessor.OUTPUT)
    public void input(Message<User> message) {
        log.info("【*** 消息接收 ***】:{}", message.getPayload());
    }
}