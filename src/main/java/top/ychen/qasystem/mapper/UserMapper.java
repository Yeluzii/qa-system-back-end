package top.ychen.qasystem.mapper;

import org.apache.ibatis.annotations.Mapper;
import top.ychen.qasystem.entity.User;

@Mapper
public interface UserMapper {
    User findUsername(String username);
    int findUserId(String username);
    int insertUser(User user);
}
