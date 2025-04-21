CREATE TABLE authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY, 
    name VARCHAR(255) NOT NULL, 
    birth_date DATE
);

INSERT INTO authors (name, birth_date) 
VALUES 
('F. Scott Fitzgerald', '1896-09-24'),
('Harper Lee', '1926-04-28'),
('George Orwell', '1903-06-25'),
('J.K. Rowling', '1965-07-31'),
('Jane Austen', '1775-12-16'),
('Mark Twain', '1835-11-30'),
('Ernest Hemingway', '1899-07-21'),
('William Shakespeare', '1564-04-23'),
('Charles Dickens', '1812-02-07'),
('Leo Tolstoy', '1828-09-09'),
('Agatha Christie', '1890-09-15'),
('Arthur Conan Doyle', '1859-05-22'),
('Virginia Woolf', '1882-01-25'),
('John Steinbeck', '1902-02-27'),
('Emily Bronte', '1818-07-30');

CREATE TABLE publishers (
    publisher_id INT AUTO_INCREMENT PRIMARY KEY, 
    name VARCHAR(255) NOT NULL, 
    contact_email VARCHAR(255) UNIQUE
);

INSERT INTO publishers (name, contact_email) 
VALUES 
('Scribner', 'contact@scribner.com'),
('J.B. Lippincott & Co.', 'info@lippincott.com'),
('Penguin Books', 'info@penguin.com'),
('Bloomsbury', 'contact@bloomsbury.com'),
('HarperCollins', 'info@harpercollins.com'),
('Random House', 'info@randomhouse.com'),
('Simon & Schuster', 'contact@simonandschuster.com'),
('Vintage Books', 'info@vintagebooks.com'),
('Macmillan Publishers', 'contact@macmillan.com'),
('Oxford University Press', 'info@oup.com'),
('Cambridge University Press', 'info@cambridge.org'),
('Doubleday', 'contact@doubleday.com'),
('Scholastic', 'info@scholastic.com'),
('Faber & Faber', 'contact@faber.co.uk'),
('Hachette Livre', 'info@hachette.com');

CREATE TABLE genres (
    genre_id INT AUTO_INCREMENT PRIMARY KEY, 
    genre_name VARCHAR(100) UNIQUE NOT NULL
);

INSERT INTO genres (genre_name) 
VALUES 
('Classic'),
('Fiction'),
('Mystery'),
('Fantasy'),
('Sci-Fi'),
('Romance'),
('Horror'),
('Historical'),
('Biography'),
('Adventure'),
('Young Adult'),
('Children'),
('Drama'),
('Thriller'),
('Non-Fiction');

CREATE TABLE books (
    book_id INT AUTO_INCREMENT PRIMARY KEY, 
    title VARCHAR(255) NOT NULL, 
    author_id INT, 
    publisher_id INT, 
    genre_id INT, 
    isbn VARCHAR(13) UNIQUE, 
    publication_date DATE,
    FOREIGN KEY (author_id) REFERENCES authors(author_id),
    FOREIGN KEY (publisher_id) REFERENCES publishers(publisher_id),
    FOREIGN KEY (genre_id) REFERENCES genres(genre_id)
);

INSERT INTO books (title, author_id, publisher_id, genre_id, isbn, publication_date) 
VALUES 
('The Great Gatsby', 1, 1, 1, '1234567890123', '1925-04-10'),
('To Kill a Mockingbird', 2, 2, 2, '9876543210987', '1960-07-11'),
('1984', 3, 3, 3, '5432109876543', '1949-06-08'),
('Harry Potter and the Sorcerer\'s Stone', 4, 4, 4, '4567891230987', '1997-06-26'),
('Pride and Prejudice', 5, 5, 5, '6789012345678', '1813-01-28'),
('The Adventures of Tom Sawyer', 6, 6, 6, '7890123456789', '1876-06-01'),
('The Old Man and the Sea', 7, 7, 7, '8901234567890', '1952-09-01'),
('Hamlet', 8, 8, 1, '3456789012345', '1603-01-01'),
('A Tale of Two Cities', 9, 9, 1, '2345678901234', '1859-04-30'),
('War and Peace', 10, 10, 8, '0123456789012', '1869-01-01'),
('Murder on the Orient Express', 11, 11, 3, '9012345678901', '1934-01-01'),
('Sherlock Holmes: The Complete Collection', 12, 12, 3, '5678901234567', '1892-01-01'),
('Mrs. Dalloway', 13, 13, 9, '0987654321234', '1925-05-14'),
('The Grapes of Wrath', 14, 14, 9, '8765432109876', '1939-04-14'),
('Wuthering Heights', 15, 15, 2, '3456789010987', '1847-12-01');

CREATE TABLE members (
    member_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL, 
    email VARCHAR(255) UNIQUE, 
    phone_number VARCHAR(15), 
    registration_date DATE
);

INSERT INTO members (name, email, phone_number, registration_date) 
VALUES 
('John Doe', 'johndoe@example.com', '123-456-7890', '2025-01-15'),
('Jane Smith', 'janesmith@example.com', '098-765-4321', '2025-02-20'),
('Robert Brown', 'robertbrown@example.com', '555-123-4567', '2025-03-12'),
('Emily Davis', 'emilydavis@example.com', '456-789-0123', '2025-04-01'),
('Robert Brown', 'robertbrown@example.com', '555-123-4567', '2025-02-15'),
('Sophia Williams', 'sophiawilliams@example.com', '789-456-1230', '2025-03-22'),
('Liam Johnson', 'liamjohnson@example.com', '321-654-9870', '2025-01-30'),
('Olivia Martinez', 'oliviamartinez@example.com', '654-321-0987', '2025-04-10'),
('James Anderson', 'jamesanderson@example.com', '987-012-3456', '2025-03-05'),
('Charlotte Wilson', 'charlottewilson@example.com', '012-345-6789', '2025-02-25'),
('Ethan Taylor', 'ethantaylor@example.com', '456-789-1234', '2025-03-19'),
('Isabella Moore', 'isabellamoore@example.com', '789-123-4567', '2025-04-03'),
('Benjamin Lee', 'benjaminlee@example.com', '123-456-0987', '2025-02-18'),
('Amelia Harris', 'ameliaharris@example.com', '654-789-3210', '2025-03-28'),
('Mason Clark', 'masonclark@example.com', '345-678-9012', '2025-04-12'),
('Mia Young', 'miayoung@example.com', '567-890-1234', '2025-01-10'),
('Lucas King', 'lucasking@example.com', '890-123-4567', '2025-02-05');
