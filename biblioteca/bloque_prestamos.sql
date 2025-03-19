DECLARE
  v_ID_Prestamo INT;
  v_ISBN Libros.ISBN%TYPE;
  v_ID_Miembro Miembros.ID_Miembro%TYPE;
BEGIN
  -- Solicitar al usuario los datos necesarios
  v_ID_Prestamo := &Ingrese_ID_Prestamo;
  v_ISBN := '&Ingrese_ISBN_del_libro';
  v_ID_Miembro := &Ingrese_ID_Miembro;

  INSERT INTO Prestamos (ID_Prestamo, ISBN, ID_Miembro, FechaPrestamo, FechaDevolucion)
  VALUES (v_ID_Prestamo, v_ISBN, v_ID_Miembro, SYSDATE, SYSDATE + 7);

  COMMIT;
  DBMS_OUTPUT.PUT_LINE('Préstamo registrado correctamente.');
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    DBMS_OUTPUT.PUT_LINE('Error al registrar el préstamo: ' || SQLERRM);
END;
/

