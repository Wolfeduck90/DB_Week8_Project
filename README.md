# DB_Week8_Project

Project Title
Library Management System & Task Manager API

Description
This repository showcases two distinct yet practical systems:

Library Management System: A full-featured relational database designed for managing the operations of a library. It keeps track of books, members, loans, book returns, librarians, authors, publishers, and genres. This project demonstrates best practices in relational database design.

Task Manager API: A lightweight CRUD API built using FastAPI and MySQL. The API allows users to manage tasks, providing endpoints for creating, reading, updating, and deleting tasks. This project integrates backend programming with database operations.

Both projects focus on data organization, usability, and scalability while demonstrating proper SQL practices and API functionality.

How to Run / Setup the Project
Library Management System
Install MySQL 8.0 or later.

Import the library_management.sql file into your MySQL database. Use the command:

bash
mysql -u [your_username] -p library_management < library_management.sql
Optionally, create an admin user for database access:

sql
CREATE USER 'admin'@'localhost' IDENTIFIED BY 'SQL**PW';
GRANT ALL PRIVILEGES ON library_management.* TO 'admin'@'localhost';
FLUSH PRIVILEGES;
Use any database client (e.g., MySQL Workbench) to explore and query the database.

Task Manager API
Install Python 3.10 or later.

Clone this repository and navigate to the project directory.

Install required dependencies:

bash
pip install fastapi uvicorn mysql-connector-python
Import the task_manager.sql file into your MySQL database:

bash
mysql -u [your_username] -p task_manager < task_manager.sql
Update the database connection in app.py:

python
db = mysql.connector.connect(
    host="localhost",
    user="admin",
    password="SQL**PW",
    database="task_manager"
)
Run the FastAPI server:

bash
uvicorn app:app --reload
Test the API endpoints using Postman, curl, or a browser.

Entity-Relationship Diagrams (ERDs)
Library Management System ERD
> Include a detailed ERD screenshot that visually depicts entities (e.g., books, members, loans) and their relationships.

Screenshot or link here.

Task Manager API ERD
> Include a simplified ERD for the users and tasks tables.

Screenshot or link here.

API Endpoints
Task Manager API Endpoints
Method	Endpoint	Description	Example Request/Body
POST	/tasks/	Create a new task	{ "user_id": 1, "description": "Complete project", "due_date": "2025-04-30" }
GET	/tasks/	Get all tasks	None
PUT	/tasks/{id}	Update task status	{ "status": "Completed" }
DELETE	/tasks/{id}	Delete a task by ID	None
Features
Library Management System
Relational Structure: Tracks books, members, loans, returns, authors, publishers, genres, and librarians.

Data Integrity: Implements PRIMARY KEY, FOREIGN KEY, NOT NULL, and UNIQUE constraints.

Sample Data: Includes at least 15 rows in each table for testing and demonstration purposes.

Task Manager API
CRUD Operations: Full CRUD functionality for managing tasks.

FastAPI Integration: Lightweight, scalable Python framework for building APIs.

Database Connectivity: Uses MySQL for persistent data storage.

Future Enhancements
Library Management System
Add support for overdue fines calculation.

Integrate with an external system for book inventory checks.

Task Manager API
Add user authentication and authorization.

Implement pagination for listing tasks.

Author
Name: Dominik Contact: ilsaoltactaiocht@gmail.com
