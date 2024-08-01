# Library Management

show databases;
use sumit_db;

## creating STUDENT Table
CREATE TABLE Students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    phone_number VARCHAR(15),
    address TEXT
);

## creating TEACHER Table
CREATE TABLE Teachers (
    teacher_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    phone_number VARCHAR(15),
    address TEXT
);

## creating BOOK Table
CREATE TABLE Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100),
    author VARCHAR(100),
    genre VARCHAR(50),
    publisher VARCHAR(100),
    year_published YEAR,
    copy_number INT
);

## creating IssuedBook Table
CREATE TABLE IssuedBooks (
    issue_id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT,
    issued_to INT,
    issue_date DATE,
    return_date DATE,
    fine DECIMAL(5, 2),
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (issued_to) REFERENCES Students(student_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);


















