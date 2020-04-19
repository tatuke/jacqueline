package com.sdxb.blog.mapper;

import com.sdxb.blog.entity.Question;
import org.apache.ibatis.annotations.*;
import org.springframework.web.servlet.view.script.ScriptTemplateConfig;

import java.util.List;

@Mapper
public interface QuestionMapper {
    @Insert("insert into question(title,description,createid,content_type,tag,createtime) values (#{title},#{description},#{createid},1,#{tag},#{createtime})")
    void createquestion(Question question);
    @Insert("insert into question(title,description,createid,content_type,tag,createtime) values (#{title},#{description},#{createid},2,#{tag},#{createtime})")
    void createnovel(Question question);
    @Select("select * from question order by createtime desc limit #{offset},#{size} ")
    List<Question> list(@Param("offset") int offset, @Param("size") int size);

    @Select("select count(1) from question")
    int count();

    @Select("select * from question where createid=#{userid} limit #{offset},#{size}")
    List<Question> listbyid(@Param("userid") int userid, @Param("offset") int offset, @Param("size") int size);
//    模糊搜索，展现出列表
//    问答
    @Select("select * from question where description like concat ('%',#{description},'%') and content_type=1 limit #{offset},#{size}")
    List<Question> listbydes(@Param("description") String description, @Param("offset") int offset,@Param("size") int size);
//    文章
    @Select("select * from question where description like concat ('%',#{description},'%') and content_type=2 limit #{offset},#{size}")
    List<Question> nolistbydes(@Param("description") String description,@Param("offset") int offset,@Param("size") int size);

    @Select("select count(1) from question where createid=#{userid}")
    int countbyid(int userid);
    @Select("select count(1) from question where description like concat ('%',#{description},'%')")
    int countbydes(String description);

    @Select("select * from question where id=#{id}")
    Question getbyId(int id);

    @Update("update question set title=#{title},description=#{description},tag=#{tag},createtime=#{createtime} where id=#{id}")
    void updatequestion(Question question);
    @Delete ("delete from question where id=#{id}")
     void deletequestion(int id);

    @Update("update question set view_count=view_count+1 where id=#{id}")
    void updateView(int id);
    @Update("update question set like_count=like_count+1 where id=#{id}")
    void updateLike(int id);
    @Update("update question set like_count=like_count-1 where id=#{id}")
    void cancelLike(int id);

    @Update("update question set comment_count=comment_count+1 where id=#{parent_id}")
    void updatecomment(int parent_id);

    @Select("select * from question where tag REGEXP #{result} and id!=#{id} limit 0,10")
    List<Question> getbytag(@Param("id") int id, @Param("result") String result);

    @Select("select title from question where id=#{outerid}")
    String gettitlebyid(int outerid);

    @Select("select * from question order by view_count desc limit 0,10")
    List<Question> gettopten();


}
