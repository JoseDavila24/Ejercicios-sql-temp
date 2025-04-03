CREATE PROCEDURE p2_noexcep(p_locid NUMBER) IS
	v_did NUMBER(4);
BEGIN
	DBMS_OUTPUT.PUT_LINE('Procedure p2_noexcep started');
	INSERT INTO departments VALUES (6, 'Dept 6', 145, p_locid);
	SELECT department_id INTO v_did FROM employees
		WHERE employee_id = 999;
END;
/
