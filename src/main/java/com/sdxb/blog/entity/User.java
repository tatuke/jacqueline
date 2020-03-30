package com.sdxb.blog.entity;
public class User {
    private int id;
    private int req_id;
    private String email;
    private String name;
    private String password;
    private String nickname;
    private String group_name;
    private String per_code;
    private String token;
    private String headpic;

    public User() {
    }

    public User(int id,int req_id,String email, String name, String password,String nickname,String group_name,String per_code) {
        this.id = id;
        this.email=email;
        this.name = name;
        this.password = password;
        this.nickname=nickname;
        this.group_name=group_name;
        this.per_code=per_code;
    }

    public int getId() {
        return id;
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getHeadpic() {
        return headpic;
    }

    public void setHeadpic(String headpic) {
        this.headpic = headpic;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getReq_id() {
        return req_id;
    }

    public void setReq_id(int req_id) {
        this.req_id = req_id;
    }

    public String getGroup_name() {
        return group_name;
    }

    public void setGroup_name(String group_name) {
        this.group_name = group_name;
    }

    public String getPer_code() {
        return per_code;
    }

    public void setPer_code(String per_code) {
        this.per_code = per_code;
    }
}
