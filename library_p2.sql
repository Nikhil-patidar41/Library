--create database libr_p2
--CREATING BRANCH TABLE
DROP TABLE IF EXISTS BRANCH;
CREATE TABLE  BRANCH  (
         branch_id	NVARCHAR(200) PRIMARY KEY,
         manager_id	 NVARCHAR(100),
         branch_address	NVARCHAR(100),
         contact_no  NVARCHAR(100)

		 )
--CREATE EMPLOY TABLE
DROP TABLE IF EXISTS EMPLOYEES;
CREATE TABLE EMPLOYEES (
                 emp_id	 nVARCHAR(200) PRIMARY KEY,
				 emp_name NVARCHAR(200),
				 position  NVARCHAR(200),
				 salary	    INT,
				 branch_id   NVARCHAR(200) --fk
				 )

 --CREATE TABLE BOOKS
DROP TABLE IF EXISTS BOOKS;
CREATE TABLE BOOKS(
                     isbn  NVARCHAR(200) PRIMARY KEY,
					 book_title	NVARCHAR(200),
					 category   NVARCHAR(200),
					 rental_price    DECIMAL(9,2),
					 status    NVARCHAR(200),
					 author	    nvarchar(200),
					 publisher   varchar(200)
           		)

--CREATE TABLE FOR MEMBERS
DROP TABLE IF EXISTS MEMBERS;
CREATE TABLE MEMBERS(
                  member_id	 NVARCHAR(200) PRIMARY KEY,
				  member_name   VARCHAR(200),
				  member_address NVARCHAR(200),
				  reg_date   DATE
				  )

--CREATE TABLE BOOK ISSUE
DROP TABLE IF EXISTS ISSUED_STATUS
CREATE TABLE  ISSUED_STATUS(
                      issued_id   NVARCHAR(200) PRIMARY KEY,
					  issued_member_id	NVARCHAR(200), --fk
					  issued_book_name	NVARCHAR(MAX),
					  issued_date       DATE,
					  issued_book_isbn   NVARCHAR(200),--fk
					  issued_emp_id      nVARCHAR(200)--fk
					  )


--create table return ststus
drop table if exists return_status 
create table return_status(
                        return_id	 nvarchar(200)primary key,
						issued_id	nvarchar(200),
						return_book_name	nvarchar(200),
						return_date     date,
						return_book_isbn  nvarchar(200)
)

--FORIGAN KEY
alter table issued_status
add constraint fk_member
foreign key(issued_member_id)references members(member_id);

alter table issued_status
add constraint fk_books
foreign key(issued_book_isbn)references books(isbn);


alter table issued_status
add constraint fk_employees
foreign key(issued_emp_id) references employees(emp_id);

alter table employees
add constraint fk_branch
foreign key (branch_id) references branch(branch_id);

alter table return_status
add constraint fk_return_ststus
foreign key (issued_id) references issued_status(issued_id);
