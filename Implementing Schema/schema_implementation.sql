use gender_pay_gap;

create table Salary (
	sl_id int auto_increment,
    base_pay int,
    bonus_pay int,
    primary key (sl_id)
    );

create table Qualities (
	ql_id int auto_increment,
    education varchar(45),
    perf_score int,
    seniority int,
	primary key (ql_id)
    );

CREATE TABLE Employee (
	ep_id int auto_increment,
    sl_id int,
    ql_id int,
    job_name varchar(45),
    dept_name varchar(45),
    gender varchar(45),
    age int,
	primary key(ep_id),
	CONSTRAINT Employee_fk_Salary
		FOREIGN KEY (sl_id)
        REFERENCES Salary(sl_id),
	CONSTRAINT Employee_fk_Qualities
		FOREIGN KEY (ql_id)
        REFERENCES Qualities(ql_id)
    );
    
SELECT * from Salary;
SELECT * from Qualities;
SELECT * from Employee;

drop table Salary;
drop table Qualities;
drop tables Employee;