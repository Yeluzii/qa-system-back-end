package top.ychen.qasystem.controller;

import jakarta.annotation.Resource;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import top.ychen.qasystem.common.ResponseResult;
import top.ychen.qasystem.entity.User;
import top.ychen.qasystem.service.UserService;

@RestController
@RequestMapping("users")
public class UserController {
    @Resource
    private UserService userService;
    private HttpSession session;

    @PostMapping("/session")
    public ResponseResult getSession(HttpServletRequest request) {
        session = request.getSession();
        return ResponseResult.builder().data(session).build();
    }
    @PostMapping("/login")
    public void login(@RequestBody User user, HttpServletRequest request) {
        System.out.println("login");
        userService.login(user.getUsername(), user.getPassword());
        session = request.getSession();
        session.setAttribute("user", user.getUsername());
        System.out.println(session.getAttribute("user"));
    }

    @PostMapping("/register")
    public void register(@RequestBody User user) {
        userService.register(user);
    }

    @PostMapping("/logout")
    public void logout() {
        session.invalidate();
        System.out.println("logout");
    }
}
