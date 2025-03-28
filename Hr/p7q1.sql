SET SERVEROUTPUT ON
SET ECHO OFF

DECLARE
    -- Cursor principal: departamentos con ID < 100
    CURSOR dept_cursor IS
        SELECT department_id, department_name
        FROM departments
        WHERE department_id < 100;

    -- Cursor secundario con parámetro: empleados en ese departamento
    CURSOR emp_cursor(p_dept_id NUMBER) IS
        SELECT last_name, job_id, hire_date, salary
        FROM employees
        WHERE department_id = p_dept_id
          AND employee_id < 120;
BEGIN
    FOR dept_rec IN dept_cursor LOOP
        DBMS_OUTPUT.PUT_LINE('--- Department: ' || dept_rec.department_name || ' (ID: ' || dept_rec.department_id || ') ---');
        
        FOR emp_rec IN emp_cursor(dept_rec.department_id) LOOP
            DBMS_OUTPUT.PUT_LINE('Employee: ' || emp_rec.last_name || 
                                 ', Job: ' || emp_rec.job_id || 
                                 ', Hire Date: ' || TO_CHAR(emp_rec.hire_date, 'DD-MON-YYYY') || 
                                 ', Salary: ' || emp_rec.salary);
        END LOOP;

        DBMS_OUTPUT.PUT_LINE(' ');
    END LOOP;
END;
/

