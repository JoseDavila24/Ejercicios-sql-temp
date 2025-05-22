CREATE OR REPLACE TRIGGER trg_upd_min_salary
AFTER UPDATE OF min_salary ON jobs
FOR EACH ROW
WHEN (NEW.min_salary > OLD.min_salary)
BEGIN
    upd_emp_sal(:NEW.job_id, :NEW.min_salary);
END;
/

