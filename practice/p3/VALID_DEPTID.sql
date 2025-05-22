CREATE OR REPLACE FUNCTION valid_deptid (
    p_dept_id IN departments.department_id%TYPE
) RETURN BOOLEAN IS
    v_dummy NUMBER;
BEGIN
    SELECT 1 INTO v_dummy
    FROM departments
    WHERE department_id = p_dept_id;

    RETURN TRUE;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN FALSE;
END;
/

