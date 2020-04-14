package com.sdxb.blog.service;

import com.sdxb.blog.dto.Filedto;
import com.sdxb.blog.dto.PageDto;
import com.sdxb.blog.entity.File;
import com.sdxb.blog.entity.User;
import com.sdxb.blog.mapper.FileUploadMapper;
import com.sdxb.blog.mapper.UserMapper;
import org.springframework.beans.BeanUtils;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Kebote on 2020/3/24.
 */

@Service
public class FileService{
    @Resource
    private FileUploadMapper fileUploadMapper;
    @Resource
    private UserMapper userMapper;
    public PageDto list(int page ,int size){
        PageDto pageDto=new PageDto();
        int totalcount = fileUploadMapper.count();
        pageDto.setPagination(totalcount ,page,size);
        //size*{page-1}
        int offset=size * (page - 1);
        //每页只展示5条
        List<File> files=fileUploadMapper.list(offset,size);
        List<Filedto> filedtoList=new ArrayList<>();
        for (File file : files){
            User user = userMapper.findByName(file.getUser_name());
            Filedto filedto= new Filedto();
            BeanUtils.copyProperties(file,filedto);
            filedto.setUser(user);
            filedtoList.add(filedto);
        }
pageDto.setData(filedtoList);
        return pageDto;
    }
    public PageDto list (String name,int page,int size){
        PageDto pageDto=new PageDto();
        int totalcount =fileUploadMapper.countbyname(name);
        pageDto.setPagination(totalcount,page,size);
        int offset = size * (page - 1);
        List<File> files= fileUploadMapper.listbyname(name,offset,size);
        List<Filedto> filedtosList = new ArrayList<>();
        for (File file : files){
            User user =userMapper.findByName(file.getUser_name());
            Filedto filedto = new Filedto();
            //jidad
            BeanUtils.copyProperties(file,filedto);
            filedto.setUser(user);
            filedtosList.add(filedto);
        }
        pageDto.setData(filedtosList);
        return pageDto;
    }
    public Filedto getbyid(int id){
        Filedto filedto =new Filedto();
        File file=fileUploadMapper.getbyId(id);
        //把第一个对象的所有属性复制到另一个对象中
        BeanUtils.copyProperties(file,filedto);
        User user = userMapper .findByName(file.getUser_name());

        filedto.setUser(user);
//       不知道这个是否多余
        filedto.setGroup_name(user.getGroup_name());
        return filedto;
    }

   public void increasedown(int id) {fileUploadMapper.updatedown(id);}
//    public List<File> getbytag(int id,String result) {return fileUploadMapper.getbytag(id,result);}
}