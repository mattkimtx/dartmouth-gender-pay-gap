### Matthew Kim
### Question Queries

use gender_pay_gap;

SELECT AVG(Base + Bonus) AS Salary from Employees where Job = "Drive";

SELECT Education, Gender, (Base+Bonus) As Salary
from Employees 
group by Education;