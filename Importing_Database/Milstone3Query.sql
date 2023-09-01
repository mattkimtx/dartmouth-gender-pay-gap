# Selecting for top 5 money making men
SELECT e.gender, q.seniority, (s.base_pay + s.bonus_pay) as total_salary
FROM Employee e
INNER JOIN Qualities q ON e.ql_id = q.ql_id
INNER JOIN Salary s ON e.sl_id = s.sl_id
where e.gender = 'Male'
order by total_salary desc
LIMIT 5;

# Selecting for top 5 money making women
SELECT e.gender, q.seniority, (s.base_pay + s.bonus_pay) as total_salary
FROM Employee e
INNER JOIN Qualities q ON e.ql_id = q.ql_id
INNER JOIN Salary s ON e.sl_id = s.sl_id
where e.gender = 'Female'
order by total_salary desc
LIMIT 5;