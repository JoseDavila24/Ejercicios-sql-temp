DECLARE
    v_ISBN Libros.ISBN%TYPE;
    v_Nombre Autores.Nombre%TYPE;
    v_Apellido Autores.Apellido%TYPE;
BEGIN
    -- Solicita ISBN al usuario
    v_ISBN := '&ISBN';

    -- Busca el nombre y apellido del autor del libro
    SELECT A.Nombre, A.Apellido
    INTO v_Nombre, v_Apellido
    FROM Libros L
    JOIN Autores A ON L.ID_Autor = A.ID_Autor
    WHERE L.ISBN = v_ISBN;

    -- Muestra el resultado
    DBMS_OUTPUT.PUT_LINE('El autor del libro con ISBN ' || v_ISBN || ' es: ' || v_Nombre || ' ' || v_Apellido);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No se encontró ningún libro con el ISBN proporcionado.');
END;
/

