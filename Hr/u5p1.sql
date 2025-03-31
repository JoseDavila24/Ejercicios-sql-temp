CREATE OR REPLACE PROCEDURE log_execution
IS
BEGIN
    INSERT INTO log_table (user_id, log_date)
    VALUES (USER, SYSDATE); -- USER devuelve el usuario actual
END log_execution;
/

-- Ejemplo de llamada:
EXEC log_execution;
