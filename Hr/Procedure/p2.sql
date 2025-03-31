CREATE OR REPLACE PROCEDURE leave_emp (
   p_id IN employees.employee_id%TYPE
) IS
BEGIN
   DELETE FROM employees
   WHERE employee_id = p_id;
   
   -- Llamada al procedimiento log_execution
   log_execution;
END leave_emp;
/
