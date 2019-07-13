package com.cloud.dream.stream.consumer.feign;

import com.cloud.dream.commons.utils.R;
import com.cloud.dream.stream.consumer.feign.impl.VersionFeignImpl;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * @ClassName : VersionFeign
 * @Author : zhangquansong
 * @Date : 2019/3/20 0020 下午 2:00
 * @Description :
 **/
@FeignClient(value = "cloud-dream-server-version", fallback = VersionFeignImpl.class)
public interface VersionFeign {

    @RequestMapping(value = "/user/getCloudDream", method = RequestMethod.GET)
    R getCloudDreamVersion(@RequestParam(value = "version") String version);
}
