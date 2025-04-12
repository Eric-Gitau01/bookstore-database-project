-- created the data base
CREATE DATABASE bookstore;

-- used the database that I used
USE bookstore;

-- create book_language table
CREATE TABLE book_language (
 language_id INT AUTO_INCREMENT PRIMARY KEY,
    language_code VARCHAR(8) NOT NULL,
    language_name VARCHAR(50) NOT NULL
);

-- created publisher table
CREATE TABLE publisher (
    publisher_id INT AUTO_INCREMENT PRIMARY KEY,
    publisher_name VARCHAR(100) NOT NULL
);

-- create country table
CREATE TABLE country (
    country_id INT AUTO_INCREMENT PRIMARY KEY,
    country_name VARCHAR(100) NOT NULL
);

-- created address_status
CREATE TABLE address_status (
    status_id INT AUTO_INCREMENT PRIMARY KEY,
    address_status VARCHAR(30) NOT NULL
);

-- created authors table
CREATE TABLE author (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    author_name VARCHAR(100) NOT NULL
);

-- create book table
CREATE TABLE book (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    isbn VARCHAR(20) UNIQUE NOT NULL,
    num_pages INT,
    publication_date DATE,
    publisher_id INT,
    language_id INT,
    FOREIGN KEY (publisher_id) REFERENCES publisher(publisher_id),
    FOREIGN KEY (language_id) REFERENCES book_language(language_id)
);

-- created book_author table
CREATE TABLE book_author (
    book_id INT NOT NULL,
    author_id INT NOT NULL,
    PRIMARY KEY (book_id, author_id),
    FOREIGN KEY (book_id) REFERENCES book(book_id),
    FOREIGN KEY (author_id) REFERENCES author(author_id)
);

-- create address table
CREATE TABLE address (
    address_id INT AUTO_INCREMENT PRIMARY KEY,
    street_number VARCHAR(10) NOT NULL,
    street_name VARCHAR(200) NOT NULL,
    city VARCHAR(100) NOT NULL,
    country_id INT NOT NULL,
    FOREIGN KEY (country_id) REFERENCES country(country_id)
);

-- create a customer table
CREATE TABLE customer (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

-- create customer_address
CREATE TABLE customer_address (
    customer_id INT NOT NULL,
    address_id INT NOT NULL,
    status_id INT NOT NULL,
    PRIMARY KEY (customer_id, address_id),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (address_id) REFERENCES address(address_id),
    FOREIGN KEY (status_id) REFERENCES address_status(status_id)
);

-- create shipping_method table
CREATE TABLE shipping_method (
    method_id INT AUTO_INCREMENT PRIMARY KEY,
    method_name VARCHAR(100) NOT NULL,
    cost DECIMAL(6,2) NOT NULL
);

-- create order_status table
CREATE TABLE order_status (
    status_id INT AUTO_INCREMENT PRIMARY KEY,
    status_value VARCHAR(20) NOT NULL
);

-- created cust_odered tabel
CREATE TABLE cust_order (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    order_date DATETIME NOT NULL,
    customer_id INT NOT NULL,
    shipping_method_id INT NOT NULL,
    dest_address_id INT NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (shipping_method_id) REFERENCES shipping_method(method_id),
    FOREIGN KEY (dest_address_id) REFERENCES address(address_id)
);

-- created order_line
CREATE TABLE order_line (
    line_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    book_id INT NOT NULL,
    price DECIMAL(5,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES cust_order(order_id),
    FOREIGN KEY (book_id) REFERENCES book(book_id)
);

-- created order_history table
CREATE TABLE order_history (
    history_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    status_id INT NOT NULL,
    status_date DATETIME NOT NULL,
    FOREIGN KEY (order_id) REFERENCES cust_order(order_id),
    FOREIGN KEY (status_id) REFERENCES order_status(status_id)
);