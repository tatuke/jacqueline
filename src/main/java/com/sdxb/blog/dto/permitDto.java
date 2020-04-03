package com.sdxb.blog.dto;

import java.util.List;

public class permitDto {
    private String permitListname;
    private List<String> permits;

    public String getPermitListname() {
        return permitListname;
    }

    public void setPermitListname(String permitListname) {
        this.permitListname = permitListname;
    }

    public List<String> getPermits() {
        return permits;
    }

    public void setPermits(List<String> permits) {
        this.permits = permits;
    }
}
