-- En SQL*Plus, define la variable n antes de ejecutar
-- Ejemplo: DEFINE n = 5

SET SERVEROUTPUT ON
SET ECHO OFF

DECLARE
    CURSOR c_top_salaries IS
        SELECT DISTINCT salary
        FROM employees
        ORDER BY salary DESC;

    v_counter NUMBER := 0;
BEGIN
    -- Limpiar la tabla antes de insertar
    DELETE FROM top_dogs;

    FOR rec IN c_top_salaries LOOP
        EXIT WHEN v_counter = &n;
        INSERT INTO top_dogs (salary) VALUES (rec.salary);
        v_counter := v_counter + 1;
    END LOOP;

    DBMS_OUTPUT.PUT_LINE(v_counter || ' unique top salaries inserted into TOP_DOGS.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/

