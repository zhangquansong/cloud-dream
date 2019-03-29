import com.cloud.dream.commons.CommonsRedisApplication;
import com.cloud.dream.commons.redis.RedisUtils;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * @ClassName : Test
 * @Author : zhangquansong
 * @Date : 2019/3/29 0029上午 11:04
 * @Description :
 **/
@RunWith(SpringJUnit4ClassRunner.class)
@SpringBootTest(classes = {CommonsRedisApplication.class})// 指定启动类
public class RedisTest {

    @Autowired
    private RedisUtils redisUtils;

    @Test
    public void testRedisAdd() {
//        RedisUtils redisUtils = new RedisUtils();
        redisUtils.set(String.valueOf(Math.random()), String.valueOf(Math.random()));
    }
}
