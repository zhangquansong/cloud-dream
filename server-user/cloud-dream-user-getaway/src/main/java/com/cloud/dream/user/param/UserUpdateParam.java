package com.cloud.dream.user.param;

import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.io.Serializable;

/**
 * @Author zhangquansong
 * @Description : 修改用户
 * @Date 17:23 2019/7/13
 * @return
 **/
@Data
public class UserUpdateParam implements Serializable {

    private static final long serialVersionUID = 1L;

    @NotNull(message = "id不能为空")
    private Long id;
    @NotBlank(message = "登录名称不能为空")
    private String userLoginName;
    @NotBlank(message = "用户名称不能为空")
    private String userName;
    @NotBlank(message = "密码不能为空")
    private String userPassword;

}
