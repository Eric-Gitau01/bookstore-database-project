
-- Create an admin user (full access)
CREATE USER 'bookstore_admin'@'localhost' IDENTIFIED BY 'admin_password';
GRANT ALL PRIVILEGES ON bookstore.* TO 'bookstore_admin'@'localhost';

-- Create a read-only user (for reports)
CREATE USER 'bookstore_report'@'localhost' IDENTIFIED BY 'report_password';
GRANT SELECT ON bookstore.* TO 'bookstore_report'@'localhost';

-- Create an order processing user
CREATE USER 'bookstore_order'@'localhost' IDENTIFIED BY 'order_password';
GRANT SELECT, INSERT, UPDATE ON bookstore.cust_order TO 'bookstore_order'@'localhost';
GRANT SELECT, INSERT, UPDATE ON bookstore.order_line TO 'bookstore_order'@'localhost';
GRANT SELECT, INSERT, UPDATE ON bookstore.order_history TO 'bookstore_order'@'localhost';
GRANT SELECT ON bookstore.* TO 'bookstore_order'@'localhost';