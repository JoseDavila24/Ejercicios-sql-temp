-- Agregar procedimiento
CREATE OR REPLACE PACKAGE BODY business_rules AS
    ...
    PROCEDURE check_mgr_limit(p_mgr_id IN NUMBER) IS
        v_count NUMBER;
    BEGIN
        SELECT COUNT(*) INTO v_count
        FROM employees
        WHERE manager_id = p_mgr_id;
        IF v_count >= 15 THEN
            RAISE_APPLICATION_ERROR(-20004, '❌ A manager cannot have more than 15 employees.');
        END IF;
    END;
END;
/

-- Trigger para validación de manager
CREATE OR REPLACE TRIGGER trg_mgr_limit
BEFORE INSERT OR UPDATE OF manager_id ON employees
FOR EACH ROW
WHEN (NEW.manager_id IS NOT NULL)
BEGIN
    business_rules.check_mgr_limit(:NEW.manager_id);
END;
/

