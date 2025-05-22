-- Crear paquete
CREATE OR REPLACE PACKAGE business_rules IS
    PROCEDURE check_commission(p_job_id IN VARCHAR2, p_commission IN NUMBER);
END;
/

-- Crear cuerpo
CREATE OR REPLACE PACKAGE BODY business_rules IS
    PROCEDURE check_commission(p_job_id IN VARCHAR2, p_commission IN NUMBER) IS
    BEGIN
        IF p_commission IS NOT NULL AND p_job_id NOT IN ('SA_MAN', 'SA_REP') THEN
            RAISE_APPLICATION_ERROR(-20001, '❌ Only sales staff may receive commission.');
        ELSIF p_commission IS NULL AND p_job_id IN ('SA_MAN', 'SA_REP') THEN
            RAISE_APPLICATION_ERROR(-20002, '❌ Sales staff must have commission.');
        END IF;
    END;
END;
/

-- Crear trigger
CREATE OR REPLACE TRIGGER trg_check_commission
BEFORE INSERT OR UPDATE OF job_id, commission_pct ON employees
FOR EACH ROW
BEGIN
    business_rules.check_commission(:NEW.job_id, :NEW.commission_pct);
END;
/

