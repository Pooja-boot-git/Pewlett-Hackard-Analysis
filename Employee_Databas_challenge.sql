-- START DELIVERABLE 1 --- Return titles of all employees meeting retirement criteria
SELECT 
		emp.emp_no,
	    emp.first_name,
		emp.last_name,
		t.title,
		t.from_date,
		t.to_date
INTO retirement_titles
FROM employees AS emp
INNER JOIN Titles AS t
ON emp.emp_no = t.emp_no
WHERE birth_date between '1952-01-01' AND '1955-12-31'
ORDER BY emp.emp_no,
		t.to_date DESC
;

-- Get the most recent titles of retiring employees
SELECT DISTINCT ON (emp_no)
		emp_no,
	    first_name,
		last_name,
		title
INTO unique_titles
FROM retirement_titles 
ORDER BY emp_no,
		to_date DESC
;

-- Get count of retiring employees for each title
SELECT COUNT(title),title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY COUNT(title) DESC;

-- END DELIVERABLE 1 --------

-- START DELIVERABLE 2 - get employees who are eligible to participate in a mentorship program.

SELECT  DISTINCT ON(t.emp_no)
		emp.emp_no,
		emp.first_name,
		emp.last_name,
		emp.birth_date,
		de.from_date,
		de.to_date,
		t.title
INTO mentorship_eligibilty
FROM employees AS emp
INNER JOIN dept_employees as de
ON emp.emp_no = de.emp_no
INNER JOIN titles t
ON emp.emp_no = t.emp_no
WHERE birth_date between '1965-01-01' AND '1965-12-31'
ORDER BY t.emp_no , t.to_date desc;

-- END DELIVERABLE 2 -----------





		
		

