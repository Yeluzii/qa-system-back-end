package top.ychen.qasystem.controller;

import jakarta.annotation.Resource;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.web.bind.annotation.*;
import top.ychen.qasystem.common.ResponseResult;
import top.ychen.qasystem.entity.User;
import top.ychen.qasystem.service.UserService;

@RestController
@RequestMapping("/users")
public class UserController {

    @Resource
    private UserService userService;

    @GetMapping("/current")
    public ResponseResult<User> getCurrentUser(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            System.out.println("Session ID: " + session.getId());
            Object userAttr = session.getAttribute("user");
            System.out.println("User Attribute: " + userAttr);
            if (userAttr != null) {
                String username = (String) userAttr;
                User user = userService.findUserByUsername(username);
                user.setPassword(null);
                user.setEmail(null);
                return ResponseResult.<User>builder()
                        .code(200)
                        .msg("成功获取")
                        .data(user)
                        .build();
            }
        }
        return ResponseResult.<User>builder()
                .code(401)
                .msg("未登录")
                .build();
    }

    @GetMapping("/{uId}")
    public ResponseResult<User> getUserByUsername(@PathVariable Integer uId) {
        User user = userService.findUserById(uId);
        if (user != null) {
            return ResponseResult.<User>builder()
                    .code(200)
                    .msg("成功获取uId为：" + uId + "的用户信息！")
                    .data(user)
                    .build();
        } else {
            return ResponseResult.<User>builder()
                    .code(404)
                    .msg("未找到uId为：" + uId + "的用户信息！")
                    .build();
        }
    }

    @PostMapping("/login")
    public ResponseResult<Void> login(@RequestBody User user, HttpServletRequest request) {
        try {
//            User user = User.builder().username(username).password(password).build();
            if (userService.login(user.getUsername(), user.getPassword())) {
                HttpSession session = request.getSession(true);
                session.setAttribute("user", user.getUsername());
                System.out.println(session.getAttribute("user") + " 登录成功");
                return ResponseResult.<Void>builder()
                        .code(200)
                        .msg("登录成功")
                        .build();
            } else {
                System.out.println("用户名或密码错误");
                return ResponseResult.<Void>builder()
                        .code(401)
                        .msg("用户名或密码错误")
                        .build();
            }
        } catch (Exception e) {
            return ResponseResult.<Void>builder()
                    .code(401)
                    .msg(e.getMessage())
                    .build();
        }
    }

    @PostMapping("/register")
    public ResponseResult<Boolean> register(@RequestBody User user) {
        try {
            boolean flag = userService.register(user);
            if (!flag) {
                return ResponseResult.<Boolean>builder()
                        .code(409)
                        .msg("用户名已存在")
                        .build();
            } else {
                return ResponseResult.<Boolean>builder()
                        .code(201)
                        .msg("注册成功")
                        .build();
            }
        } catch (Exception e) {
            return ResponseResult.<Boolean>builder()
                    .code(400)
                    .msg(e.getMessage())
                    .build();
        }
    }

    @PostMapping("/logout")
    public ResponseResult<Void> logout(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
            return ResponseResult.<Void>builder()
                    .code(200)
                    .msg("注销成功")
                    .build();
        }
        return ResponseResult.<Void>builder()
                .code(401)
                .msg("未登录")
                .build();
    }
}