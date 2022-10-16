CREATE DATABASE pet_manage;
USE pet_manage;

DROP TABLE IF EXISTS `User`;
#用户信息表
CREATE TABLE USER
(
    Uid    INT AUTO_INCREMENT PRIMARY KEY, #用户编号
    Uname  VARCHAR(20)  NOT NULL,          #账号
    Upwd   VARCHAR(255) NOT NULL,          #密码
    Uxname VARCHAR(20)  NOT NULL,          #用户名
    Usex   CHAR(2),                        #用户性别
    Utel   VARCHAR(20)  NOT NULL,          #电话
    Usite  VARCHAR(50)  NOT NULL,          #地址
    Utype  INT          NOT NULL,          # 角色类型：普通用户=0；社团管理员=1
    Usrl   VARCHAR(100) NULL,              #头像地址（可以为空，如果有准备让用户上传头像这个的话，得加上这个属性吧）写了Usrl，担心Url关键字撞了
    Uinfo  VARCHAR(100) NULL               #信息介绍（可以用一句话简单介绍自己，有点标签的意思）
);

DROP TABLE IF EXISTS `Cat`;
#猫猫信息表
CREATE TABLE Cat
(
    Cid INT AUTO_INCREMENT PRIMARY KEY,	#猫编号
    Cname VARCHAR(20) NOT NULL,	    #名称
    Ccolor VARCHAR(20) NOT NULL,    #毛色
    Curl VARCHAR(100) NOT NULL,		#图片地址
    Cinfo VARCHAR(100) NOT NULL ,   #信息描述
    Cisadopt INT NOT NULL  #领养状态：未领养=0 待审核=1，已领养=2
);



DROP TABLE IF EXISTS `Adopt`;
#领养信息表
CREATE TABLE Adopt
(
    Aid   INT AUTO_INCREMENT PRIMARY KEY,    #猫领养编号
    Uid   INT          NOT NULL,             #用户编号
    Cid   INT          NOT NULL,             #猫编号
    Ainfo VARCHAR(100) NOT NULL,             #申请描述
    FOREIGN KEY (Uid) REFERENCES USER (Uid), #用户编号作为外码
    FOREIGN KEY (Cid) REFERENCES Cat (Cid)   #猫编号作为外码
);



DROP TABLE IF EXISTS `Post`;
#帖子信息表
CREATE TABLE Post
(
    Pid   INT AUTO_INCREMENT PRIMARY KEY, #收藏编号
    Purl  VARCHAR(100) NULL,              #图片（可以为空，可以只发表文字，帖子里面不包含图片），初始值为空
    Pinfo VARCHAR(100) NULL,              #帖子描述（可以为空，可以只发表文字，帖子里面不包含图片），初始值为空
    Ptime DATE         NOT NULL,          #发帖时间(但是感觉要是有这个时间的话，得系统自动生成，记录到月份应该就行了）
    Psite VARCHAR(50)  NULL,              #发帖地点（可以为空，可以发出自己的位置信息，如果之后可以的话，可以做一个定位，直接获取信息）初始值为空
    Pnum  INT          NULL               #帖子数量（初始值为空，也就是0）
);



DROP TABLE IF EXISTS `Gather`;
#收藏信息表
CREATE TABLE Gather
(
    Gid   INT AUTO_INCREMENT PRIMARY KEY,    #收藏编号
    Uid   INT  NOT NULL,#用户编号
    Cid   INT  NULL,                         #猫编号（可以为空，可以收藏帖子，帖子里面不包含猫猫信息），初始值为空
    Pid   INT  NULL,                  `user`       #帖子编号（可以为空，可以收藏帖子，帖子里面不包含猫猫信息），初始值为空
    Gnum  INT  NULL,                         #收藏数量（初始值为空，也就是0）
    Gtime DATE NULL,                         #收藏时间（这个可以用户点击进去，了解自己收藏详情的时候显示，如果Ptime发帖时间可以做的话，这个不知道是不是可以，我先放着）
    FOREIGN KEY (Uid) REFERENCES USER (Uid), #猫编号作为外码
    FOREIGN KEY (Cid) REFERENCES Cat (Cid)   #猫编号作为外码
);
