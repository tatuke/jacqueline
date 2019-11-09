package com.sdxb.blog.controller;

import com.sdxb.blog.dto.Questiondto;
import com.sdxb.blog.entity.Question;
import com.sdxb.blog.entity.User;
import com.sdxb.blog.mapper.QuestionMapper;
import com.sdxb.blog.mapper.UserMapper;
import com.sdxb.blog.service.QuestionService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class indexController {

    @Resource
    private UserMapper userMapper;

    @Resource
    private QuestionService questionService;

    @GetMapping("/index")
    public String index(HttpServletRequest request,Model model){
        //查找cookies，观察是否有token存在
        Cookie[] cookies=request.getCookies();
        if(cookies==null){
            return "login";
        }
        User user=null;
        for (Cookie cookie:cookies){
            if(cookie.getName().equals("token")){
                String token=cookie.getValue();
                user=userMapper.findBytoken(token);
                if(user!=null){
                    request.getSession().setAttribute("user",user);
                }
                break;
            }
        }
        List<Questiondto> questiondtoLists=questionService.list();
        model.addAttribute("questions",questiondtoLists);

        return "index";
    }

}
