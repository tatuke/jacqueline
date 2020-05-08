package com.sdxb.blog.controller;

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


import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

//问题发布
@Controller
public class publishController {

    @Resource
    private UserMapper userMapper;
    @Resource
    private QuestionMapper questionMapper;

    @GetMapping("/publish")
    public String publish(Model model) {
        //标签组
        TagCache tagCache=new TagCache();
        List<TagDto> tags = tagCache.gettags();
        model.addAttribute("tags",tags);
        return "publish";
    }
@GetMapping("/publishnovel")
public String publishnovel(Model model){
    TagCache tagCache=new TagCache();
    List<TagDto> tags = tagCache.gettags();
    model.addAttribute("tags",tags);
    return "publishnovel";
}
    //发布问题
    @PostMapping("/publish")

    public String publishquestion(
            @RequestParam("title") String title,
            @RequestParam("description") String description,
            @RequestParam("tag") String tag,
            @RequestParam(value = "id",defaultValue = "-1")int id,
            HttpServletRequest request,
            Model model
    ) {
        model.addAttribute("title", title);
        model.addAttribute("description", description);
        model.addAttribute("tag", tag);
        //标签组
        TagCache tagCache=new TagCache();
        List<TagDto> tags = tagCache.gettags();
        model.addAttribute("tags",tags);
        //防止输入的问题为空
        if (title == null || title == "") {
            model.addAttribute("error", "标题不能为空");
            return "publish";
        }
        if (description == null || description == "") {
            model.addAttribute("error", "描述不能为空");
            return "publish";
        }
        if (tag == null || tag == "") {
            model.addAttribute("error", "标签不能为空");
            return "publish";
        }
        //获取当前登陆用户的信息
        User user = null;
        Cookie[] cookies = request.getCookies();
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("token")) {
                String token = cookie.getValue();
                user = userMapper.findBytoken(token);
            }
        }
        //将问题上传到数据库
        Question question = new Question();
        question.setTitle(title);
        question.setDescription(description);
        question.setTag(tag);
        question.setCreateid(user.getId());
        question.setId(id);
        question.setCreatetime(System.currentTimeMillis());
        if(id==-1){
            questionMapper.createquestion(question);
        }else {

            questionMapper.updatequestion(question);
        }
        return "redirect:/index";
    }
    @PostMapping("/publishnovel")
    public String publishnovel(
            @RequestParam("title") String title,
            @RequestParam("description") String description,
            @RequestParam("tag") String tag,
//            content_type发布时的默认类型为2，即为文章内容
            @RequestParam(value = "content_type",defaultValue = "2") int content_type,
            @RequestParam(value = "id",defaultValue = "-2")int id,
            HttpServletRequest request,
            Model model
    ) {
        model.addAttribute("title", title);
        model.addAttribute("description", description);
        model.addAttribute("tag", tag);
        model.addAttribute("content_type", content_type);
        //标签组
        TagCache tagCache=new TagCache();
        List<TagDto> tags = tagCache.gettags();
        model.addAttribute("tags",tags);
        //防止输入的问题为空
        if (title == null || title == "") {
            model.addAttribute("error", "标题不能为空");
            return "publishnovel";
        }
        if (description == null || description == "") {
            model.addAttribute("error", "描述不能为空");
            return "publishnovel";
        }
        if (tag == null || tag == "") {
            model.addAttribute("error", "标签不能为空");
            return "publishnovel";
        }
        //获取当前登陆用户的信息
        User user = null;
        Cookie[] cookies = request.getCookies();
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("token")) {
                String token = cookie.getValue();
                user = userMapper.findBytoken(token);
            }
        }
        //将问题上传到数据库
        Question question = new Question();
        question.setTitle(title);
        question.setDescription(description);
        question.setTag(tag);
        question.setCreateid(user.getId());
        question.setId(id);
        question.setCreatetime(System.currentTimeMillis());
        if(id==-2){
            questionMapper.createnovel(question);
        }else {

            questionMapper.updatequestion(question);
        }
        return "redirect:/index";
    }

    @GetMapping("/publish/{id}")
    public String edit(@PathVariable(name = "id")int id,
                       Model model){
        Question question=questionMapper.getbyId(id);
        model.addAttribute("title", question.getTitle());
        model.addAttribute("description", question.getDescription());
        model.addAttribute("tag", question.getTag());
        //用来标识问题是修改而不是重新创建
        model.addAttribute("id",question.getId());
        return "publish";
    }


}
