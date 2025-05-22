CREATE OR REPLACE PROCEDURE upd_emp_sal (
    p_job_id       IN jobs.job_id%TYPE,
    p_new_min_sal  IN jobs.min_salary%TYPE
) IS
BEGIN
    UPDATE employees
    SET salary = p_new_min_sal
    WHERE job_id = p_job_id AND salary < p_new_min_sal;

    DBMS_OUTPUT.PUT_LINE('Employees updated where salary < ' || p_new_min_sal);
END;
/

