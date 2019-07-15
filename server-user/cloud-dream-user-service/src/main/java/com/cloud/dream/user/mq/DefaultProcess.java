package com.cloud.dream.user.mq;

import org.springframework.cloud.stream.annotation.Input;
import org.springframework.cloud.stream.annotation.Output;
import org.springframework.messaging.MessageChannel;
import org.springframework.messaging.SubscribableChannel;

/**
 * @author zhangquansong
 * @title: DefaultProcess
 * @projectName cloud-dream
 * @description: TODO
 * @date 2019/7/1511:51
 */
public interface DefaultProcess {
    String OUTPUT = "study_output"; // 输出通道名称
    String INPUT = "study_input"; // 输入通道名称

    @Input(DefaultProcess.INPUT)
    SubscribableChannel input();

    @Output(DefaultProcess.OUTPUT)
    MessageChannel output();
}
