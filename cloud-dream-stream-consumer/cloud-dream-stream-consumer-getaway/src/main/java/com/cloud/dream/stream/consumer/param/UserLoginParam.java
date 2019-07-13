package com.cloud.dream.stream.consumer.param;

import lombok.Data;
import org.hibernate.validator.constraints.NotBlank;

import java.io.Serializable;

/**
 * @ClassName : UserLoginParam
 * @Author : zhangquansong
 * @Date : 2019/1/5 0005 下午 3:14
 * @Description :用户登录param
 **/
@Data
public class UserLoginParam implements Serializable {

    private static final long serialVersionUID = 1L;

    @NotBlank(message = "登录名称不能为空")
    private String userLoginName;
    private String userFace;
    @NotBlank(message = "密码不能为空")
    private String userPassword;

}
