package com.sdxb.blog.service;

import com.sdxb.blog.dto.PageDto;
import com.sdxb.blog.dto.Questiondto;
import com.sdxb.blog.entity.Question;
import com.sdxb.blog.entity.User;
import com.sdxb.blog.mapper.QuestionMapper;
import com.sdxb.blog.mapper.UserMapper;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Service
public class QuestionService {

    @Resource
    private QuestionMapper questionMapper;

    @Resource
    private UserMapper userMapper;

    public PageDto list(int page, int size) {
        PageDto pageDto = new PageDto();
        int totalcount = questionMapper.count();
        pageDto.setPagination(totalcount,page,size);
        //size*{page-1}
        int offset = size * (page - 1);
        //每页只展示5条
        List<Question> questions = questionMapper.list(offset, size);
        List<Questiondto> questiondtoList = new ArrayList<>();

        for (Question question : questions) {
            User user = userMapper.findById(question.getCreateid());
            Questiondto questiondto = new Questiondto();
            //把第一个对象的所有属性拷贝到第二个对象中
            BeanUtils.copyProperties(question, questiondto);
            questiondto.setUser(user);
            questiondtoList.add(questiondto);
        }
        pageDto.setData(questiondtoList);
        return pageDto;
    }

    public PageDto list(int userid, int page, int size) {
        PageDto pageDto = new PageDto();
        int totalcount = questionMapper.countbyid(userid);
        pageDto.setPagination(totalcount,page,size);
        //size*{page-1}
        int offset = size * (page - 1);
        //每页只展示5条
        List<Question> questions = questionMapper.listbyid(userid,offset, size);
        List<Questiondto> questiondtoList = new ArrayList<>();

        for (Question question : questions) {
            User user = userMapper.findById(question.getCreateid());
            Questiondto questiondto = new Questiondto();
            //把第一个对象的所有属性拷贝到第二个对象中
            BeanUtils.copyProperties(question, questiondto);
            questiondto.setUser(user);
            questiondtoList.add(questiondto);
        }
        pageDto.setData(questiondtoList);
        return pageDto;
    }
    public PageDto listinsh(String descrption,int page,int size){
        PageDto pageDto= new PageDto();
        int totalcount =questionMapper.countbydes(descrption);
        pageDto.setPagination(totalcount,page,size);
        //size*{page-1}
        int offset =size * (page - 1 );
        List<Question> questions = questionMapper.listbydes(descrption,offset,size);
        List<Questiondto> questiondtoList=new ArrayList<>();
        //这里可能没用，这里应该是显示问题带出来的拥有者相关信息
        for(Question question:questions){
            User user = userMapper.findById(question.getCreateid());
            Questiondto questiondto =new Questiondto();
            //还是把第一个对象的所有属性拷贝到第二个对象中，把 question的对象拷贝到dto中，一起带出信息
            BeanUtils.copyProperties(question ,questiondto);
            questiondto.setUser(user);
            questiondtoList.add(questiondto);

        }
pageDto.setData(questiondtoList);
        return pageDto;
    }
    public PageDto listinnove(String descrption,int page,int size){
        PageDto pageDto= new PageDto();
        int totalcount =questionMapper.countbydes(descrption);
        pageDto.setPagination(totalcount,page,size);
        //size*{page-1}
        int offset =size * (page - 1 );
        List<Question> questions = questionMapper.nolistbydes(descrption,offset,size);
        List<Questiondto> questiondtoList=new ArrayList<>();
        //这里可能没用，这里应该是显示问题带出来的拥有者相关信息
        for(Question question:questions){
            User user = userMapper.findById(question.getCreateid());
            Questiondto questiondto =new Questiondto();
            //还是把第一个对象的所有属性拷贝到第二个对象中，把 question的对象拷贝到dto中，一起带出信息
            BeanUtils.copyProperties(question ,questiondto);
            questiondto.setUser(user);
            questiondtoList.add(questiondto);

        }
        pageDto.setData(questiondtoList);
        return pageDto;
    }
    public Questiondto getbyid(int id) {
        Questiondto questiondto=new Questiondto();
        Question question=questionMapper.getbyId(id);
        //把第一个对象的所有属性拷贝到第二个对象中
        BeanUtils.copyProperties(question, questiondto);
        User user = userMapper.findById(question.getCreateid());
        questiondto.setUser(user);
        return questiondto;
    }

    public void increaseview(int id) {
        questionMapper.updateView(id);
    }

    public List<Question> getbytag(int id, String result) {
        return questionMapper.getbytag(id,result);
    }

    public List<Question> gettopten() {
        List<Question> questions=questionMapper.gettopten();
        return questions;
    }
    public void increaselike(int id){questionMapper.updateLike(id);}
    public void cancellike(int id){questionMapper.cancelLike(id);}
}
