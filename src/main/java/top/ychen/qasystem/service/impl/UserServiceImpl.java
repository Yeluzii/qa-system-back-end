package top.ychen.qasystem.service.impl;

import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;
import top.ychen.qasystem.entity.User;
import top.ychen.qasystem.mapper.UserMapper;
import top.ychen.qasystem.service.UserService;
import top.ychen.qasystem.util.PasswordUtil;

@Service
public class UserServiceImpl  implements UserService {
    @Resource
    private UserMapper userMapper;
    @Override
    public User login(String username, String password) {
        User user = userMapper.findUsername(username);
        if (user != null && PasswordUtil.checkPassword(password, user.getPassword())) {
            return user;
        }
        return null;
    }

    @Override
    public void register(User user) {
        user.setPassword(PasswordUtil.hashPassword(user.getPassword()));
        userMapper.insertUser(user);
    }

    @Override
    public int findUserId(String username) {
        return userMapper.findUserId(username);
    }
}
