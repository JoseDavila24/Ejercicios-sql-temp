CREATE OR REPLACE PROCEDURE raise_salary
	(p_id IN employees2.employee_id%TYPE)
IS
BEGIN
	UPDATE employees2
	SET salary = salary * 1.10
WHERE employee_id = p_id;
END raise_salary;
/
