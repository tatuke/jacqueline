package com.sdxb.blog.mapper;

/**
 * Created by Kebote on 2020/3/23.
 */

import com.sdxb.blog.entity.File;
import com.sdxb.blog.entity.Question;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Service;

import java.util.List;
//现在只包括插入和展示（全部）的语句
@Mapper
public interface FileUploadMapper {
@Insert("insert into file(user_name,description,file_name,file_permit,group_name,tag,file_source,create_time) values(#{user_name},#{description},#{file_name},#{file_permit},#{group_name},#{tag},#{file_source},#{create_time})")
    void uploadfile(File file);
    @Select("select * from file order by create_time desc limit #{offset},#{size}")
    List<File> list(@Param("offset") int offset, @Param("size") int size);
    @Select("select count(1) from file")
    int count();
    @Select("select count(1) from file where user_name=#{name}")
    int countbyname(String name);
    @Select("select * from file where user_name=#{name} limit #{offset},#{size}")
    List<File> listbyname(@Param("name") String name, @Param("offset") int offset, @Param("size") int size);
    @Select("select * from file where id=#{id}")
    File getbyId(int id);
    @Update("update file set down=down+1 where id=#{id}")
    void updatedown(int id);
    @Select("select * from file where id=#{id}")
    File pullfile(int id);
    @Update("update file set group_name=#{group_name} where file_permit=2")
    void setfilerange(File file);
    @Select("select * from file where file_permit=2")
    File findBypermit(int file_permit);
    @Delete("delete from file where id=#{id}")
    void deletefile(int id);

}
