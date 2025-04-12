-- adding some language
INSERT INTO book_language (language_code, language_name) VALUES 
('EN', 'English'),
('KS', 'Swahili'),
('FR', 'French');

-- adding publisher
INSERT INTO publisher (publisher_name) VALUES 
('Penguin Random House'),
('HarperCollins'),
('Simon & Schuster');

-- adding some author
-- INSERT INTO author (author_name) VALUES 
('J.K. Zeblon'),
('Gerrad King'),
('Maingi Stephen');

-- adding some books
INSERT INTO book (title, isbn, num_pages, publication_date, publisher_id, language_id) VALUES 
('Harry Potter and the Philosopher''s Stone', '9780747532743', 223, '1997-06-26', 1, 1),
('Tumbo Lisiloshiba', '9780307743657', 447, '1977-01-28', 2, 1),
('Murder on the Orient Express', '9780062073501', 256, '1934-01-01', 3, 1);

-- Linking books to authors
INSERT INTO book_author (book_id, author_id) VALUES 
(1, 1),
(2, 2),
(3, 3);