CREATE DATABASE LibraryDB2;
USE LibraryDB2;

CREATE TABLE Authors (
    author_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    birth_year INT
);

CREATE TABLE Categories (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE Books (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    published_year INT,
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

CREATE TABLE BookAuthors (
    book_id INT,
    author_id INT,
    PRIMARY KEY (book_id, author_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

CREATE TABLE Members (
    member_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    join_date DATE
);

CREATE TABLE BorrowRecords (
    record_id INT PRIMARY KEY AUTO_INCREMENT,
    book_id INT,
    member_id INT,
    borrow_date DATE NOT NULL,
    return_date DATE,
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (member_id) REFERENCES Members(member_id)
);

INSERT INTO Authors (name, birth_year) VALUES
('J.K. Rowling', 1965),
('George Orwell', 1903),
('Author Unknown', NULL);

INSERT INTO Categories (name) VALUES
('Fiction'),
('Science Fiction'),
('Mystery');

INSERT INTO Books (title, published_year, category_id) VALUES
('Harry Potter and the Philosopher\'s Stone', 1997, 1),
('1984', 1949, 2),
('Unknown Book', NULL, 3);

INSERT INTO BookAuthors (book_id, author_id) VALUES
(1, 1),
(2, 2),
(3, 3);

INSERT INTO Members (name, join_date) VALUES
('Shruti', '2023-01-15'),
('Ankit', '2023-06-10'),
('Harshit', NULL);

INSERT INTO BorrowRecords (book_id, member_id, borrow_date, return_date) VALUES
(1, 1, '2023-07-01', '2023-07-15'),
(2, 2, '2023-07-05', NULL),
(3, 3, '2023-07-10', '2023-07-20');

UPDATE Books
SET published_year = 2000
WHERE book_id=3;

SELECT * FROM Members WHERE join_date IS NULL;
UPDATE Members
SET join_date = '2023-01-01'
WHERE member_id = 3;

SELECT * FROM BorrowRecords WHERE return_date IS NULL;
DELETE FROM BorrowRecords WHERE record_id = 2;

DELETE FROM BookAuthors
WHERE author_id = 3;

DELETE FROM Authors
WHERE author_id = 3;

SELECT * FROM Authors;
SELECT title, published_year FROM Books;

SELECT * FROM Members
WHERE join_date > '2023-01-01'
   OR join_date IS NULL;

SELECT * FROM Books
WHERE published_year BETWEEN 1950 AND 2000;

SELECT * FROM Members
WHERE name LIKE 'A%' OR name LIKE 'B%';

SELECT * FROM BorrowRecords
ORDER BY borrow_date DESC;

SELECT * FROM BorrowRecords
ORDER BY borrow_date DESC
LIMIT 2;

SELECT * FROM Books
WHERE title LIKE '%Harry%' OR title LIKE '%1984%';

SELECT COUNT(*) AS total_classic_books
FROM Books
WHERE published_year BETWEEN 1900 AND 2000;

