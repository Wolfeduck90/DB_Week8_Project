from fastapi import FastAPI, HTTPException
import mysql.connector

app = FastAPI()

# Connect to the MySQL database
db = mysql.connector.connect(
    host="localhost",
    user="Admin",
    password="SQL**PW",
    database="task_manager"
)

# CREATE a new task
@app.post("/tasks/")
def create_task(user_id: int, description: str, due_date: str):
    cursor = db.cursor()
    cursor.execute(
        "INSERT INTO tasks (user_id, description, due_date) VALUES (%s, %s, %s)", 
        (user_id, description, due_date)
    )
    db.commit()
    return {"message": "Task created successfully!"}

# READ all tasks
@app.get("/tasks/")
def get_tasks():
    cursor = db.cursor(dictionary=True)
    cursor.execute("SELECT * FROM tasks")
    tasks = cursor.fetchall()
    return tasks

# UPDATE a task status
@app.put("/tasks/{task_id}")
def update_task(task_id: int, status: str):
    cursor = db.cursor()
    cursor.execute(
        "UPDATE tasks SET status = %s WHERE task_id = %s", 
        (status, task_id)
    )
    db.commit()
    return {"message": "Task updated successfully!"}

# DELETE a task
@app.delete("/tasks/{task_id}")
def delete_task(task_id: int):
    cursor = db.cursor()
    cursor.execute("DELETE FROM tasks WHERE task_id = %s", (task_id,))
    db.commit()
    return {"message": "Task deleted successfully!"}
