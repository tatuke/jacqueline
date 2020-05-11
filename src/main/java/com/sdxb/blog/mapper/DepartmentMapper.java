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
    @Select("select * from department where group_name=#{group_name}")
    Department findbyname(String group_name);
    @Select("select count(1) from department")
    int count();
    @Select("select * from department limit #{offset},#{size}")
    List<Department> list(@Param("offset") int offset,@Param("size") int size);
//    使用管理员的ID作为筛选机构的条件
    @Select("select * from department where admin_id=#{userid} limit #{offset},#{size}")
    List<Department> listbyid(@Param("userid") int userid,@Param("offset") int offset,@Param("size") int size);
    //看看这个管理员管理着哪些机构
    @Select("select count(1) from department where admin_id=#{userid}")
    int countbyid(int userid);
    @Select("select * from department where id=#{id}")
    Department getbyDId(int id);
    @Select("select * from department where admin_id=#{userid}")
    Department getbyUid(int userid);

}
