package com.sdxb.blog.service;


import com.sdxb.blog.dto.DepartmentDto;
import com.sdxb.blog.dto.PageDto;
import com.sdxb.blog.entity.Department;
import com.sdxb.blog.entity.User;
import com.sdxb.blog.mapper.DepartmentMapper;
import com.sdxb.blog.mapper.UserMapper;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;


import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;


@Service
public class DepartmentSerivce {
    //虽然只有一条记录但还是要做出这个条件
    @Resource
    private DepartmentMapper departmentMapper;
    @Resource
    private UserMapper userMapper;
    public PageDto list(int page,int size){
        PageDto pageDto=new PageDto();
        int totalcount = departmentMapper.count();
        pageDto.setPagination(totalcount,page,size);
        int offset=size * (page-1);
        List<Department> departments= departmentMapper.list(offset,size);
        List<DepartmentDto> departmentList=new ArrayList<>();
        for(Department department : departments){
            User user = userMapper.findById(department.getAdmin_id());
            DepartmentDto departmentDto =new DepartmentDto();
            BeanUtils.copyProperties(department,departmentDto);
            departmentDto.setUser(user);
            departmentList.add(departmentDto);
        }
        pageDto.setData(departmentList);
        return  pageDto;
    }
public PageDto list(int userid,int page,int size){
        PageDto pageDto =new PageDto();
        int totalcount =departmentMapper.countbyid(userid); //只有一个
        pageDto.setPagination(totalcount,page,size);
    //size*{page-1}
        int offset = size * (page - 1);
    //每页只展示5条
    List<Department> departments= departmentMapper.listbyid(userid,offset,size);
    List<DepartmentDto> departmentList=new ArrayList<>();
    for(Department department : departments){
        User user = userMapper.findById(department.getAdmin_id());
        DepartmentDto departmentDto =new DepartmentDto();
        BeanUtils.copyProperties(department,departmentDto);
        departmentDto.setUser(user);
        departmentList.add(departmentDto);
    }
    pageDto.setData(departmentList);
    return  pageDto;
    }
    public DepartmentDto getbyDid(int id){
        DepartmentDto departmentDto=new DepartmentDto();
        Department department =departmentMapper.getbyDId(id);
        BeanUtils.copyProperties(department, departmentDto);
        User user = userMapper.findById(department.getAdmin_id());
        departmentDto.setUser(user);
        return departmentDto;
    }
//    按操作人员的id取对象
    public DepartmentDto getbyUid(int userid){
        DepartmentDto departmentDto=new DepartmentDto();
        Department department =departmentMapper.getbyUid(userid);
        BeanUtils.copyProperties(department, departmentDto);
        User user = userMapper.findById(department.getAdmin_id());
        departmentDto.setUser(user);
        return departmentDto;
    }

}
