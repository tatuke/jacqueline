##数据库建表语句：
####user
```$user建表语句
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `token` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
)
```

```$question建表语句
CREATE TABLE `question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `createid` int(11) NOT NULL,
  `comment_count` int(11) NOT NULL DEFAULT '0',
  `view_count` int(11) NOT NULL DEFAULT '0',
  `like_count` int(11) NOT NULL DEFAULT '0',
  `tag` varchar(250) NOT NULL,
  `createtime` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) 
```

## thymeleaf官方文档
```
https://www.thymeleaf.org/doc/tutorials/3.0/usingthymeleaf.html
```
## BootStrap官方文档
```
https://v3.bootcss.com/components/
```