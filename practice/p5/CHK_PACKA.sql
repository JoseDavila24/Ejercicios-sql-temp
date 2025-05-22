CREATE OR REPLACE PACKAGE BODY chk_pack IS

    c_years_back CONSTANT NUMBER := 50;

    PROCEDURE chk_hiredate(p_hiredate IN DATE) IS
        v_today     DATE := TRUNC(SYSDATE);
        v_min_date  DATE := ADD_MONTHS(v_today, -12 * c_years_back);
        v_max_date  DATE := ADD_MONTHS(v_today, 3);
    BEGIN
        IF p_hiredate IS NULL THEN
            RAISE_APPLICATION_ERROR(-20001, 'Hire date cannot be NULL.');
        ELSIF TRUNC(p_hiredate) < v_min_date THEN
            RAISE_APPLICATION_ERROR(-20002, 'Hire date is too far in the past.');
        ELSIF TRUNC(p_hiredate) > v_max_date THEN
            RAISE_APPLICATION_ERROR(-20003, 'Hire date is too far in the future.');
        ELSE
            DBMS_OUTPUT.PUT_LINE('Hire date is valid.');
        END IF;
    END;

    PROCEDURE chk_dept_mgr(p_emp_id IN employees.employee_id%TYPE, p_mgr_id IN employees.manager_id%TYPE) IS
        v_emp_dept employees.department_id%TYPE;
        v_mgr_dept employees.department_id%TYPE;
        v_mgr_job  employees.job_id%TYPE;
    BEGIN
        SELECT department_id INTO v_emp_dept
        FROM employees
        WHERE employee_id = p_emp_id;

        SELECT department_id, job_id INTO v_mgr_dept, v_mgr_job
        FROM employees
        WHERE employee_id = p_mgr_id;

        IF v_emp_dept != v_mgr_dept THEN
            RAISE_APPLICATION_ERROR(-20004, 'Employee and manager are in different departments.');
        ELSIF v_mgr_job NOT LIKE '%MAN%' THEN
            RAISE_APPLICATION_ERROR(-20005, 'Manager job title is not a MANAGER.');
        ELSE
            DBMS_OUTPUT.PUT_LINE('Manager is valid for employee.');
        END IF;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RAISE_APPLICATION_ERROR(-20006, 'Employee or manager not found.');
    END;

END chk_pack;
/

