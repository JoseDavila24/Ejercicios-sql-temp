CREATE OR REPLACE PACKAGE BODY check_pack IS

    -- Tipo de registro compuesto: departamento + job
    TYPE dept_job_rec IS RECORD (
        dept_id NUMBER,
        job_id  VARCHAR2(10)
    );

    -- Tabla PL/SQL indexada
    TYPE dept_job_tab IS TABLE OF dept_job_rec INDEX BY BINARY_INTEGER;

    -- Tabla en memoria con datos válidos
    g_valid_combos dept_job_tab;

    -- Bandera para cargar una vez
    g_loaded BOOLEAN := FALSE;

    -- Procedimiento de carga única
    PROCEDURE load_valid_combos IS
        i NUMBER := 0;
    BEGIN
        FOR rec IN (
            SELECT DISTINCT department_id, job_id
            FROM employees
            WHERE department_id IS NOT NULL AND job_id IS NOT NULL
        ) LOOP
            i := i + 1;
            g_valid_combos(i).dept_id := rec.department_id;
            g_valid_combos(i).job_id  := rec.job_id;
        END LOOP;

        g_loaded := TRUE;
    END;

    -- Procedimiento público para verificar combinación
    PROCEDURE chk_dept_job(p_dept_id IN NUMBER, p_job_id IN VARCHAR2) IS
        v_found BOOLEAN := FALSE;
    BEGIN
        -- Cargar combinaciones si es la primera vez
        IF NOT g_loaded THEN
            load_valid_combos;
        END IF;

        -- Buscar coincidencia
        FOR i IN g_valid_combos.FIRST .. g_valid_combos.LAST LOOP
            IF g_valid_combos(i).dept_id = p_dept_id AND
               g_valid_combos(i).job_id  = p_job_id THEN
                v_found := TRUE;
                EXIT;
            END IF;
        END LOOP;

        IF v_found THEN
            DBMS_OUTPUT.PUT_LINE('Valid department/job combination.');
        ELSE
            RAISE_APPLICATION_ERROR(-20010, 'Invalid department/job combination.');
        END IF;
    END;

END check_pack;
/

