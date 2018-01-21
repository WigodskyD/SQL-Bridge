drop table if exists Employees;
drop table if exists Department_Assignments;
drop table if exists Departments;
drop table if exists Rooms;
#--------------------------------------------------------------------------------
create table Rooms
(RoomID smallint auto_increment primary key not null,
Room varchar (40) null);

INSERT INTO Rooms values(RoomID, 101);
INSERT INTO Rooms values(RoomID, 102);
INSERT INTO Rooms values(RoomID, 'Auditorium A');
INSERT INTO Rooms values(RoomID, 'Auditorium B');
#--------------------------------------------------------------------------------
create table Departments
(DepartmentID smallint auto_increment primary key not null,
Department_Name varchar (35) NULL);

INSERT INTO Departments values(DepartmentID, 'I.T.');
INSERT INTO Departments values(DepartmentID, 'Sales');
INSERT INTO Departments values(DepartmentID, 'Administration');
INSERT INTO Departments values(DepartmentID, 'Operations');
#--------------------------------------------------------------------------------
create table Department_Assignments
(AssignmentID smallint auto_increment primary key not null,
DepartmentID smallint null,
RoomID smallint null,
constraint foreign key (DepartmentID)
references Departments (DepartmentID),
constraint foreign key (RoomID)
references Rooms (RoomID));

INSERT INTO Department_Assignments values(AssignmentID, 1, 1);
INSERT INTO Department_Assignments values(AssignmentID, 1, 2);
INSERT INTO Department_Assignments values(AssignmentID, 2, 2);
INSERT INTO Department_Assignments values(AssignmentID, 2, 3);
#--------------------------------------------------------------------------------
create table Employees
(Employee_Name varchar (40) null,
DepartmentID smallint null, 
constraint foreign key (DepartmentID)
references Departments (DepartmentID));

INSERT INTO Employees values('Modesto', 1);
INSERT INTO Employees values('Ayine', 1);
INSERT INTO Employees values('Christopher', 2);
INSERT INTO Employees values('Cheong woo', 2);
INSERT INTO Employees values('Saulat', 3);
INSERT INTO Employees values('Heidy',null);
#--------------------------------------------------------------------------------
#select * from Rooms;
#select * from Department_Assignments;
#select * from Departments;
#select * from Employees;

select
d.Department_Name,
e.Employee_Name
from Departments as d
left join Employees as e
on d.DepartmentID = e.DepartmentID;

select
r.Room,
d.Department_Name
from Rooms as r
left join Department_Assignments as da
on r.RoomID = da.RoomID
left join Departments as d
on da.DepartmentID = d.DepartmentID;

select
e.Employee_Name,
d.Department_Name,
r.room
from Rooms as r
left join Department_Assignments as da
on r.RoomID = da.RoomID
right join Departments as d
on da.DepartmentID = d.DepartmentID
right join Employees as e
on d.DepartmentID = e.DepartmentID
order by e.Employee_Name, d.Department_Name, r.room;

