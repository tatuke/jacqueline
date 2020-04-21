package com.sdxb.blog.controller;

import com.sdxb.blog.dto.NotificationDto;
import com.sdxb.blog.dto.PageDto;
import com.sdxb.blog.dto.UserDto;
import com.sdxb.blog.entity.Question;
import com.sdxb.blog.entity.User;
import com.sdxb.blog.mapper.QuestionMapper;
import com.sdxb.blog.mapper.UserMapper;
import com.sdxb.blog.service.UserService;
import org.apache.ibatis.annotations.Param;
import org.springframework.data.domain.Page;
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
public class SearchController {
@Resource
    private UserMapper userMapper;
@Resource
    private QuestionMapper questionMapper;
@Resource
private QuestionService questionService;
@Resource
private UserService userService;
    @GetMapping("/search/{choice}")
    public String personal(@RequestParam(name = "choice",defaultValue = "questions")String choice,
                           Model model,
                           HttpServletRequest request,
                           @RequestParam(name ="description") String description,
                           @RequestParam(name = "page",defaultValue = "1")int page,
                           @RequestParam(name = "size",defaultValue = "10")int size){
        Cookie[] cookies = request.getCookies();
      //游客也可以查询
//关键是这里取的值一定要一样才行，也就是只能从一个地方取

        if (choice.equals("questions")){
            model.addAttribute("section","questions");
            model.addAttribute("sectionname","问答");
//            这里取搜索框的值
            PageDto<Question> pagination=questionService.listinsh(description,page,size);
            model.addAttribute("pagination", pagination);
        }else if (choice.equals("users")){
            model.addAttribute("section","users");
            model.addAttribute("sectionname","用户");
//            PageDto<NotificationDto> notifications= notificationService.list(user.getId(),page,size);
            PageDto<UserDto> pagination= userService.listser(description,page,size);
          model.addAttribute("pagination", pagination);
        }else if (choice.equals("publications")){
            model.addAttribute("section","publications");
            model.addAttribute("sectionname","文章");
            PageDto<Question> pagination=questionService.listinnove(description,page,size);
            model.addAttribute("pagination",pagination);
        }


        return "search";
    }

}
