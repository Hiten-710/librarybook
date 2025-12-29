# 📘 Library Book Management System

A web-based **Library Management System** built using **JSP, JDBC, and MySQL**. This application automates the core workflows of a library, including stocking books, issuing them to students, and handling returns with automatic inventory updates.

---

## 🚀 Features

* **🔐 Admin Authentication:** Secure login system for the administrator.
* **📚 Book Inventory:** Add new books and view the current stock status (Available vs. Total).
* **🔄 Issue Book:** Issue books to students (Automatically decreases stock).
* **↩️ Return Book:** Accept returned books (Automatically increases stock).
* **📜 Transaction History:** View a complete log of all issued and returned books.
* **🚦 Stock Alerts:** Visual cues for books that are out of stock.

---

## 🛠 Tech Stack

* **Frontend:** JSP (JavaServer Pages), HTML5, CSS3, Bootstrap 4.
* **Backend:** Java (JDK 1.8+), JDBC (Java Database Connectivity).
* **Database:** MySQL.
* **Server:** Apache Tomcat 9.
* **Build Tool:** Maven.
* **IDE:** IntelliJ IDEA.

---

## 🗄 Database Setup

To run this project, you must create the database and tables in MySQL.

1.  Open your MySQL Command Line or Workbench.
2.  Run the following SQL commands:

```sql
CREATE DATABASE library_db;
USE library_db;

-- 1. Create Users Table
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    password VARCHAR(100),
    role VARCHAR(20)
);

-- 2. Create Books Table
CREATE TABLE books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(200),
    author VARCHAR(200),
    category VARCHAR(100),
    quantity INT,
    available INT
);

-- 3. Create Issue Records Table
CREATE TABLE issue_records (
    issue_id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT,
    user_id INT,
    issue_date DATE,
    return_date DATE,
    status VARCHAR(20) -- 'issued' or 'returned'
);

-- 4. Insert Admin User
INSERT INTO users (name, email, password, role) 
VALUES ('Admin', 'admin@gmail.com', 'admin123', 'admin');
