package com.cloud.dream.stream.consumer.mq;

import org.springframework.cloud.stream.annotation.Input;
import org.springframework.cloud.stream.annotation.Output;
import org.springframework.messaging.MessageChannel;
import org.springframework.messaging.SubscribableChannel;

/**
 * @author zhangquansong
 * @title: MyProcessor
 * @projectName cloud-dream
 * @description: TODO
 * @date 2019/7/1514:15
 */
public interface MyProcessor {
    String OUTPUT = "study_output"; // 输出通道名称
    String INPUT = "study_input"; // 输入通道名称

    @Input(MyProcessor.INPUT)
    SubscribableChannel input();

    @Output(MyProcessor.OUTPUT)
    MessageChannel output();
}
