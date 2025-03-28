SET VERIFY OFF
DEFINE p_dept_id = 280
DEFINE p_loc = 1700

VARIABLE v_msg VARCHAR2(100)

DECLARE
   v_dummy NUMBER;
BEGIN
   -- Verificamos si el departamento existe
   SELECT 1 INTO v_dummy
   FROM departments
   WHERE department_id = &p_dept_id;

   -- Si existe, actualizamos su ubicación
   UPDATE departments
   SET location_id = &p_loc
   WHERE department_id = &p_dept_id;

   COMMIT;

   :v_msg := 'Department updated successfully.';
EXCEPTION
   WHEN NO_DATA_FOUND THEN
      :v_msg := 'Department ID &p_dept_id does not exist.';
   WHEN OTHERS THEN
      :v_msg := 'Some other error occurred.';
END;
/

-- Mostramos el mensaje
PRINT v_msg

-- Verificamos si se actualizó el departamento
SELECT * FROM departments
WHERE department_id = &p_dept_id;

SET VERIFY ON

