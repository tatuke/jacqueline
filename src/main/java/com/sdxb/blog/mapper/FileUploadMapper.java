package com.sdxb.blog.mapper;

/**
 * Created by Kebote on 2020/3/23.
 */

import com.sdxb.blog.entity.File;
import com.sdxb.blog.entity.Question;
import org.apache.ibatis.annotations.*;

import java.util.List;
//现在只包括插入和展示（全部）的语句
@Mapper
public interface FileUploadMapper {
@Insert("insert into file(user_name,description,file_name,file_permit,tag,file_source,create_time) values(#{user_name},#{description},#{file_name},#{file_permit},#{tag},#{file_source},#{create_time})")
    void uploadfile(File file);
    @Select("select * from file order by createtime desc limit #{offset},#{size} ")
    List<File> list(@Param("offset") int offset, @Param("size") int size);
    @Select("select count(1) from file")
    int count();
    @Select("select count(1) from question where user_name=#{name}")
    int countbyname(String name);
    @Select("select * from file where user_name=#{name} limit #{offset},#{size}")
    List<File> listbyname(@Param("name") String name, @Param("offset") int offset, @Param("size") int size);
    @Select("select * from file where id=#{id}")
    File getbyId(int id);
    @Update("update file set down=down+1 where id=#{id} ")
    void updatedown(int id);

}
