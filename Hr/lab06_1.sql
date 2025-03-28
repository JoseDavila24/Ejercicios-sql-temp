-- Define el valor de n en iSQL*Plus antes de ejecutar
-- Ejemplo: DEFINE n = 5

DECLARE
    CURSOR top_salaries_cur IS
        SELECT DISTINCT salary
        FROM employees
        ORDER BY salary DESC;

    v_count NUMBER := 0;
BEGIN
    -- Limpiar la tabla antes de cargar nuevos datos
    DELETE FROM top_dogs;

    FOR rec IN top_salaries_cur LOOP
        EXIT WHEN v_count = &n; -- Detener cuando se alcanzan los n registros
        INSERT INTO top_dogs (salary) VALUES (rec.salary);
        v_count := v_count + 1;
    END LOOP;

    DBMS_OUTPUT.PUT_LINE(v_count || ' salaries inserted into TOP_DOGS.');
END;
/

