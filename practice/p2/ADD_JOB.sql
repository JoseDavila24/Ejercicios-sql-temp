CREATE OR REPLACE PROCEDURE add_job (
    p_job_id    IN jobs.job_id%TYPE,
    p_job_title IN jobs.job_title%TYPE
) IS
BEGIN
    INSERT INTO jobs (job_id, job_title)
    VALUES (p_job_id, p_job_title);

    DBMS_OUTPUT.PUT_LINE('Job inserted: ' || p_job_id || ' - ' || p_job_title);
EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        DBMS_OUTPUT.PUT_LINE('ERROR: Job ID already exists: ' || p_job_id);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Unexpected error: ' || SQLERRM);
END;
/

