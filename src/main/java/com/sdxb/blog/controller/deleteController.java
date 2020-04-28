package com.sdxb.blog.controller;

/**
 * Created by Kebote on 2020/3/3.
 */
import com.sdxb.blog.mapper.CommentMapper;
import com.sdxb.blog.mapper.FileUploadMapper;
import com.sdxb.blog.mapper.NotificationMapper;
import com.sdxb.blog.mapper.QuestionMapper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;



import javax.annotation.Resource;

@Controller

public class deleteController {

    @Resource
    private QuestionMapper questionMapper;
    @GetMapping("/delete/{id}")
    public ModelAndView deletequestion(@PathVariable(name="id") int id){
        questionMapper.deletequestion(id);
        return new ModelAndView("redirect:/index");
    }
    @Resource
    private NotificationMapper notificationMapper;
    @GetMapping("/deletenoti/{id}")
    public ModelAndView deletenoti(@PathVariable(name="id") int id){
        notificationMapper.deletenoti(id);
        return new ModelAndView("redirect:/personal/information");
    }
    @Resource
    private FileUploadMapper fileUploadMapper;
    @GetMapping("/deletefile/{id}")
    public ModelAndView deletefile(@PathVariable(name="id") int id){
        fileUploadMapper.deletefile(id);
        return new ModelAndView("redirect:/FilePage");
    }
@Resource
    private CommentMapper commentMapper;
    @GetMapping("/deletecomment/{id}")
    public ModelAndView deletecomment(@PathVariable(name="id") int id){
        commentMapper.deletecomment(id);
        return  new ModelAndView("redirect:/question/"+id);
    }
}
