package com.sdxb.blog.controller;

import com.sdxb.blog.entity.User;
import com.sdxb.blog.mapper.UserMapper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.UUID;

//注册
@Controller
public class registerController {
    @Resource
    private UserMapper userMapper;

    @GetMapping("/register")
    public String register() {
        return "register";
    }

    @PostMapping("/registercheck")
    public String registercheck(HttpServletRequest request, HttpServletResponse response) {
        String email = request.getParameter("email");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String nickname = request.getParameter("nickname");
        String group_name = request.getParameter("group_name");
        String per_code = request.getParameter("per_code");
        //随机生成一个token用来当cookies的value
        String token = UUID.randomUUID().toString();
        User user = new User();
        user.setEmail(email);
        user.setName(username);
        user.setPassword(password);
        user.setNickname(nickname);
        user.setGroup_name(group_name);
        user.setPer_code(per_code);

        user.setToken(token);
        userMapper.insert(user);
        //如果用户注册成功，则把用户信息写进session，直接跳转到主页
        if (userMapper.select(user) != null) {
            response.addCookie(new Cookie("token", token));
            return "redirect:/index";
        } else {
            //注册失败，处理方法先省略
            return "register";
        }
    }
}
