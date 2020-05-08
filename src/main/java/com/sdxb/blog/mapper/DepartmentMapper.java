package com.sdxb.blog.mapper;
import com.sdxb.blog.entity.Department;
import com.sdxb.blog.entity.User;
import org.apache.ibatis.annotations.*;
import java.util.List;
@Mapper
public interface DepartmentMapper {
    @Select("select * from department where depart_name=#{depart_name} and access_code=#{access_code}")
    Depart select(Depart depart);
}
