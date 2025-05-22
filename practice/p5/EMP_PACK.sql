CREATE OR REPLACE PACKAGE emp_pack IS
    PROCEDURE new_emp (
        p_last_name    IN employees.last_name%TYPE,
        p_first_name   IN employees.first_name%TYPE,
        p_email        IN employees.email%TYPE,
        p_salary       IN employees.salary%TYPE         DEFAULT 1000,
        p_commission   IN employees.commission_pct%TYPE DEFAULT 0,
        p_department   IN employees.department_id%TYPE  DEFAULT 30,
        p_job          IN employees.job_id%TYPE         DEFAULT 'SA_REP',
        p_manager_id   IN employees.manager_id%TYPE     DEFAULT 145
    );
END emp_pack;
/

