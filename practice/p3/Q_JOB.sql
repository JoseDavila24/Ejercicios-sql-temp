CREATE OR REPLACE FUNCTION q_job (
    p_job_id IN jobs.job_id%TYPE
) RETURN jobs.job_title%TYPE IS
    v_title jobs.job_title%TYPE;
BEGIN
    SELECT job_title
    INTO v_title
    FROM jobs
    WHERE job_id = p_job_id;

    RETURN v_title;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 'No job found';
    WHEN OTHERS THEN
        RETURN 'Error: ' || SQLERRM;
END;
/

