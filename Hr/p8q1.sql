-- Asegúrate de tener la tabla MESSAGES
CREATE TABLE messages (
   msg VARCHAR2(100)
);

SET VERIFY OFF
DEFINE p_salary = 6000

DECLARE
   v_name   employees.last_name%TYPE;
BEGIN
   SELECT last_name INTO v_name
   FROM employees
   WHERE salary = &p_salary;

   INSERT INTO messages VALUES ('Employee: ' || v_name || ', Salary: ' || &p_salary);

EXCEPTION
   WHEN TOO_MANY_ROWS THEN
      INSERT INTO messages VALUES ('More than one employee with a salary of ' || &p_salary);
   WHEN NO_DATA_FOUND THEN
      INSERT INTO messages VALUES ('No employee with a salary of ' || &p_salary);
   WHEN OTHERS THEN
      INSERT INTO messages VALUES ('Some other error occurred.');
END;
/

