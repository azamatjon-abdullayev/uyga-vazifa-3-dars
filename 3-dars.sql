
create table if not exists Maktab(
	school_id serial primary key,
	school_name varchar(100) not null,
	school_add varchar(50),
	s_pho_num char(15),
	davlat_mak bool default true
);

insert into maktab(school_name,school_add,s_pho_num)VALUES
('8-maktab','toshkent','999999999'),
('1-maktab','toshkent','999478899'),
('3-maktab','toshkent','9947994799'),
('113-maktab','toshkent','998968999');

select * from maktab;

alter table maktab
RENAME column school_name to maktab_nomi;

alter table maktab
RENAME column school_add to manzil;

alter table maktab
rename to maktab2; 

UPDATE maktab2 SET manzil = 'fargona' WHERE school_id = 4;

UPDATE maktab2 SET manzil = 'C++'WHERE school_id = 1 ;


DELETE FROM maktab2 WHERE school_id = 1;

-- #--------------------------------------
create table Teacher(
	teacher_id serial primary key,
	first_name varchar(100) not null,
	last_name varchar(50) not null,
	email varchar(150),
	phone_num char(15),
	school_id int REFERENCES Maktab(school_id) ON DELETE CASCADE
);

insert into teacher(first_name,last_name,email,phone_num,school_id)VALUES
('ali','aliyev','ali@gmail',12111111,1),
('vali','valiyev','vali@gmail',666666666,1),
('bali','baliyev','bali@gmail',88888881,2),
('tohir','tohirov','ali@gmail',127777111,3);

select * from teacher;

alter table teacher
RENAME column first_name to ism;

alter table teacher
RENAME column last_name to familiya;

alter table teacher
rename to teachers; 

UPDATE teachers SET familiya = 'aliyev' WHERE teacher_id = 4;

UPDATE teachers SET familiya = 'aliyev' WHERE school_id = 1 ;

DELETE FROM teachers WHERE teacher_id = 1;
---------------------------------------------------------------
create table Student(
	stu_id serial primary key,
	first_name VARCHAR(100) not null,
	last_name VARCHAR(100) not null,
	date_of_birth date default CURRENT_DATE,
	gender varchar(100),
	school_id int REFERENCES Maktab(school_id) ON DELETE CASCADE
);
insert into student(first_name,last_name,gender,school_id)VALUES
('abdulloh','ganiyev','erkak','1'),
('setora','ganiyeva','ayol','2'),
('abdulloh','ganiyev','erkak','3');

select * from student;
alter table student
RENAME column first_name to ism;

alter table student
RENAME column last_name to familiya;


UPDATE student SET familiya = 'aliyev' WHERE stu_id = 3;

UPDATE student SET familiya = 'aliyev' WHERE stu_id = 1 ;

DELETE FROM student WHERE stu_id = 1;
-----------------------------------------------
create table classs(
	class_id serial primary key,
	class_name varchar(100) not null,
	cls_teach_id int REFERENCES Teacher(teacher_id) ON DELETE CASCADE,
	cls_school_id int REFERENCES Maktab(school_id) ON DELETE CASCADE
);

insert into classs(class_name,cls_teach_id,cls_school_id)VALUES
('5b',1,2),
('4a',1,2);
select * from classs;
alter table classs
RENAME column class_name to clas_nomi;


-------------------------------------------------------------------
create table subject(
	sub_id serial primary key,
	sub_name varchar(150),
	school_id int REFERENCES classs(class_id) ON DELETE CASCADE,
	sub_teacher_id int REFERENCES Teacher(teacher_id) ON DELETE CASCADE
);

insert into subject(sub_name,school_id,sub_teacher_id)VALUES
('matem',2,2),
('ona tili',1,1);

select * from subject;
alter table subject
RENAME column sub_name to fan_name;


------------------------------------------------
create table enrollment(
	enroll_id serial primary key,
	en_stu_id int REFERENCES Student(stu_id) ON DELETE CASCADE,
	en_cls_id int REFERENCES classs(class_id) ON DELETE CASCADE,
	enrolment_date date default current_date
);

insert into enrollment(en_stu_id,en_cls_id)VALUES
(1,2),
(2,2);
select * from enrollment;
alter table enrollment
RENAME column en_stu_id to enn_stu_id;

alter table enrollment
RENAME column en_cls_id to enn_cls_id;
---------------------------------------------------
create table grade(
	gr_id serial primary key,
	gr_stu_id int REFERENCES Student(stu_id) ON DELETE CASCADE,
	gr_cls_id int REFERENCES subject(sub_id) ON DELETE CASCADE,
	grade_value char(10),
	grade_date date default current_daTE
);

insert into grade(gr_stu_id,gr_cls_id,grade_value)VALUES
(1,1,'alo'),
(2,2,'ortacha');

select * from grade;

alter table grade
RENAME column gr_stu_id to gr_stu_idd;

alter table grade
RENAME column gr_cls_id to grr_cls_id;


