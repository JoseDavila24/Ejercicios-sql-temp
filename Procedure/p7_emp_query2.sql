CREATE OR REPLACE PROCEDURE leave_emp2
	(p_id IN employees2.employee_id%TYPE)
IS
	PROCEDURE log_exec
	IS
	BEGIN
		INSERT INTO log_table (user_id, log_date)
		VALUES (USER, SYSDATE);
	END log_exec;
BEGIN
	DELETE FROM employees2
	WHERE employee_id = p_id;
	log_exec;
END leave_emp2;
/
