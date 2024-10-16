package top.ychen.qasystem.service;

import jakarta.annotation.Resource;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import top.ychen.qasystem.entity.User;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
@Slf4j
class UserServiceTest {
    @Resource
    private UserService userService;

    @Test
    void login() {
        userService.login("admin", "123456");
    }

    @Test
    void register() {
        User user = User.builder().username("admin").password("123456").email("admin@qq.com").build();
        userService.register(user);
    }

    @Test
    void findUserId() {
        log.info("id:{}", userService.findUserId("admin"));
    }

    @Test
    void findUserByUsername() {
        log.info("user:{}", userService.findUserByUsername("admin"));
    }
}