package com.cloud.dream.stream.consumer.mq;

import org.springframework.cloud.stream.annotation.Output;
import org.springframework.messaging.MessageChannel;

/**
 * @author zhangquansong
 * @title: Source
 * @projectName cloud-dream
 * @description: TODO
 * @date 2019/7/1318:46
 */
public interface Source {

    String OUTPUT = "output"; // 之前所设置的消息发送的管道

    @Output(Source.OUTPUT)
    MessageChannel output();

}