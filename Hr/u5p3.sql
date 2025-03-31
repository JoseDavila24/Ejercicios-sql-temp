CREATE OR REPLACE PROCEDURE raise_salary_employees2 (
   p_id IN employees2.employee_id%TYPE
)
IS
BEGIN
   -- Actualiza el salario en EMPLOYEES2 con un aumento del 10%
   UPDATE employees2
   SET salary = salary * 1.10
   WHERE employee_id = p_id;
   
   -- Opcional: confirmación implícita
   COMMIT;
   
EXCEPTION
   WHEN NO_DATA_FOUND THEN
      DBMS_OUTPUT.PUT_LINE('Empleado con ID ' || p_id || ' no encontrado en EMPLOYEES2');
   WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('Error al actualizar salario: ' || SQLERRM);
      ROLLBACK;
      RAISE;
END raise_salary_employees2;
/
