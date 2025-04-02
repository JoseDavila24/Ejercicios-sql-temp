CREATE PROCEDURE p2_ins_dept(p_locid NUMBER) IS
	v_did NUMBER(4);
BEGIN
	DBMS_OUTPUT.PUT_LINE('Procedure p2_ins_dept started');
	INSERT INTO departments VALUES (5, 'Dept 5', 145, p_locid);
	SELECT department_id INTO v_did FROM employees2
	WHERE employee_id = 999;
END;
/
