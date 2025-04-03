CREATE OR REPLACE PROCEDURE ver_libros_por_fecha(p_fecha DATE)
IS
    v_titulo Libros.Titulo%TYPE;
    v_count  NUMBER := 0;
BEGIN
    DBMS_OUTPUT.PUT_LINE('==> Iniciando búsqueda de libros prestados el ' || TO_CHAR(p_fecha, 'DD-MON-YYYY'));

    FOR reg IN (
        SELECT l.Titulo
        FROM Prestamos p
        JOIN Libros l ON p.ISBN = l.ISBN
        WHERE TRUNC(p.FechaPrestamo) = TRUNC(p_fecha)
    ) LOOP
        v_count := v_count + 1;
        DBMS_OUTPUT.PUT_LINE('- Libro prestado: ' || reg.Titulo);
    END LOOP;

    IF v_count = 0 THEN
        DBMS_OUTPUT.PUT_LINE('No se encontraron préstamos en esa fecha.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Total de libros prestados: ' || v_count);
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Ocurrió un error: ' || SQLERRM);
END;
/

