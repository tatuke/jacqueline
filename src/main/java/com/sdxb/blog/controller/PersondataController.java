package com.sdxb.blog.controller;

import javax.servlet.http.Cookie;
import com.sdxb.blog.entity.User;

import com.sdxb.blog.mapper.UserMapper;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import com.sdxb.blog.Tools.FileUtil;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;


/**
 * Created by Kebote on 2020/3/8.
 */
@Controller

public class PersondataController {
    @Resource
    UserMapper userMapper;


    @PostMapping("/modifypic")
    public String uploadImg(
            @RequestParam("file") MultipartFile file,
            HttpServletRequest request,
            Model model) {
        //获取当前登陆用户的信息


        if ((file.getOriginalFilename().isEmpty())) {
            model.addAttribute("error", "error");
            return "redirect:/persondata";
        } else {


            String fileName = file.getOriginalFilename();
            String filePath = "D:\\copyproject\\MyBlog\\src\\main\\resources\\static\\images\\personalimage";
            String headpic = filePath + fileName;


            try {
                FileUtil.uploadFile(file.getBytes(), filePath, fileName);

                User user = null;
                Cookie[] cookies = request.getCookies();
                for (Cookie cookie : cookies) {
                    if (cookie.getName().equals("token")) {
                        String token = cookie.getValue();
                        user = userMapper.findBytoken(token);
                        user.setToken(token);
                        user.setHeadpic(headpic);
                        userMapper.updateheadID(user);
                    }
                }



            } catch (Exception e) {
            }
            return "sussess";
        }
    }
}



