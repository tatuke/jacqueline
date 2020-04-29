package com.sdxb.blog.controller;

import com.sdxb.blog.entity.User;
import com.sdxb.blog.mapper.UserMapper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class departmentController {
    //开始定义机构相关操作
    //用户点击加入机构，进入加入机构页面
    @Resource
    private UserMapper userMapper;
    @GetMapping("/groupcheck")
    public String ingroup(HttpServletRequest request,
                          HttpServletResponse response){
        Cookie[] cookies = request.getCookies();

        User user = null;


        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("token")) {
                String token = cookie.getValue();
                user = userMapper.findBytoken(token);
                if (user != null) {
                    request.getSession().setAttribute("user", user);
                    //获取未读的消息数量
//                    int unreadnum = notificationMapper.getunreadcount(user.getId());
//                    request.getSession().setAttribute("unreadnum", unreadnum);
                }
                break;
            }
        }
        String group_name = request.getParameter("group_name");
        String access_code = request.getParameter("access_code");

    }
}
