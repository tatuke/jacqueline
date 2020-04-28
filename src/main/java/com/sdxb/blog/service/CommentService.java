package com.sdxb.blog.service;

import com.sdxb.blog.dto.CommentDto;
import com.sdxb.blog.entity.Comment;
import com.sdxb.blog.entity.Question;
import com.sdxb.blog.entity.User;
import com.sdxb.blog.mapper.CommentMapper;
import com.sdxb.blog.mapper.QuestionMapper;
import com.sdxb.blog.mapper.UserMapper;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Service
public class CommentService {
    @Resource
    private CommentMapper commentMapper;
    @Resource
    private UserMapper userMapper;

    @Resource
    private QuestionMapper questionMapper;

    public List<CommentDto> getByid(int id) {
        //通过文章id找到所有回复
        List<Comment> comments=commentMapper.getByid(id);
        //创建要给CommentDto的list
        List<CommentDto> lists=new ArrayList<>();
        //遍历每个Comment
        for(Comment comment:comments){
            //找到回复人
            User user=userMapper.findById(comment.getCommentor());
            CommentDto commentDto=new CommentDto();
            //将第一个元素复制到第二个元素中
            BeanUtils.copyProperties(comment,commentDto);
            commentDto.setUser(user);
            lists.add(commentDto);
        }
        return lists;
    }
//    这里是评论的点赞功能，但是应该不会用到,出现创建者指向错误的问题是这里
    public void thumbUp(int id){commentMapper.thumbup(id);}
    public CommentDto singleID(int id){
        CommentDto commentdto=new CommentDto();
        Comment comment= commentMapper.singleID(id);

        //把第一个对象的所有属性拷贝到第二个对象中
        BeanUtils.copyProperties(comment,commentdto);
        Question question=questionMapper.getbyId(comment.getParent_id());
        User user = userMapper.findById(question.getCreateid());
 commentdto.setUser(user);
        return commentdto;

    }
}
