use demoss2;

create table Student (
	student_code varchar(5) primary key,
    student_fullname varchar(100) not null ,
    student_date_birth datetime not null ,
    student_email varchar(50) unique
);

create table teacher(
	teacher_code varchar(5) primary key ,
    teacher_fullname varchar(100) not null ,
    teacher_email varchar(50) unique
);

create table Course (
	course_code varchar(5) primary key ,
    course_description mediumtext ,
	course_name VARCHAR(100) NOT NULL,
    number_lessons INT NOT NULL CHECK(number_lessons > 0),
	course_teacher varchar(100) not null ,
    FOREIGN KEY (teacher_code) REFERENCES Teacher(teacher_code)
);

create table Enrollment(
	student_register varchar(5),
    course_registration varchar(50),
    date_register datetime , 
    PRIMARY KEY (student_code, course_code),
    FOREIGN KEY (student_code) REFERENCES Student(student_code),
    FOREIGN KEY (course_code) REFERENCES Course(course_code)
);

create table score (
	student_code varchar(5) primary key,
    course_code varchar(5) ,
    midterm_exam int not null check(midterm_exam > 0 and midterm_exam < 10),
    final_exam int not null check(final_exam > 0 and final_exam < 10),
    PRIMARY KEY (student_code, course_code),
    FOREIGN KEY (student_code) REFERENCES Student(student_code),
    FOREIGN KEY (course_code) REFERENCES Course(course_code)
);

-- thêm dữ liệu
-- thêm 5 giảng viên
insert into  teacher (teacher_id, full_name, email) value
('T001', N'Nguyễn Văn An', 'an.nv@email.com'),
('T002', N'Trần Thị Bình', 'binh.tt@email.com'),
('T003', N'Lê Hoàng Nam', 'nam.lh@email.com'),
('T004', N'Phạm Thanh Thủy', 'thuy.pt@email.com'),
('T005', N'Đặng Minh Đức', 'duc.dm@email.com');

-- thêm 5 sinh viên 
insert into student (student_id, full_name, date_of_birth, email) value
('S001', N'Trần Văn Cường', '2007-05-15', 'cuong.tv@student.com'),
('S002', N'Lê Thị Diễm', '2007-10-20', 'diem.lt@student.com'),
('S003', N'Nguyễn Minh Hải', '2007-01-12', 'hai.nm@student.com'),
('S004', N'Phạm Hồng Nhung', '2007-03-25', 'nhung.ph@student.com'),
('S005', N'Vũ Đức Anh', '2007-12-30', 'anh.vd@student.com');

-- thêm 5 khóa học
insert into course (course_id, course_name, description, total_sessions, teacher_id) value
('C001', N'Lập trình SQL cơ bản', N'Học về truy vấn dữ liệu', 12, 'T001'),
('C002', N'Phân tích dữ liệu với Python', N'Xử lý dữ liệu khoa học', 15, 'T001'),
('C003', N'Thiết kế Web Frontend', N'HTML, CSS và JS', 20, 'T002'),
('C004', N'Trí tuệ nhân tạo', N'Nhập môn Machine Learning', 18, 'T003'),
('C005', N'Quản trị mạng', N'Bảo mật và hệ thống', 10, 'T005');

-- thêm 5 dki khóa học
insert into enrollment (student_id, course_id, enrollment_date) value
('S001', 'C001', '2025-09-01'),
('S001', 'C002', '2025-09-02'),
('S002', 'C001', '2025-09-01'),
('S003', 'C003', '2025-09-05'),
('S004', 'C004', '2025-09-10');

-- thêm điêmr 
insert into  score (student_id, course_id, midterm_score, final_score) value
('S001', 'C001', 8.5, 9.0),
('S001', 'C002', 7.0, 8.0),
('S002', 'C001', 9.0, 8.5),
('S003', 'C003', 6.5, 7.5),
('S004', 'C004', 10.0, 9.5);

-- Phần 3 : UPDATE
update student 
set email = 'cuongnew.tv@student.com'
where student_id ='S001';
update course 
set description='Hệ thống kiến thức AI'
where course_id='C004';
update score 
set final_score = 8
where student_id='S001' and course_id='C001';

-- Phần 4 :DELETE
delete from enrollment
where student_id='S004' and course_id='C004';

delete from score 
where student_id='S004' and course_id='C004';

-- Phần 5
select *from student;
select *from teacher;
select *from course;
select *from enrollment;
select *from score;






