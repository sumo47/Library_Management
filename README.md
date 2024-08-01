# College Library Management System

## Overview

This project involves creating a database schema for managing book issues in a college library. The system supports both students and teachers issuing books, tracks the return period, and calculates fines if books are returned late. The database schema is designed to handle unique book IDs even for copies of the same book and supports querying the issuance details effectively.

## Database Design

### Entities

1. **Students**
   - `student_id` (Primary Key)
   - `name`
   - `email`
   - `phone_number`
   - `address`

2. **Teachers**
   - `teacher_id` (Primary Key)
   - `name`
   - `email`
   - `phone_number`
   - `address`

3. **Books**
   - `book_id` (Primary Key)
   - `title`
   - `author`
   - `genre`
   - `publisher`
   - `year_published`
   - `copy_number`

4. **IssuedBooks**
   - `issue_id` (Primary Key)
   - `book_id` (Foreign Key referencing Books)
   - `issued_to` (Foreign Key referencing Students or Teachers)
   - `issue_date`
   - `return_date`
   - `fine`

### Relationships

- A student or teacher can issue multiple books.
- Each book can be issued to only one person at a time.
- The `IssuedBooks` table serves as a junction table for many-to-many relationships between books and individuals (students or teachers).

## ER Diagram

The Entity-Relationship (ER) diagram visualizes the database schema, including tables and relationships. It helps in understanding the data structure and the relationships between different entities.

**ER Diagram File**: [ER_Diagram.mwb](path/to/your/ER_Diagram.mwb)

## Setup Instructions

1. **Clone the Repository**

   ```bash
   git clone https://github.com/sumo47/Library_Management.git
   ```

2. **Open MySQL Workbench**

   - Open MySQL Workbench and load the ER Model file (`ER_Diagram.mwb`).

3. **Review and Modify**

   - Review the database schema and make modifications as needed.

4. **Create Database**

   - Use the provided SQL scripts to create the database and tables.

## SQL Scripts

### Create Students Table

```sql
CREATE TABLE Students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    phone_number VARCHAR(15),
    address TEXT
);
```

### Create Teachers Table

```sql
CREATE TABLE Teachers (
    teacher_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    phone_number VARCHAR(15),
    address TEXT
);
```

### Create Books Table

```sql
CREATE TABLE Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100),
    author VARCHAR(100),
    genre VARCHAR(50),
    publisher VARCHAR(100),
    year_published YEAR,
    copy_number INT
);
```

### Create IssuedBooks Table

```sql
CREATE TABLE IssuedBooks (
    issue_id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT,
    issued_to_student INT,
    issued_to_teacher INT,
    issue_date DATE,
    return_date DATE,
    fine DECIMAL(5, 2),
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (issued_to_student) REFERENCES Students(student_id),
    FOREIGN KEY (issued_to_teacher) REFERENCES Teachers(teacher_id),
    CHECK (
        (issued_to_student IS NOT NULL AND issued_to_teacher IS NULL) OR
        (issued_to_student IS NULL AND issued_to_teacher IS NOT NULL)
    )
);

```

## Contribution

Feel free to fork this repository and contribute by submitting pull requests. For any issues or enhancements, please create a new issue in the repository.

## Contact

For any questions or feedback, please contact [thesumitsah47@gmail.com].