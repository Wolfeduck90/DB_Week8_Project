-- Table to store book information
CREATE TABLE books (
    book_id INT AUTO_INCREMENT PRIMARY KEY, -- Unique identifier for books
    title VARCHAR(255) NOT NULL,            -- Book title (required)
    author VARCHAR(255),                    -- Author of the book
    isbn VARCHAR(13) UNIQUE,                -- Unique ISBN for each book
    publication_date DATE                   -- Date the book was published
);

-- Table to store member information
CREATE TABLE members (
    member_id INT AUTO_INCREMENT PRIMARY KEY, -- Unique identifier for members
    name VARCHAR(255) NOT NULL,               -- Member's full name (required)
    email VARCHAR(255) UNIQUE,                -- Unique email for communication
    phone_number VARCHAR(15)                  -- Contact number
);

-- Table to store loan information
CREATE TABLE loans (
    loan_id INT AUTO_INCREMENT PRIMARY KEY,   -- Unique identifier for loans
    book_id INT NOT NULL,                     -- References books table
    member_id INT NOT NULL,                   -- References members table
    loan_date DATE NOT NULL,                  -- Date when loan was issued
    return_date DATE,                         -- Date when loan was returned
    FOREIGN KEY (book_id) REFERENCES books(book_id),
    FOREIGN KEY (member_id) REFERENCES members(member_id)
);

-- Insert sample data for testing
INSERT INTO books (title, author, isbn, publication_date) 
VALUES 
('The Great Gatsby', 'F. Scott Fitzgerald', '1234567890123', '1925-04-10'),
('To Kill a Mockingbird', 'Harper Lee', '9876543210987', '1960-07-11');

INSERT INTO members (name, email, phone_number) 
VALUES 
('John Doe', 'johndoe@example.com', '123-456-7890'),
('Jane Smith', 'janesmith@example.com', '098-765-4321');

INSERT INTO loans (book_id, member_id, loan_date) 
VALUES 
(1, 1, '2025-04-20'),
(2, 2, '2025-04-21');
