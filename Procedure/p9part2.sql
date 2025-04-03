CREATE PROCEDURE p1_ins_loc(p_lid NUMBER, p_city VARCHAR2)
IS
	v_city VARCHAR2(30); v_dname VARCHAR2(30);
BEGIN
	DBMS_OUTPUT.PUT_LINE('Main Procedure p1_ins_loc');
	
	INSERT INTO locations (location_id, city) VALUES (p_lid, p_city);
	
	SELECT city INTO v_city FROM locations WHERE location_id = p_lid;
	
	DBMS_OUTPUT.PUT_LINE('Inserted city '||v_city);
	DBMS_OUTPUT.PUT_LINE('Invoking the procedure p2_ins_dept ...');
	p2_ins_dept(p_lid);

EXCEPTION
	WHEN NO_DATA_FOUND THEN
	 DBMS_OUTPUT.PUT_LINE('No such dept/loc for any employee');
END;
/
