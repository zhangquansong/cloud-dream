import com.cloud.dream.stream.consumer.StreamConsumerGetawayApplication;
import com.cloud.dream.stream.consumer.entity.User;
import com.cloud.dream.stream.consumer.mq.IMessageProvider;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.RandomStringUtils;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import javax.annotation.Resource;

@RunWith(SpringJUnit4ClassRunner.class)
@SpringBootTest(classes = StreamConsumerGetawayApplication.class)
@WebAppConfiguration
@Slf4j
public class TestMessageProvider {
    @Resource
    private IMessageProvider messageProvider;

    @Test
    public void testSend() {
        User user = new User();
        user.setUserName("张三" + RandomStringUtils.random(8, "ABCDEF1234567890"));
        this.messageProvider.send(user); // 消息发送
        log.info("发送成功");
    }
}