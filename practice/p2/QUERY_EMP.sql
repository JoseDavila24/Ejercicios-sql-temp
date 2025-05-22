CREATE OR REPLACE PROCEDURE query_emp (
    p_emp_id    IN  employees.employee_id%TYPE,
    p_salary    OUT employees.salary%TYPE,
    p_job_id    OUT employees.job_id%TYPE
) IS
BEGIN
    SELECT salary, job_id
    INTO p_salary, p_job_id
    FROM employees
    WHERE employee_id = p_emp_id;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Employee not found with ID ' || p_emp_id);
        p_salary := NULL;
        p_job_id := NULL;
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Query error: ' || SQLERRM);
END;
/

