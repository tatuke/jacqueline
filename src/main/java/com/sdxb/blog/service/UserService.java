package com.sdxb.blog.service;

import com.sdxb.blog.dto.PageDto;
import com.sdxb.blog.dto.Questiondto;
import com.sdxb.blog.dto.UserDto;
import com.sdxb.blog.entity.Question;
import com.sdxb.blog.entity.User;
import com.sdxb.blog.mapper.UserMapper;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;
@Service
public class UserService {
@Resource
    UserMapper userMapper;
public PageDto list(int page,int size){
    PageDto pageDto=new PageDto();
    int totalcount = userMapper.count();
    pageDto.setPagination(totalcount,page,size);
    //size*{page-1}
    int offset = size * (page - 1);
    //每页只展示5条
    List<User> users = userMapper.list(offset, size);
    List<UserDto> userdtoList = new ArrayList<>();
// 下面的这些可能没有必要
   for (User user:users) {

        UserDto userDto = new UserDto();
        //把第一个对象的所有属性拷贝到第二个对象中
        BeanUtils.copyProperties(user, userDto);

        userdtoList.add(userDto);
    }
    pageDto.setData(userdtoList);
    return pageDto;
}
public PageDto listser(String name,int page,int size){
    PageDto pageDto=new PageDto();
    int totalcount = userMapper.count();
    pageDto.setPagination(totalcount,page,size);
    //size*{page-1}
    int offset = size * (page - 1);
    //每页只展示5条
    List<User> users = userMapper.listbyname(name,offset, size);
    List<UserDto> userdtoList = new ArrayList<>();
    for (User user:users) {

        UserDto userDto = new UserDto();
        //把第一个对象的所有属性拷贝到第二个对象中
        BeanUtils.copyProperties(user, userDto);

        userdtoList.add(userDto);
    }
    pageDto.setData(userdtoList);
    return pageDto;
  }
}
