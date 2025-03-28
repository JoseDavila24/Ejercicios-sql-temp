SET SERVEROUTPUT ON;

DECLARE
    -- Tabla INDEX BY para almacenar nombres de departamentos
    TYPE dept_table_type IS TABLE OF DEPARTMENTS.DEPARTMENT_NAME%TYPE
        INDEX BY BINARY_INTEGER;

    my_dept_table dept_table_type;

    -- Mapeo entre contador y DEPARTMENT_ID
    v_department_ids  SYS.ODCINUMBERLIST := SYS.ODCINUMBERLIST(10, 20, 50, 60, 80, 90, 110);
    v_counter         INTEGER := 1;
    v_dept_name       DEPARTMENTS.DEPARTMENT_NAME%TYPE;

BEGIN
    -- Cargar nombres en la tabla INDEX BY
    FOR i IN 1 .. v_department_ids.COUNT LOOP
        BEGIN
            SELECT department_name
            INTO v_dept_name
            FROM departments
            WHERE department_id = v_department_ids(i);

            -- Almacenar en tabla INDEX BY
            my_dept_table(i) := v_dept_name;

        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                my_dept_table(i) := 'Not found (ID=' || v_department_ids(i) || ')';
        END;
    END LOOP;

    -- Mostrar resultados
    DBMS_OUTPUT.PUT_LINE('--- Department Names ---');
    FOR i IN 1 .. my_dept_table.COUNT LOOP
        DBMS_OUTPUT.PUT_LINE('Department ' || i || ': ' || my_dept_table(i));
    END LOOP;

END;
/

