SET SERVEROUTPUT ON;

DECLARE
    -- Tipo RECORD basado en columnas seleccionadas de DEPARTMENTS
    TYPE dept_rec_type IS RECORD (
        department_id   DEPARTMENTS.DEPARTMENT_ID%TYPE,
        department_name DEPARTMENTS.DEPARTMENT_NAME%TYPE,
        location_id     DEPARTMENTS.LOCATION_ID%TYPE
    );

    -- INDEX BY table de registros
    TYPE dept_table_type IS TABLE OF dept_rec_type INDEX BY BINARY_INTEGER;
    my_dept_table dept_table_type;

    -- Lista de IDs a recuperar
    v_department_ids SYS.ODCINUMBERLIST := SYS.ODCINUMBERLIST(10, 20, 50, 60, 80, 90, 110);

BEGIN
    -- Rellenar la tabla INDEX BY
    FOR i IN 1 .. v_department_ids.COUNT LOOP
        BEGIN
            SELECT department_id, department_name, location_id
            INTO my_dept_table(i)
            FROM departments
            WHERE department_id = v_department_ids(i);
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                -- Si no existe el departamento, llenar con valores por defecto
                my_dept_table(i).department_id := v_department_ids(i);
                my_dept_table(i).department_name := 'Not found';
                my_dept_table(i).location_id := NULL;
        END;
    END LOOP;

    -- Mostrar contenido de la tabla INDEX BY
    DBMS_OUTPUT.PUT_LINE('--- Department Info ---');
    FOR i IN 1 .. my_dept_table.COUNT LOOP
        DBMS_OUTPUT.PUT_LINE('Department ID   : ' || my_dept_table(i).department_id);
        DBMS_OUTPUT.PUT_LINE('Department Name : ' || my_dept_table(i).department_name);
        DBMS_OUTPUT.PUT_LINE('Location ID     : ' || NVL(TO_CHAR(my_dept_table(i).location_id), 'NULL'));
        DBMS_OUTPUT.PUT_LINE('--------------------------');
    END LOOP;
END;
/

