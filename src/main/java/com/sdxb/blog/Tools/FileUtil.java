package com.sdxb.blog.Tools;

import java.io.File;
import java.io.FileOutputStream;

/**
 * Created by Kebote on 2020/3/8.
 */
public class FileUtil {
    //执行文件添加操作
    public static void uploadFile(byte[] file,String filepath,String fileName)throws Exception{
        File targetFile=new File(filepath);
        if(!targetFile.exists()){
            targetFile.mkdirs();
        }
        //输出路径到数据库
        FileOutputStream out =new FileOutputStream(filepath+fileName);
        out.write(file);
        out.flush();
        out.close();
    }
}
