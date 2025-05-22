-- Agregar procedimiento
CREATE OR REPLACE PACKAGE BODY business_rules AS
    ...
    PROCEDURE check_salary_increase(p_old_sal IN NUMBER, p_new_sal IN NUMBER) IS
    BEGIN
        IF p_new_sal < p_old_sal THEN
            RAISE_APPLICATION_ERROR(-20005, '❌ Salary decrease not allowed.');
        END IF;
    END;
END;
/

-- Trigger para validar aumento
CREATE OR REPLACE TRIGGER trg_salary_increase
BEFORE UPDATE OF salary ON employees
FOR EACH ROW
BEGIN
    business_rules.check_salary_increase(:OLD.salary, :NEW.salary);
END;
/

