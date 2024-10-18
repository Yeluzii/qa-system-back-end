package top.ychen.qasystem.service;

import top.ychen.qasystem.entity.User;

public interface UserService {
    boolean login(String username, String password);
    void register(User user);
    int findUserId(String username);

    User findUserByUsername(String username);
    User findUserById(Integer uId);
}
