package com.sdxb.blog.controller;

import com.sdxb.blog.dto.NotificationDto;
import com.sdxb.blog.dto.PageDto;
import com.sdxb.blog.entity.Question;
import com.sdxb.blog.entity.User;
import com.sdxb.blog.mapper.QuestionMapper;
import com.sdxb.blog.mapper.UserMapper;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import com.sdxb.blog.service.QuestionService;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

@Controller
public class SereachController {
@Resource
    private UserMapper userMapper;
@Resource
    private QuestionMapper questionMapper;
@Resource
private QuestionService questionService;
    @GetMapping("/sereach/{choice}")
    public String personal(@PathVariable(name = "choice")String choice,
                           Model model,
                           HttpServletRequest request,
                           @RequestParam(name = "page",defaultValue = "1")int page,
                           @RequestParam(name = "size",defaultValue = "10")int size){
        Cookie[] cookies = request.getCookies();
      //游客也可以查询


        if (choice.equals("questions")){
            model.addAttribute("section","questions");
            model.addAttribute("sectionname","我的问答");
            PageDto<Question> pagination=questionService.list(user.getId(),page,size);
            model.addAttribute("pagination", pagination);
        }else if (choice.equals("information")){
            model.addAttribute("section","information");
            model.addAttribute("sectionname","我的消息");
            PageDto<NotificationDto> notifications= notificationService.list(user.getId(),page,size);
            model.addAttribute("notifications",notifications);
        }


        return "personal";
    }

}
