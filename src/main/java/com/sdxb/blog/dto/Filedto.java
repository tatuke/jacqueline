package com.sdxb.blog.dto;

import com.sdxb.blog.entity.User;
/**
 * Created by Kebote on 2020/3/23.
 */
import com.sdxb.blog.entity.User;
public class Filedto {
    private  int id;
    private  String user_name;
    private  String description;
    private  String file_name;
    private  int file_permit;
    private  String tag;
    private  String file_source;
    private long create_time;
    private  User user;
    private int down;
    private String group_name;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getFile_name() {
        return file_name;
    }

    public void setFile_name(String file_name) {
        this.file_name = file_name;
    }

    public int getFile_permit() {
        return file_permit;
    }

    public void setFile_permit(int file_permit) {
        this.file_permit = file_permit;
    }

    public String getTag() {
        return tag;
    }

    public void setTag(String tag) {
        this.tag = tag;
    }

    public String getFile_source() {
        return file_source;
    }

    public void setFile_source(String file_source) {
        this.file_source = file_source;
    }

    public long getCreate_time() {
        return create_time;
    }

    public void setCreate_time(long create_time) {
        this.create_time = create_time;
    }


    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public int getDown() {
        return down;
    }

    public void setDown(int down) {
        this.down = down;
    }

    public String getGroup_name() {
        return group_name;
    }

    public void setGroup_name(String group_name) {
        this.group_name = group_name;
    }
}