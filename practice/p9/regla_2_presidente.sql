-- Agregar al paquete
ALTER PACKAGE business_rules COMPILE PACKAGE;

-- Agregar procedimiento
CREATE OR REPLACE PACKAGE BODY business_rules AS
    ...
    PROCEDURE check_single_president IS
        v_count NUMBER;
    BEGIN
        SELECT COUNT(*) INTO v_count
        FROM employees
        WHERE job_id = 'AD_PRES';
        IF v_count > 0 THEN
            RAISE_APPLICATION_ERROR(-20003, '❌ Only one president allowed.');
        END IF;
    END;
END;
/

-- Trigger para AD_PRES
CREATE OR REPLACE TRIGGER trg_one_president
BEFORE INSERT OR UPDATE OF job_id ON employees
FOR EACH ROW
WHEN (NEW.job_id = 'AD_PRES')
BEGIN
    business_rules.check_single_president;
END;
/

