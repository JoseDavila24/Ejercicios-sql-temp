-- Se debe de defenir el valor del department_id antes de ejecutar
-- Ejemplo: DEFINE dept_id = 50

SET SERVEROUTPUT ON
SET ECHO OFF

DECLARE
    CURSOR emp_cursor IS
        SELECT last_name, salary, manager_id
        FROM employees
        WHERE department_id = &dept_id;
BEGIN
    FOR emp_rec IN emp_cursor LOOP
        IF emp_rec.salary < 5000 AND emp_rec.manager_id IN (101, 124) THEN
            DBMS_OUTPUT.PUT_LINE(emp_rec.last_name || ' Due for a raise');
        ELSE
            DBMS_OUTPUT.PUT_LINE(emp_rec.last_name || ' Not due for a raise');
        END IF;
    END LOOP;
END;
/

