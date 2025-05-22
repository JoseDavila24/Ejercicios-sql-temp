CREATE OR REPLACE PACKAGE check_pack IS
    PROCEDURE chk_dept_job(p_dept_id IN NUMBER, p_job_id IN VARCHAR2);
END check_pack;
/

