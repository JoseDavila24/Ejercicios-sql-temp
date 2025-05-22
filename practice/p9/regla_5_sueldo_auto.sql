-- Agregar procedimiento
CREATE OR REPLACE PACKAGE BODY business_rules AS
    ...
    PROCEDURE apply_location_raise(p_dept_id IN NUMBER) IS
    BEGIN
        UPDATE employees
        SET salary = salary * 1.02
        WHERE department_id = p_dept_id;
    END;
END;
/

-- Trigger en DEPARTMENTS
CREATE OR REPLACE TRIGGER trg_dept_move
AFTER UPDATE OF location_id ON departments
FOR EACH ROW
WHEN (NEW.location_id != OLD.location_id)
BEGIN
    business_rules.apply_location_raise(:NEW.department_id);
END;
/

