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
import java.util.List;

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
                File file= new File();
                Cookie[] cookies = request.getCookies();
                for (Cookie cookie : cookies) {
                    if (cookie.getName().equals("token")) {
                        String token = cookie.getValue();
                        user = userMapper.findBytoken(token);
                        file.setUser_name(user.getNickname());
                        file.setCreate_time(System.currentTimeMillis());
                        file.setDescription(description);
                        file.setFile_permit(file_permit);
                        file.setTag(tag);
                        file.setId(id);
                        file.setFile_name(fileName);
                        file.setFile_source(Filesource);
                        fileUploadMapper.uploadfile(file);

                    }
                }

                Filedto filedto= fileService.getbyid(id);
//        增加下载的数,错了，这里是上传的窗口
                fileService.increasedown(id);
                model.addAttribute("fileDto",filedto);


            }catch (Exception e){
            }
               return  "FilePage";
        }

}
}
