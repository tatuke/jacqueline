package com.sdxb.blog.entity;

public class Department {
    private  int id;
    private  String group_name;
    private  String location;
    private  String access_code;
    private  int admin_id;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }



    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getAccess_code() {
        return access_code;
    }

    public void setAccess_code(String access_code) {
        this.access_code = access_code;
    }

    public int getAdmin_id() {
        return admin_id;
    }

    public void setAdmin_id(int admin_id) {
        this.admin_id = admin_id;
    }

    public String getGroup_name() {
        return group_name;
    }

    public void setGroup_name(String group_name) {
        this.group_name = group_name;
    }
}
