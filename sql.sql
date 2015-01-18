create table tab2 (id int auto_increment primary key, f1 float, f2 int);

create table tab3 (
	id int auto_increment primary key not null, 
	f1 float unique,
	f2 decimal(20,5) default 12.3, 
	f4 varchar(20) comment'注释'
	);

#索引
create table tab4(

	);

#约束


#较为全面的表创建示例
create table tab5(
	id int auto_increment not null,
	f1 float comment '注释1',
	f2 decimal(20,5) default 12.3,
	f4 varchar(20) comment '注释2',
	id2 int, /*意图作为tab3的外键*/
	primary key(id),
	unique key(f1),
	key(f2),
	foreign key(id2) references tab3(id)
	)
	comment = '建表语句',
	engine = MyIsam,
	auto_increment = 1000;


create table if not exists tab6 (
	id int auto_increment primary key,
	f1 float,
	c1 char(10),
	v1 varchar(20),
	d1 datetime,
	d2 date default '2015-1-16',
	t1 text,
	danxuan enum('aa','bb','cc','dd'),
	duoxuan set('a','b','c','d','e','f','g','h','i','j'),
	key(v1)
	)
	charset  = utf8,
	engine = innodb,
	auto_increment = 1000;

alter table tab6 add id2 int default 18;

alter table tab6 modify c1 char(30) default 'xg';

rename table tab6 to tab7;  -- 重命名表

create table if not exists tab72 like tab7; --复制表

alter table tab72 engine=MyIsam; --修改表的引擎


-- 创建商品数据库
 create database if not exists shop charset='utf8'; --创建数据库

-- 创建商品类表 
create table if not exists goods_class (id int auto_increment primary key, class_name varchar(40)) engine=innodb ;

-- 创建商品表
create table goods (id int auto_increment primary key, price float not null, goods_name varchar(40),
	 goods_class_id int,
	  foreign key(goods_class_id) references goods_class(id));

-- 用户表

create table user (id int auto_increment primary key, username varchar(30) not null unique);

-- 订单表

create table item (
	id int auto_increment primary key,
	id_use int,
	-- id_item_content int,
	 foreign key(id_use) references user(id),
	 foreign key(id_item_content) references item_content(id)
);

-- 订单内容表
create table item_content(
	id int auto_increment primary key,
	id_goods int,
	foreign key(id_goods) references goods(id)
);

create view viewuser (user,psw) as select username,password from user;