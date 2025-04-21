CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY, -- Unique identifier for users
    username VARCHAR(255) NOT NULL UNIQUE,  -- Username (required & unique)
    email VARCHAR(255) NOT NULL UNIQUE      -- Email (required & unique)
);

CREATE TABLE tasks (
    task_id INT AUTO_INCREMENT PRIMARY KEY, -- Unique identifier for tasks
    user_id INT NOT NULL,                   -- References users table
    description TEXT NOT NULL,              -- Task description
    status ENUM('Pending', 'Completed') DEFAULT 'Pending', -- Task status
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Auto-generated timestamp
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);
