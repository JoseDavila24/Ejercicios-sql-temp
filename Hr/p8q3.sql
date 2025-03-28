SET SERVEROUTPUT ON
SET VERIFY OFF
-- DEFINE p_sal antes de ejecutar este archivo, ej:
-- DEFINE p_sal = 7000

DECLARE
   v_count     NUMBER;
   v_min_sal   NUMBER := &p_sal - 100;
   v_max_sal   NUMBER := &p_sal + 100;
   v_word      VARCHAR2(10);

   e_no_emps   EXCEPTION;
BEGIN
   SELECT COUNT(*) INTO v_count
   FROM employees
   WHERE salary BETWEEN v_min_sal AND v_max_sal;

   IF v_count = 0 THEN
      RAISE e_no_emps;
   ELSE
      -- Ajuste gramatical para "is/are"
      IF v_count = 1 THEN
         v_word := 'is';
      ELSE
         v_word := 'are';
      END IF;

      DBMS_OUTPUT.PUT_LINE('There ' || v_word || ' ' || v_count || 
                           ' employee(s) with a salary between ' || 
                           v_min_sal || ' and ' || v_max_sal || '.');
   END IF;

EXCEPTION
   WHEN e_no_emps THEN
      DBMS_OUTPUT.PUT_LINE('❌ No employees with a salary between ' || v_min_sal || ' and ' || v_max_sal || '.');
   WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('⚠️ Some other error occurred: ' || SQLERRM);
END;
/

