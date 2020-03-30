package com.sdxb.blog.controller;

/**
 * Created by Kebote on 2020/3/3.
 */
import com.sdxb.blog.Cache.TagCache;
import com.sdxb.blog.dto.TagDto;
import com.sdxb.blog.entity.Question;
import com.sdxb.blog.entity.User;
import com.sdxb.blog.mapper.QuestionMapper;
import com.sdxb.blog.mapper.UserMapper;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import java.util.List;
@Controller

public class deleteController {

    @Resource
    private QuestionMapper questionMapper;
    @GetMapping("/delete/{id}")
    public ModelAndView deletequestion(@PathVariable("id") int id){
        questionMapper.deletequestion(id);
        return new ModelAndView("redirect:/index");

    }
}
