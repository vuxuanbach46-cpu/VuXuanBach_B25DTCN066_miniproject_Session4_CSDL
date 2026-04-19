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






