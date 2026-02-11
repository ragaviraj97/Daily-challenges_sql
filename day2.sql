CREATE DATABASE online_bookstore;
USE online_bookstore;

USE online_bookstore;

CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    Title VARCHAR(100) NOT NULL,
    Author VARCHAR(50) NOT NULL,
    ISBN VARCHAR(20) UNIQUE,
    Price DECIMAL(8,2)
);
ALTER TABLE Books
ADD CONSTRAINT chk_price CHECK (Price > 0);


DROP TABLE IF EXISTS orders;
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    BookID INT,
    OrderDate DATE NOT NULL,
    Quantity INT,
    CONSTRAINT fk_book
        FOREIGN KEY (BookID)
        REFERENCES Books(BookID),
    CONSTRAINT chk_quantity
        CHECK (Quantity > 0)
        );
   
   
    
    







