package com.sdxb.blog.dto;

import com.sdxb.blog.entity.User;

public class CommentCreateDto {
    private int parent_id;
    private int type;
    private String content;
    private int commentor;
    private User user;

    public int getParent_id() {
        return parent_id;
    }

    public void setParent_id(int parent_id) {
        this.parent_id = parent_id;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
    public int getCommentor(){return commentor;}
    public void setCommentor(int commentor){this.commentor=commentor;}

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
