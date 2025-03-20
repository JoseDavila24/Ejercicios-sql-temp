SET SERVEROUTPUT ON;

DECLARE
    -- Variables para almacenar datos
    v_nom_estudiante estudiantes.nom_estudiante%TYPE;
    v_ape_estudiante estudiantes.ape_estudiante%TYPE;
    v_nom_asignatura asignaturas.nom_asignatura%TYPE;
    v_dia horarios.dia%TYPE;
    v_hora_inicio VARCHAR2(5);
    v_hora_fin VARCHAR2(5);
    v_nom_aula aulas.nom_aula%TYPE;
    v_ubicacion aulas.ubicacion%TYPE;

    -- Cursor que obtiene los horarios de un estudiante específico
    CURSOR horario_cursor IS
        SELECT e.nom_estudiante, e.ape_estudiante, a.nom_asignatura, 
               h.dia, TO_CHAR(h.hora_inicio, 'HH24:MI') AS hora_inicio, 
               TO_CHAR(h.hora_fin, 'HH24:MI') AS hora_fin, 
               au.nom_aula, au.ubicacion
        FROM matriculas m
        JOIN estudiantes e ON m.id_estudiante = e.id_estudiante
        JOIN asignaturas a ON m.id_asignatura = a.id_asignatura
        JOIN horarios h ON a.id_asignatura = h.id_asignatura
        JOIN aulas au ON h.id_aula = au.id_aula
        WHERE e.id_estudiante = 1  -- Cambia el ID del estudiante aquí
        ORDER BY h.dia, h.hora_inicio;

BEGIN
    -- Abrir el cursor
    OPEN horario_cursor;

    LOOP
        -- Obtener los datos del cursor
        FETCH horario_cursor INTO v_nom_estudiante, v_ape_estudiante, v_nom_asignatura,
                                 v_dia, v_hora_inicio, v_hora_fin, v_nom_aula, v_ubicacion;
        EXIT WHEN horario_cursor%NOTFOUND;

        -- Imprimir los resultados
        DBMS_OUTPUT.PUT_LINE('Estudiante: ' || v_nom_estudiante || ' ' || v_ape_estudiante);
        DBMS_OUTPUT.PUT_LINE('Asignatura: ' || v_nom_asignatura);
        DBMS_OUTPUT.PUT_LINE('Día: ' || v_dia || ' | Horario: ' || v_hora_inicio || ' - ' || v_hora_fin);
        DBMS_OUTPUT.PUT_LINE('Aula: ' || v_nom_aula || ' (' || v_ubicacion || ')');
        DBMS_OUTPUT.PUT_LINE('--------------------------------------');
    END LOOP;

    -- Cerrar el cursor
    CLOSE horario_cursor;
END;
/

