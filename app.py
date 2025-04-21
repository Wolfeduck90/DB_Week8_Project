from fastapi import FastAPI, HTTPException
import mysql.connector

app = FastAPI()

# Connect to MySQL database
db = mysql.connector.connect(
    host="localhost",
    user="root",
    password="password",
    database="task_manager"
)

# Create task endpoint
@app.post("/tasks/")
def create_task(user_id: int, description: str):
    cursor = db.cursor()
    cursor.execute(
        "INSERT INTO tasks (user_id, description) VALUES (%s, %s)", 
        (user_id, description)
    )
    db.commit()
    return {"message": "Task created successfully!"}

# Read tasks endpoint
@app.get("/tasks/")
def get_tasks():
    cursor = db.cursor(dictionary=True)
    cursor.execute("SELECT * FROM tasks")
    tasks = cursor.fetchall()
    return tasks

# Update task endpoint
@app.put("/tasks/{task_id}")
def update_task(task_id: int, status: str):
    cursor = db.cursor()
    cursor.execute(
        "UPDATE tasks SET status = %s WHERE task_id = %s", 
        (status, task_id)
    )
    db.commit()
    return {"message": "Task updated successfully!"}

# Delete task endpoint
@app.delete("/tasks/{task_id}")
def delete_task(task_id: int):
    cursor = db.cursor()
    cursor.execute("DELETE FROM tasks WHERE task_id = %s", (task_id,))
    db.commit()
    return {"message": "Task deleted successfully!"}
