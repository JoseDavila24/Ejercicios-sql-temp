DECLARE
   CURSOR emp_cursor IS
      SELECT employee_id, salary
      FROM emp
      WHERE employee_id IN (104, 174, 176)
      FOR UPDATE;

BEGIN
   FOR emp_rec IN emp_cursor LOOP
      IF emp_rec.salary < 5000 THEN
         UPDATE emp
         SET stars = '*'
         WHERE CURRENT OF emp_cursor;
      ELSIF emp_rec.salary BETWEEN 5000 AND 10000 THEN
         UPDATE emp
         SET stars = '**'
         WHERE CURRENT OF emp_cursor;
      ELSE
         UPDATE emp
         SET stars = '***'
         WHERE CURRENT OF emp_cursor;
      END IF;
   END LOOP;

   COMMIT;
END;
/

