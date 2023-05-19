EXP 6 and 8 

create database shauryafinal;
use shauryafinal;
CREATE TABLE Sailors (
  sid INT PRIMARY KEY,
  sname VARCHAR(255),
  rating INT,
  age INT
);
CREATE TABLE Boats (
  bid INT PRIMARY KEY,
  bname VARCHAR(255),
  color VARCHAR(255)
);
CREATE TABLE Reserves (
  sid INT,
  bid INT,
  day DATE,
  FOREIGN KEY (sid) REFERENCES Sailors(sid),
  FOREIGN KEY (bid) REFERENCES Boats(bid)
);


INSERT INTO Sailors (sid, sname, rating, age)
VALUES (1, 'John', 8, 25),
       (2, 'Mary', 7, 28),
       (3, 'David', 5, 22),
       (4, 'Sarah', 6, 24),
       (5, 'Michael', 9, 30);

INSERT INTO Boats (bid, bname, color)
VALUES (101, 'Boat1', 'Red'),
       (102, 'Boat2', 'Blue'),
       (103, 'Boat3', 'Green'),
       (104, 'Boat4', 'Yellow'),
       (105, 'Boat5', 'White');
       
       
INSERT INTO Reserves (sid, bid, day)
VALUES (1, 101, '2023-05-01'),
       (2, 102, '2023-05-02'),
       (3, 103, '2023-05-01'),
       (4, 104, '2023-05-03'),
       (5, 105, '2023-05-02');
       
       
select * from Sailors join Reserves 
on Sailors.sid = Reserves.sid where Reserves.bid=101; 


select Boats.bname from 
Sailors join Reserves on Sailors.sid=Reserves.sid 
join Boats on Boats.bid=Reserves.bid 
where Sailors.sname='John';

select Sailors.sname from 
Sailors join Reserves on Sailors.sid=Reserves.sid 
join Boats on Boats.bid=Reserves.bid 
where Boats.color='Red' order by Sailors.age;


select distinct Sailors.sname from 
Sailors join Reserves on Sailors.sid=Reserves.sid 
join Boats on Boats.bid=Reserves.bid ;

-- Find the ids and names of sailors who have reserved two different boats on the same day.

SELECT Sailors.sid, Sailors.sname
FROM Sailors
JOIN Reserves r1 ON Sailors.sid = r1.sid 
JOIN Reserves r2 ON Sailors.sid = r2.sid
WHERE r1.day = r2.day AND r1.bid <> r2.bid;

SELECT DISTINCT S.sid, S.sname
FROM Sailors S, Reserves R1, Reserves R2
WHERE S.sid = R1.sid AND S.sid = R2.sid
AND R1.day = R2.day AND R1.bid <> R2.bid;

select * from Reserves;

select Sailors.sid from 
Sailors join Reserves on Sailors.sid=Reserves.sid 
join Boats on Boats.bid=Reserves.bid 
where Boats.color in ('red','green');

SELECT Sailors.rating, AVG(Sailors.age) AS average_age
FROM Sailors
GROUP BY Sailors.rating
HAVING COUNT(*) >= 2;



EXP 7:- 


2. SELECT * FROM EMPLOYEE WHERE Salary > (SELECT MAX(Salary) FROM EMPLOYEE WHERE Designation = 'IT PROFF');

3. SELECT * FROM EMPLOYEE WHERE YEAR(Joined_date) > 1981 ORDER BY Designation ASC;

4. SELECT * FROM EMPLOYEE WHERE Designation IN ('CLERK', 'ANALYST');

5. SELECT E_name, LEFT(E_name, 5) AS Short_Name FROM EMPLOYEE WHERE E_name LIKE 'H%';

6. SELECT * FROM EMPLOYEE WHERE Designation NOT IN ('PRESIDENT', 'MGR') ORDER BY Salary ASC;

