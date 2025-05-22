CREATE OR REPLACE PROCEDURE new_emp (
    p_last_name    IN employees.last_name%TYPE,
    p_first_name   IN employees.first_name%TYPE,
    p_email        IN employees.email%TYPE,
    p_salary       IN employees.salary%TYPE         DEFAULT 1000,
    p_commission   IN employees.commission_pct%TYPE DEFAULT 0,
    p_department   IN employees.department_id%TYPE  DEFAULT 30,
    p_job          IN employees.job_id%TYPE         DEFAULT 'SA_REP',
    p_manager_id   IN employees.manager_id%TYPE     DEFAULT 145
) IS
    v_valid BOOLEAN;
BEGIN
    v_valid := valid_deptid(p_department);

    IF v_valid THEN
        INSERT INTO employees (
            employee_id, last_name, first_name, email,
            hire_date, job_id, salary, commission_pct,
            manager_id, department_id
        )
        VALUES (
            employees_seq.NEXTVAL, p_last_name, p_first_name, p_email,
            SYSDATE, p_job, p_salary, p_commission,
            p_manager_id, p_department
        );

        DBMS_OUTPUT.PUT_LINE('Employee ' || p_first_name || ' ' || p_last_name || ' inserted.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('ERROR: Department ID ' || p_department || ' does not exist.');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error inserting employee: ' || SQLERRM);
END;
/

