Use gender_pay_gap;

SELECT * FROM gender_pay_gap.`glassdoor gender pay gap`;

Select DISTINCT PerfEval, Education, Seniority from gender_pay_gap.`glassdoor gender pay gap`;

INSERT INTO Qualities (education, perf_score, seniority)
Select DISTINCT Education, PerfEval, Seniority from gender_pay_gap.`glassdoor gender pay gap`;

Select * from Qualities
order by education desc;


