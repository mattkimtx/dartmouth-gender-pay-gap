### Matthew Kim
### Importing and Uploading Data

use gender_pay_gap;

### Creating Table

create table Employees (
	ep_id int auto_increment,
    Job varchar(45),
	Gender varchar(45),
	Age int,
    Performance int,
	Education varchar(45),
    Department varchar(45),
    Seniority int,
    Base int,
    Bonus int,
    primary key (ep_id)
    );
    
### Inserting

INSERT INTO Employees (Job, Gender, Age, Performance, Education, Department, Seniority, Base, Bonus)
Select JobTitle, Gender, Age, PerfEval, Education, Dept, Seniority, BasePay, Bonus from glassdoor;

