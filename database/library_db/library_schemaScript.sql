-- Database Schema Overview
-- This database schema is designed for a library system.
-- It includes three tables: Books, Members, and Loans.
-- The Books table stores information about the books available in the library.
-- The Members table stores information about the library members.
-- The Loans table tracks the books borrowed by members, including loan dates and return dates.
-- Foreign key constraints are used to maintain referential integrity between the tables.



-- Create Books Table
-- This table stores information about the books in the library.
-- Design principles based on Vidhya, Jeyaram, & Ishwarya (2016, p. 278)
CREATE TABLE Books (
    BookID VARCHAR(20) PRIMARY KEY,
    Title VARCHAR(300) NOT NULL,
    Author VARCHAR(80) NOT NULL,
    ISBN VARCHAR(13) NOT NULL UNIQUE,
    Genre VARCHAR(30),
    Quantity INT NOT NULL
);

-- Create Members Table
-- This table stores information about the library members.
-- Design principles based on Din (2006, p. 131).
CREATE TABLE Members (
    MemberID VARCHAR(20) PRIMARY KEY,
    MemberName VARCHAR(80) NOT NULL,
    Email VARCHAR(150),
    Phone VARCHAR(20)
);

-- Create Loans Table
-- This table tracks the books borrowed by members.
-- Design principles based on Pedersen (n.d., p. 131).
CREATE TABLE Loans (
    LoanID VARCHAR(10) PRIMARY KEY,
    MemberID VARCHAR(20),
    BookID VARCHAR(20),
    ISBN VARCHAR(13),
    LoanDate DATE NOT NULL,
    ReturnDate DATE,
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID) ON DELETE CASCADE,
    FOREIGN KEY (ISBN) REFERENCES Books(ISBN),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);

-- Insert Data into Books
-- These statements add initial data to the Books table.
-- Based on SQL DML operations described by Sharma et al. (2010, p. 202).
INSERT INTO Books (BookID, Title, Author, ISBN, Genre, Quantity)
VALUES 
('B001', 'The Beautiful Village in Heaven', 'Becky Li', '9460862168870', 'Fiction', 20),
('B002', 'Charlottes Web', 'E.B. White', '9780061124952', 'Childrens Fiction', 40),
('B003', 'The Cat in the Hat', 'Dr. Seuss', '9780394800011', 'Childrens Fiction', 35),
('B004', 'Goodnight Moon', 'Margaret Wise Brown', '9780060775858', 'Childrens Fiction', 45),
('B005', 'Where the Wild Things Are', 'Maurice Sendak', '9780060254926', 'Childrens Fiction', 30);

-- Insert Data into Members
-- These statements add initial data to the Members table.
-- Based on SQL DML operations described by Sharma et al. (2010, p. 202).
INSERT INTO Members (MemberID, MemberName, Email, Phone)
VALUES 
('M001', 'Sandra Kent', 'sandra.kent@email.com', '+13401010101'),
('M002', 'George Stone', 'george.stone@email.com', '+13401020202'),
('M003', 'Lara Clark', 'Lara.clark@email.com', '+13401030303'),
('M004', 'Michael Smith', 'michael.smith@email.com', '+13401040404'),
('M005', 'Leonard Green', 'leonard.green@email.com', '+13401050505');

-- Insert Data into Loans
-- These statements add initial data to the Loans table.
-- Based on SQL DML operations described by Sharma et al. (2010, p. 202).
INSERT INTO Loans (LoanID, MemberID, BookID, ISBN, LoanDate, ReturnDate)
VALUES 
('L001', 'M001', 'B001', '9460862168870', '2024-07-15', NULL),
('L002', 'M002', 'B002', '9780061124952', '2024-07-14', '2024-07-21'),
('L003', 'M003', 'B003', '9780394800011', '2024-07-13', NULL),
('L004', 'M004', 'B004', '9780060775858', '2024-07-12', '2024-07-19'),
('L005', 'M005', 'B005', '9780060254926', '2024-07-11', '2024-07-18');

-- Retrieve all information about books borrowed by a specific member
-- This query fetches details of all books borrowed by member 'M002'.
-- Based on JOIN operations discussed by Watt & Eng (2014, p. 153).
SELECT 
    Loans.LoanID,
    Members.MemberID,
    Members.MemberName,
    Books.BookID,
    Books.Title,
    Books.Author,
    Books.ISBN,
    Books.Genre,
    Books.Quantity,
    Loans.LoanDate,
    Loans.ReturnDate
FROM Loans
JOIN Members ON Loans.MemberID = Members.MemberID
JOIN Books ON Loans.BookID = Books.BookID
WHERE Members.MemberID = 'M002';

-- Update the quantity of a particular book in the Books table
-- This statement updates the quantity of the book with BookID 'B001'.
-- Based on SQL DML operations described by Watt & Eng (2014, p. 202).
UPDATE Books
SET Quantity = 25
WHERE BookID = 'B002';

-- Delete a member record from the Members table
-- This statement deletes the member with MemberID 'M002'.
-- Related loan records will be deleted automatically due to ON DELETE CASCADE.
-- Based on SQL DML operations described by Watt & Eng (2014, p. 202).
DELETE FROM Members
WHERE MemberID = 'M002';


References:
Vidhya, V., Jeyaram, G., & Ishwarya, K. (2016). Database management systems. Alpha Science International.
Din, A. I. (2006). Structured Query Language (SQL): A practical introduction. NCC Blackwell.
Pedersen, A. A. (n.d.). Entity relationship modeling - Principles.
Sharma, N., Perniu, L., Chong, R. F., Iyer, A., Nandan, C., Mitea, A. C., Nonvinkere, M., & Danubianu, M. (2010). Databases fundamentals.
Watt, A., & Eng, N. (2014). Database design, 2nd ed. BCcampus, BC Open Textbook Project. Retrieved from https://opentextbc.ca/dbdesign01/.
