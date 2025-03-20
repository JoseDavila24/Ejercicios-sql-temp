-- Mostrar empleados contratados en años bisiestos
SET LINESIZE 150
SET PAGESIZE 50

SELECT employee_id,
       first_name,
       last_name,
       hire_date
FROM hr.employees
WHERE MOD(EXTRACT(YEAR FROM hire_date), 4) = 0
  AND (MOD(EXTRACT(YEAR FROM hire_date), 100) <> 0 OR MOD(EXTRACT(YEAR FROM hire_date), 400) = 0)
ORDER BY hire_date;

