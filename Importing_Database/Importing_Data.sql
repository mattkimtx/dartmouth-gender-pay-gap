Use gender_pay_gap;

SELECT * FROM gender_pay_gap.`glassdoor gender pay gap`;

Select DISTINCT PerfEval, Education, Seniority from gender_pay_gap.`glassdoor gender pay gap`;

INSERT INTO Qualities (education, perf_score, seniority)
Select DISTINCT Education, PerfEval, Seniority from gender_pay_gap.`glassdoor gender pay gap`;

Select * from Qualities
order by education desc;

-- drop table Salary;
-- drop table Employee;

INSERT INTO Salary (base_pay, bonus_pay)
SELECT DISTINCT BasePay, Bonus from gender_pay_gap.`glassdoor gender pay gap`;

INSERT INTO Employee (sl_id, ql_id, job_name, dept_name, gender, age)
SELECT 
	(SELECT DISTINCT sl_id 
		from Salary 
		where base_pay = file.BasePay 
			AND bonus_pay = file.Bonus),
	(SELECT DISTINCT ql_id 
		from Qualities
		where education = file.Education 
			AND perf_score = file.PerfEval
            AND seniority = file.Seniority),
	JobTitle, Dept, Gender, Age
FROM gender_pay_gap.`glassdoor gender pay gap` file;

SELECT * from Employee;