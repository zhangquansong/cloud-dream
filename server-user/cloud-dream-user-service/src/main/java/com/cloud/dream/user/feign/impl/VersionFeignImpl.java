package com.cloud.dream.user.feign.impl;

import com.cloud.dream.commons.exception.MyException;
import com.cloud.dream.commons.utils.R;
import com.cloud.dream.user.feign.VersionFeign;
import org.springframework.stereotype.Component;

/**
 * @ClassName : VersionFeignImpl
 * @Author : zhangquansong
 * @Date : 2019/3/20 0020 下午 3:18
 * @Description :
 **/
@Component
public class VersionFeignImpl implements VersionFeign {

    @Override
    public R getCloudDreamVersion(String version) {
//        throw new MyException("请求Version失败");
        return R.errorResponse();
    }
}
