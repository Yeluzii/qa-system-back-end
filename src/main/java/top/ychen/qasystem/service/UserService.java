package top.ychen.qasystem.service;

import top.ychen.qasystem.entity.User;

public interface UserService {
    User login(String username, String password);
    void register(User user);
    int findUserId(String username);
}
