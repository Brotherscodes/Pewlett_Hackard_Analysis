-- Employee_Database_Challenge

SELECT e.emp_no, e.first_name, e.last_name, t.title, t.from_date, t.to_date
INTO retirement_titles
FROM employees AS e
INNER JOIN titles as t
	ON (e.emp_no = t.emp_no)
-- filter on birth_date:
WHERE (e.birth_date BETWEEN ('1951-01-01') AND ('1955-12-31'))
ORDER BY e.emp_no;


-- Starter Code:
-- Use Dictinct with Orderby to remove duplicate rows:
SELECT DISTINCT ON (rt.emp_no)rt.emp_no,
first_name,
last_name,
title
INTO Unique_titles
FROM retirement_titles AS rt
ORDER BY rt.emp_no, rt.to_date DESC;



-- Retrieve the number of title from the unique_titles table:
SELECT COUNT(ut.title),ut.title
INTO retiring_titles
FROM unique_titles AS ut
GROUP BY ut.title
ORDER BY COUNT DESC;

-- END OF DELIVERABLE 1:

--START OF DELIVERABLE 2:

-- Write a query to create a mentorship eligibility table that holds the EE's that are eligible:

SELECT DISTINCT ON (e.emp_no) e.emp_no, 
	e.first_name, 
	e.last_name, 
	e.birth_date, 
	de.from_date, 
	de.to_date,
	ti.title
INTO mentorship_eligibilty
FROM employees as e
INNER JOIN dept_emp AS de
	ON (e.emp_no=de.emp_no)
INNER JOIN titles as ti
	ON (e.emp_no = ti.emp_no)
-- FILTER ON THE TO_DATE TO GET CURRENT EE"S (9999-01-01)
WHERE DE.TO_DATE = '9999-01-01' 
AND e.birth_date BETWEEN '1965-01-01' AND '1965-12-31' 
ORDER BY e.emp_no





