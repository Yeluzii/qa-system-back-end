package top.ychen.qasystem.mapper;

import org.apache.ibatis.annotations.Mapper;
import top.ychen.qasystem.entity.User;

@Mapper
public interface UserMapper {
    int findUserId(String username);
    int insertUser(User user);
    User findUserByUsername(String username);
    User findUserById(Integer uId);
}
