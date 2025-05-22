CREATE OR REPLACE PACKAGE BODY job_pack IS

    PROCEDURE add_job(p_job_id IN jobs.job_id%TYPE, p_job_title IN jobs.job_title%TYPE) IS
    BEGIN
        INSERT INTO jobs (job_id, job_title)
        VALUES (p_job_id, p_job_title);
        DBMS_OUTPUT.PUT_LINE('Job inserted: ' || p_job_id);
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
            DBMS_OUTPUT.PUT_LINE('ERROR: Job ID already exists');
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Unexpected error: ' || SQLERRM);
    END;

    PROCEDURE upd_job(p_job_id IN jobs.job_id%TYPE, p_new_title IN jobs.job_title%TYPE) IS
    BEGIN
        UPDATE jobs
        SET job_title = p_new_title
        WHERE job_id = p_job_id;

        IF SQL%ROWCOUNT = 0 THEN
            RAISE_APPLICATION_ERROR(-20001, 'Job ID not found: ' || p_job_id);
        END IF;
        DBMS_OUTPUT.PUT_LINE('Job updated: ' || p_job_id);
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Update error: ' || SQLERRM);
    END;

    PROCEDURE del_job(p_job_id IN jobs.job_id%TYPE) IS
    BEGIN
        DELETE FROM jobs
        WHERE job_id = p_job_id;

        IF SQL%ROWCOUNT = 0 THEN
            RAISE_APPLICATION_ERROR(-20002, 'No job deleted. ID not found: ' || p_job_id);
        END IF;
        DBMS_OUTPUT.PUT_LINE('Job deleted: ' || p_job_id);
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Delete error: ' || SQLERRM);
    END;

    FUNCTION q_job(p_job_id IN jobs.job_id%TYPE) RETURN jobs.job_title%TYPE IS
        v_title jobs.job_title%TYPE;
    BEGIN
        SELECT job_title INTO v_title
        FROM jobs
        WHERE job_id = p_job_id;
        RETURN v_title;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RETURN 'Not Found';
        WHEN OTHERS THEN
            RETURN 'Error: ' || SQLERRM;
    END;

END job_pack;
/

