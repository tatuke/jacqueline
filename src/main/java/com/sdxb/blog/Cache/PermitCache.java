package com.sdxb.blog.Cache;


import com.sdxb.blog.dto.permitDto;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class PermitCache {
    public List<permitDto> getpermits() {
        List<permitDto> permits = new ArrayList<>();

        permitDto permission = new permitDto();
        permission.setPermitListname("文件权限");
        permission.setPermits(Arrays.asList("所有人", "本机构"));
        permits.add(permission);

        return permits;
    }
}
