CREATE OR REPLACE PROCEDURE upd_job (
    p_job_id      IN jobs.job_id%TYPE,
    p_new_title   IN jobs.job_title%TYPE
) IS
BEGIN
    UPDATE jobs
    SET job_title = p_new_title
    WHERE job_id = p_job_id;

    IF SQL%ROWCOUNT = 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'No job found with ID ' || p_job_id);
    ELSE
        DBMS_OUTPUT.PUT_LINE('Job updated: ' || p_job_id);
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Update error: ' || SQLERRM);
END;
/

