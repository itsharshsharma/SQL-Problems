CREATE TABLE testing (
    ID INT,
    First_name varchar(255),
    Last_name varchar(255),
    Department varchar(255),
    Salary INT
);

LOAD DATA INFILE "C:\Users\harsh\Desktop\teset.csv"
INTO TABLE testing FIELDS TERMINATED BY ","
(ID, First_name, Last_name, Department, Salary);