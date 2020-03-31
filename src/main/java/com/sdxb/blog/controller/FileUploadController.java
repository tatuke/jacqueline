package com.sdxb.blog.controller;


import com.sdxb.blog.Tools.FileUtil;
import com.sdxb.blog.dto.Filedto;
import com.sdxb.blog.entity.File;
import com.sdxb.blog.entity.User;
import com.sdxb.blog.mapper.UserMapper;
import com.sdxb.blog.service.FileService;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

/**
 * Created by Kebote on 2020/3/22.
 */
public class FileUploadController {
    @Resource
    private FileService fileService;
    @Resource
    private UserMapper userMapper;
    //查看文件详情的请求（后续会包含权限的控制）
    @GetMapping("/file/{id}")
    public String file(@PathVariable(name = "id") int id,
                       Model model,
                       HttpServletRequest request) {

        Cookie[] cookies = request.getCookies();
        if (cookies == null) {
            return "login";
        }
        User user = null;
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("token")) {
                String token = cookie.getValue();
                user = userMapper.findBytoken(token);
                if (user != null) {
                    request.getSession().setAttribute("user", user);
                    //看看这里用到 user能做什么,可能这里还会用到；两次mapper
                }
                break;
            }
        }
        Filedto filedto= fileService.getbyid(id);
//        增加下载的数，此功能不能放在这个请求中，应该放在下载动作的请求中
        fileService.increasedown(id);
        model.addAttribute("fileDto",filedto);
        //展示相关的资源
        return "FilePage";
    }
@GetMapping("/fileupload")
    public String fileupload(@RequestParam("file") MultipartFile file,
                             HttpServletRequest request,
                             Model model){
        if((file.getOriginalFilename().isEmpty())){
            model.addAttribute("error", "error");
            return "redirect:/FilePage";
        }else{
            String fileName=file.getOriginalFilename();
            String filepath="static/UploadFile";
            String Filesource= filepath+fileName;
            try {
                FileUtil.uploadFile(file.getBytes(),filepath,fileName);
                User user =null;
                Cookie[] cookies = request.getCookies();
                for (Cookie cookie : cookies) {
                    if (cookie.getName().equals("token")) {
                        String token = cookie.getValue();
                        user = userMapper.findBytoken(token);
                        user.setToken(token);

                    }
                }


            }catch (Exception e){
            }
               return  "sussess";
        }

}
}
