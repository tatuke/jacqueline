package com.sdxb.blog.controller;


import com.sdxb.blog.Cache.PermitCache;
import com.sdxb.blog.Cache.TagCache;
import com.sdxb.blog.Tools.FileUtil;
import com.sdxb.blog.dto.Filedto;
import com.sdxb.blog.dto.PageDto;
import com.sdxb.blog.dto.TagDto;
import com.sdxb.blog.dto.permitDto;
import com.sdxb.blog.entity.File;
import com.sdxb.blog.entity.User;
import com.sdxb.blog.mapper.FileUploadMapper;
import com.sdxb.blog.mapper.UserMapper;
import com.sdxb.blog.service.FileService;

import com.sun.javaws.exceptions.ErrorCodeResponseException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.List;
import java.util.Map;

/**
 * Created by Kebote on 2020/3/22.
 */
@Controller
public class FileUploadController {
    @Resource
    private FileService fileService;
    @Resource
    private UserMapper userMapper;
    @Resource
    private FileUploadMapper fileUploadMapper;
    //查看文件详情的请求（后续会包含权限的控制）
    //否定，这里可以作为文件页的请求处理
    @GetMapping("/FilePage")
    public String index(HttpServletRequest request, Model model,
                        @RequestParam(name = "page", defaultValue = "1") int page,
                        @RequestParam(name = "size", defaultValue = "5") int size) {
        //查找cookies，观察是否有token存在
        Cookie[] cookies = request.getCookies();
//        if (cookies == null) {
//            return "login";
//        }
        User user = null;
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("token")) {
                String token = cookie.getValue();
                user = userMapper.findBytoken(token);
                if (user != null) {
                    request.getSession().setAttribute("user", user);
                    //获取未读的消息数量,无文件下载请求通知功能

                }
                break;
            }
        }


        PageDto pagination = fileService.list(page, size);
        model.addAttribute("pagination", pagination);
        return "FilePage";
    }
    @GetMapping("/FilePage/{token}")
    public String file(@PathVariable(name= "token") String token,
                       @RequestParam(name="page",defaultValue = "1") int page,
                       @RequestParam(name= "size",defaultValue = "8") int size,
                       Model model,
                       HttpServletRequest request) {

        Cookie[] cookies = request.getCookies();
        if (cookies == null) {
            return "login";
        }
//        获取携带的用户信息，以便做其他处理
        User user = userMapper.findBytoken(token);
        model.addAttribute("user",user);
        PageDto pagination = fileService.list(page, size);
        model.addAttribute("pagination", pagination);

        return "FilePage";
    }
@PostMapping("/fileupload")
    public String fileupload(@RequestParam("sourcefile") MultipartFile sourcefile,
                             @RequestParam("description") String description,
                             @RequestParam("file_permit") int file_permit,
                             @RequestParam("tag") String tag,
                             @RequestParam(value = "id",defaultValue = "-1") int id,
                             HttpServletRequest request,
                             Model model){
        model.addAttribute("description",description);
        model.addAttribute("file_permit",file_permit);
        model.addAttribute("tag",tag);
        //标签组
    TagCache tagCache=new TagCache();
    List<TagDto> tags = tagCache.gettags();
    model.addAttribute("tags",tags);
       //权限组
    PermitCache permitCache=new PermitCache();
    List<permitDto> permits=permitCache.getpermits();
    model.addAttribute("permits",permits);

        if((sourcefile.getOriginalFilename().isEmpty())){
            model.addAttribute("error", "error");
            return "redirect:FilePage";
        }else{
            String fileName=sourcefile.getOriginalFilename();
            String filepath="D:\\maixy commpont\\jacqueline\\src\\main\\resources\\static\\UploadFile\\";
            String Filesource= filepath+fileName;


            try {
                FileUtil.uploadFile(sourcefile.getBytes(),filepath,fileName);
                User user =null;
                File sourefile= new File();
                Cookie[] cookies = request.getCookies();
                for (Cookie cookie : cookies) {
                    if (cookie.getName().equals("token")) {
                        String token = cookie.getValue();
                        user = userMapper.findBytoken(token);
                        sourefile.setUser_name(user.getNickname());
                        sourefile.setCreate_time(System.currentTimeMillis());
                        sourefile.setDescription(description);
                        sourefile.setFile_permit(file_permit);
                        sourefile.setTag(tag);
                        sourefile.setId(id);
                        sourefile.setFile_name(fileName);
                        sourefile.setFile_source(Filesource);
                        fileUploadMapper.uploadfile(sourefile);
                        if(sourefile.getFile_permit()==2){
                            File file =null;
                            file=fileUploadMapper.findBypermit(file_permit);
                            file.setGroup_name(user.getGroup_name());
//                            其实到上一步把整个判断结构放在fileUploadMapper.uploadfile(sourcefile);的前面应当也可以
                            fileUploadMapper.setfilerange(file);
                        }
                    }
                }



            }catch (Exception e){
            }
            return "redirect:/FilePage";
        }

}
@GetMapping("/downloadFile/{id}")
    public String download(@PathVariable(name="id") int id,
                           Model model,
                           HttpServletRequest request,
                           Map<String,Object> map,
                           HttpServletResponse response
                           ) throws Exception{
        //应当先获取用户的身份标识信息，与权限信息比对
    User user = null;
    Cookie[] cookies = request.getCookies();
    if(cookies==null){
        return "login";
    }
//用户鉴别模块
    for(Cookie cookie : cookies){
        if(cookie.getName().equals("token")){
            String token = cookie.getValue();
            user = userMapper.findBytoken(token);
            File file= fileUploadMapper.pullfile(id);
            if(user != null){
                //增加下载数
                Filedto filedto= fileService.getbyid(id);

                fileService.increasedown(id);
                model.addAttribute("fileDto",filedto);
//    下载业务模块

                String fileName = file.getFile_name();
                String path = file.getFile_source();
                InputStream inputStream =new FileInputStream(path);

//    if(inputStream==null){
//        throw new ZDYException(ErrorCode.ERR_NOT_FILE);
//    }
//这里标识接受未知的文件类型。
                response.setHeader("conyent-type","application/octet-stream");
                response.setContentType("application/octet-stream");
                try{
                    String name=java.net.URLEncoder.encode(fileName,"UTF-8");
                    response.setHeader("Content-Disposition","attachment;filename="+name);
                }catch (UnsupportedEncodingException e2){
                    e2.printStackTrace();
                }
                byte[] buff=new byte[1024];
                BufferedInputStream bis =null;
                OutputStream os=null;
                try {
                    os = response.getOutputStream();
                    bis=new BufferedInputStream(inputStream);
                    int i = bis.read(buff);
                    while(i != -1){
                        os.write(buff,0,buff.length);
                        os.flush();
                        i = bis.read(buff);
                    }

                }catch (FileNotFoundException e1){
                    //e1,getMessages()+"系统找不到指定的文件"
//        需要自定义异常处理机制
//        throw new MXYException(ErrorCode.ERR_NOT_FILE);或直接用e.printStackTrace()
                    e1.printStackTrace();
                }catch (IOException e){
                    e.printStackTrace();
                }finally {
                    if (bis!= null){
//            控制台输出
                        System.out.println("---file download--"+fileName);
                        try{
                            bis.close();

                        }catch (IOException e){
                            e.printStackTrace();
                        }
                    }

                }

            }else{
             //没有权限下载
                map.put("msg","你没有权限下载此文件");
                return "/FilePage";
            }
        }
    }
    return "redirect:/FilePage";
}
}
