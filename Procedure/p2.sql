CREATE OR REPLACE PROCEDURE leave_emp (
   p_id IN employees2.employee_id%TYPE
) IS
BEGIN
   DELETE FROM employees2
   WHERE employee_id = p_id;
   
   -- Llamada al procedimiento log_execution
   log_execution;
END leave_emp;
/
