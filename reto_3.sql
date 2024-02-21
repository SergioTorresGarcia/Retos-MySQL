
CREATE DATABASE reto3;
USE reto3;


CREATE TABLE students(
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(40) NOT NULL,
    surname VARCHAR(40) NOT NULL,
    username VARCHAR(40) NOT NULL UNIQUE,
    email VARCHAR(50) NOT NULL UNIQUE,
    phone INT,
    password VARCHAR(255) NOT NULL,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT current_timestamp,
    updated_at TIMESTAMP DEFAULT current_timestamp ON UPDATE  current_timestamp
);

CREATE TABLE courses(
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    description VARCHAR(200) NOT NULL,
    status ENUM('registering', 'in_process', 'done'),
    created_at TIMESTAMP DEFAULT current_timestamp,
    updated_at TIMESTAMP DEFAULT current_timestamp ON UPDATE current_timestamp
);

CREATE TABLE exams(
	id INT AUTO_INCREMENT PRIMARY KEY,
    date_hour TIMESTAMP NOT NULL,
    place VARCHAR(100),
    instructions VARCHAR(500),
    status ENUM('asigned', 'done', 'corrected'),
    is_passed BOOLEAN NOT NULL DEFAULT FALSE,
    score INT NOT NULL DEFAULT 0,
    course_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT current_timestamp,
    updated_at TIMESTAMP DEFAULT current_timestamp ON UPDATE  current_timestamp,
    FOREIGN KEY (course_id) REFERENCES courses(id)
);

CREATE TABLE tasks(
	id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(40) NOT NULL,
    description VARCHAR(200),
    student_id INT,
    course_id INT,
    status ENUM('asigned', 'done', 'corrected'),
    created_at TIMESTAMP DEFAULT current_timestamp,
    updated_at TIMESTAMP DEFAULT current_timestamp ON UPDATE  current_timestamp,
    FOREIGN KEY (student_id) REFERENCES students(id),
    FOREIGN KEY (course_id) REFERENCES courses(id)
);

CREATE TABLE exam_student(
	id INT AUTO_INCREMENT PRIMARY KEY,
    exam_id INT,
    student_id INT,
    created_at TIMESTAMP DEFAULT current_timestamp,
    updated_at TIMESTAMP DEFAULT current_timestamp ON UPDATE  current_timestamp,
    FOREIGN KEY (exam_id) REFERENCES exams(id),
    FOREIGN KEY (student_id) REFERENCES students(id)
);

CREATE TABLE course_student(
	id INT AUTO_INCREMENT PRIMARY KEY,
    course_id INT,
    student_id INT,
    created_at TIMESTAMP DEFAULT current_timestamp,
    updated_at TIMESTAMP DEFAULT current_timestamp ON UPDATE  current_timestamp,
    FOREIGN KEY (course_id) REFERENCES courses(id),
    FOREIGN KEY (student_id) REFERENCES students(id)
);