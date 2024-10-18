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
    public boolean login(String username, String password) {
        User user = userMapper.findUserByUsername(username);
        return user != null && PasswordUtil.checkPassword(password, user.getPassword());
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

    @Override
    public User findUserByUsername(String username) {
        return userMapper.findUserByUsername(username);
    }

    @Override
    public User findUserById(Integer uId) {
        return userMapper.findUserById(uId);
    }
}
