# library_db Schema

Library Database Schema

Overview

This database schema is designed for a library system and includes three main tables: Books, Members, and Loans. These tables store information about the library's books, its members, and the loans of books to members, respectively. Foreign key constraints are used to maintain referential integrity between the tables.

Tables

Books

The Books table stores information about the books available in the library. It includes the following columns:

CREATE TABLE Books (

	    BookID VARCHAR(20) PRIMARY KEY,
	    
	    Title VARCHAR(300) NOT NULL,
	    
	    Author VARCHAR(80) NOT NULL,
	    
	    ISBN VARCHAR(13) NOT NULL UNIQUE,
	    
	    Genre VARCHAR(30),
	    
	    Quantity INT NOT NULL
	    
	);

Members

The Members table stores information about the library members. It includes the following columns:

	MemberID: A unique identifier for each member (Primary Key).
	
	MemberName: The name of the member.
	
	Email: The email address of the member.
	
	Phone: The phone number of the member.


CREATE TABLE Members (

	    MemberID VARCHAR(20) PRIMARY KEY,
	    
	    MemberName VARCHAR(80) NOT NULL,
	    
	    Email VARCHAR(150),
	    
	    Phone VARCHAR(20)
	    
	);

Loans

The Loans table tracks the books borrowed by members, including loan dates and return dates. It includes the following columns:

	LoanID: A unique identifier for each loan (Primary Key).
	
	MemberID: The identifier of the member who borrowed the book (Foreign Key).
	
	BookID: The identifier of the borrowed book (Foreign Key).
	
	ISBN: The ISBN of the borrowed book (Foreign Key).
	
	LoanDate: The date the book was borrowed.
	
	ReturnDate: The date the book was returned.


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

 Author:

 	Liliane Lukong


 License:

	MIT
