### Matthew Kim
### Question Queries

use gender_pay_gap;

SELECT AVG(Base + Bonus) AS Salary from Employees where Job = "Drive";

SELECT Education, Gender, Round(AVG(Base+Bonus),2) As Salary
from Employees 
group by Education, Gender;

SELECT Seniority, Gender, Round(AVG(Base+Bonus),2) As Salary
from Employees 
group by Seniority, Gender;

SELECT Performance, Gender, Round(AVG(Base+Bonus),2) As Salary
from Employees 
group by Performance, Gender;