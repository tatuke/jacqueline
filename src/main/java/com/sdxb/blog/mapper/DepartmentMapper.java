package com.sdxb.blog.mapper;
import com.sdxb.blog.entity.Department;
import com.sdxb.blog.entity.User;
import org.apache.ibatis.annotations.*;
import java.util.List;
@Mapper
public interface DepartmentMapper {
    @Select("select * from department where group_name=#{group_name} and access_code=#{access_code}")
    Department select(Department department);
    @Update("update department set access_code=#{access_code} where group_name=#{group_name}")
    void updatecode(Department department);
    @Select("select * from department where group_name=#{group_name} ")
    Department findbyname(String group_name);
}
