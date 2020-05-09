package com.sdxb.blog.controller;

import com.sdxb.blog.dto.DepartmentDto;
import com.sdxb.blog.entity.Department;
import com.sdxb.blog.entity.User;
import com.sdxb.blog.mapper.DepartmentMapper;
import com.sdxb.blog.mapper.UserMapper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

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
    @Resource
    private DepartmentMapper departmentMapper;
    @GetMapping("/groupcheck")
    public String ingroup(HttpServletRequest request,
                          HttpServletResponse response,
                          Model model){

        User user = null;
        Cookie[] cookies = request.getCookies();
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("token")) {
                String token = cookie.getValue();
                user = userMapper.findBytoken(token);
                user.setToken(token);
                Department department = new Department();
                String group_name = request.getParameter("group_name");
                String access_code = request.getParameter("access_code");
                department.setGroup_name(group_name);
                department.setAccess_code(access_code);
               Department realdepart=departmentMapper.select(department);
               if(realdepart!= null){
                   user.setGroup_name(group_name);
                   userMapper.updategroup(user);
                   return "index";
               }else{
                   return "index";
               }


            }
        }
        return "index";
    }
    @GetMapping("/updatecode")
//    机构管理员更改机构注册码接口
    public String code(HttpServletRequest request,
                       HttpServletResponse response,
                       @RequestParam(name="access_code") String access_code,
                       @PathVariable(name="group_name") String group_name,
                       Model model){
        //还需要一条语句来从用户带出组织名称
             Department department= departmentMapper.findbyname(group_name);

//             到底是哪种比较靠谱呢？
//        Department department= new Department();
//        department.getGroup_name(group_name);
             departmentMapper.updatecode(department);
             department.setAccess_code(access_code);
return  "institution";
    }
}
