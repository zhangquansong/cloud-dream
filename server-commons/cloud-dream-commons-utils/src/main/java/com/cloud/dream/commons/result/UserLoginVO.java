package com.clt.api.result;

import com.clt.api.annotation.DecryptFiled;
import com.clt.api.annotation.SensitiveInfo;
import com.clt.api.security.DESEncryptType;
import com.clt.api.security.SensitiveType;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * @ClassName : UserLoginVO
 * @Author : zhangquansong
 * @Date : 2019/1/5 0005 下午 3:14
 * @Description :用户登录返回vo
 **/
@Data
@JsonIgnoreProperties(value = {"id", "expireTime"})
public class UserLoginVO implements Serializable {

    private static final long serialVersionUID = 1L;

    private Long id;
    private String userLoginName;
    @DecryptFiled(DESEncryptType.USER_NAME)
    @SensitiveInfo(SensitiveType.CHINESE_NAME)
    private String userName;
    private String userPhone;
    private Integer userSex;
    private String userIdCard;
    private String userFace;
    private String userCode;
    private Integer userType;
    private String userAddress;
    private String token;
    private Date expireTime;

}
