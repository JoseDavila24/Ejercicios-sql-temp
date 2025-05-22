CREATE OR REPLACE PROCEDURE del_job (
    p_job_id IN jobs.job_id%TYPE
) IS
BEGIN
    DELETE FROM jobs WHERE job_id = p_job_id;

    IF SQL%ROWCOUNT = 0 THEN
        RAISE_APPLICATION_ERROR(-20002, 'No job deleted. ID not found: ' || p_job_id);
    ELSE
        DBMS_OUTPUT.PUT_LINE('Job deleted: ' || p_job_id);
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Delete error: ' || SQLERRM);
END;
/

