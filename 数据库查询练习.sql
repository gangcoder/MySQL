-- 1) 查出“计算机系”的所有学生信息

select * from students where 院系ID = any(
	select 院系ID from school where 院系名称 = '计算机系'
);

select * from students where 院系ID = (
	select 院系ID from school where 院系名称 = '计算机系'
);
-- 2) 查出“韩顺平”所在的院系信息
select * from school where 院系ID = (
	select 院系ID from students where 学生 = '韩顺平'
);

-- 3) 查出在“行政楼”办公的院系名称
select 院系名称 from school where 系办地址 like '%行政楼%';

-- 4) 查出男生女生各多少人
select 
	(select count(*) from students where 性别 = '男') as '男生人数',
	(select count(*) from students where 性别 = '女') as '女生人数';

-- 5) 查出人数最多的院系信息
select * from school where 院系ID = ( 
	select 院系ID from students group by 院系ID having count(院系ID) >= all(
		select count(院系ID) from students group by 院系ID
		)
	);

-- select 院系ID from (
	-- select 院系ID,count(*) as 数量 from students group by 院系ID ) a where a.数量 >=all(a.数量);
-- select * from college where colid in (select colid from (select count(*)
-- as sum,colid from student group by colid order by sum desc limit 0,1) a);

-- 6) 查出人数最多的院系的男女生各多少人
select 
	(select count(*) from students where 性别 = '男' and 院系ID = ( select 院系ID from students group by 院系ID having count(院系ID) >= all(
		select count(院系ID) from students group by 院系ID) )) as '男生人数',
	(select count(*) from students where 性别 = '女' and  院系ID = ( select 院系ID from students group by 院系ID having count(院系ID) >= all(
		select count(院系ID) from students group by 院系ID) )) as '女生人数';

-- 7) 查出跟“罗弟华”同籍贯的所有人
 select * from students where 籍贯 = (select 籍贯 from students where 学生 = '罗弟华');

-- 8) 查出有“河北”人就读的院系信息
select * from school where 院系ID in 
	(select 院系ID from students where 籍贯 = '河北');

-- 9) 查出跟“河北女生”同院系的所有学生的信息

select * from students where 院系ID in(
	select 院系ID from students where 籍贯 = '河北' and 性别 = '女');


-- 成绩查询

--查询选修了 MySQL 的学生姓名；
select name from stu where id in 
	(select stu_id from stu_kecheng where kecheng_id = 
		(select id from kecheng where kecheng_name = 'Mysql'));

--查询 张三 同学选修了的课程名字；
select kecheng_name from kecheng where id in
	(select kecheng_id from stu_kecheng where stu_id in
			(select id from stu where name = '张三'));

--查询只选修了1门课程的学生学号和姓名；
select id, name from stu where id in 
	(select stu_id from stu_kecheng group by stu_id having count(stu_id) = 1);

--查询选修了至少3门课程的学生信息；
select id, name from stu where id in 
	(select stu_id from stu_kecheng group by stu_id having count(stu_id) >= 3);


--查询选修了所有课程的学生；
select id, name from stu where id in 
	(select stu_id from stu_kecheng group by stu_id having count(stu_id) = (select count(*) from kecheng));

--查询选修课程的学生人数；
select count(*) from stu where id in 
	(select stu_id from stu_kecheng group by stu_id having count(stu_id) >= 1);

--查询所学课程至少有一门跟 张三 所学课程相同的学生信息。
select * from stu where id in
	(select stu_id from stu_kecheng where kecheng_id in
			(select kecheng_id from stu_kecheng where id = (
					select id from stu where name = '张三')));

--查询两门及两门以上不及格同学的平均分 --该名学生的平均分

select avg(score) as avg_score from stu_kecheng where stu_id in
	(select stu_id from stu_kecheng  where score < 70 group by stu_id having count(stu_id) >=2) group by stu_id;
