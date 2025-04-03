CREATE PROCEDURE p1_noexcep(p_lid NUMBER, p_city VARCHAR2)
IS
	v_city VARCHAR2(30); v_dname VARCHAR2(30);
BEGIN
	DBMS_OUTPUT.PUT_LINE(' Main Procedure p1_noexcep');
	INSERT INTO locations (location_id, city) VALUES (p_lid, p_city);
	SELECT city INTO v_city FROM locations WHERE location_id = p_lid;
	DBMS_OUTPUT.PUT_LINE('Inserted new city '||v_city);
	DBMS_OUTPUT.PUT_LINE('Invoking the procedure p2_noexcep ...');
	p2_noexcep(p_lid);
END;
/
