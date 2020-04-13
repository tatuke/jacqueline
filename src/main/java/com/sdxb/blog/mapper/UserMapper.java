package com.sdxb.blog.mapper;

import com.sdxb.blog.entity.User;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

@Mapper
public interface UserMapper {
    @Insert("insert into user(name,email,password,nickname,group_name,token) values (#{name},#{email},#{password},#{nickname},#{group_name},#{token})" )
    void insert(User user);

    @Select("select * from user where email=#{email} and password=#{password}")
    User select(User user);
    @Update("update user set headpic=#{headpic} where token=#{token}")
    User updateheadpic(String token);
    @Update("update user set headpic=#{headpic} where id=#{id}")
    void updateheadID(User user);

    @Select("select  * from user where token=#{token}")
    User findBytoken(String token);

    @Select("select * from user where id=#{createid}")
    User findById(int createid);
    @Select("select * from user where name=#{name}")
    User findByUId(int id);
    @Select("select * from user where name=#{user_name}")
    User findByName(String user_name);
    @Select("select group_name from user where name=#{user_name}")
    User groupByname(String user_name);
}
