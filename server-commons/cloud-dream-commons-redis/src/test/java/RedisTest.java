import com.cloud.dream.commons.CommonsRedisApplication;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.junit.Test;

/**
 * @ClassName : Test
 * @Author : zhangquansong
 * @Date : 2019/3/29 0029上午 11:04
 * @Description :
 **/
@RunWith(SpringJUnit4ClassRunner.class)
@SpringBootTest(classes = {CommonsRedisApplication.class})// 指定启动类
public class Test {


    @Test
    public void testRedisAdd() {

    }
}
