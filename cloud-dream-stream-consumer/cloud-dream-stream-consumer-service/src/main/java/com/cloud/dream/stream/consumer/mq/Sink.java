package com.cloud.dream.stream.consumer.mq;

import org.springframework.cloud.stream.annotation.Input;
import org.springframework.messaging.SubscribableChannel;

/**
 * @author zhangquansong
 * @title: Sink
 * @projectName cloud-dream
 * @description: TODO
 * @date 2019/7/1318:54
 */
public interface Sink {

    String INPUT = "input";

    @Input(Sink.INPUT)
    SubscribableChannel input();

}