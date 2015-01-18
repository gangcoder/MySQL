create table tab1(id int, f1 float, f2 varchar(20), f3 datetime);

create table tab2 (id int auto_increment primary key, f1 float, f2 int);

//字段属性示例
create table  tab3 (
		id int auto_increment primary key not null, 
		f1 float unique comment '注释1', 
		f2 decimal(20,5) default 12.3, 
		f4 varchar(20) comment '这是一个注释'
		);
//索引示例：
create table  tab4 (
		id int auto_increment not null, 
		f1 float comment '注释1', 
		f2 decimal(20,5) default 12.3, 
		f4 varchar(20) comment '这是一个注释',
		primary key(id), /*相当于加一个主键索引*/
		/*但其实跟在id字段上直接使用结果和含义都一样*/
		unique key (f1),/*相当于写在字段f1上*/
		key(f2)
		);


//较为全面的表创建示例：
create table  tab5 (
		id int auto_increment not null, 
		f1 float comment '注释1', 
		f2 decimal(20,5) default 12.3, 
		f4 varchar(20) comment '这是一个注释',
		id2 int,	/*意图作为set_test表的外键*/
		primary key(id), /*既是约束，也是索引*/
		unique key (f1), /*既是约束，也是索引*/
		key(f2), /*只是索引*/
		foreign key (id2) references set_test(id)
		)
		comment = '这是一个建表大全语句',
		engine = MyIsam,
		auto_increment = 1000;

//创建视图：
create view  view1  as  select id, f1, id2 from tab5;









