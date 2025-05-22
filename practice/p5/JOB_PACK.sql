CREATE OR REPLACE PACKAGE job_pack IS
    PROCEDURE add_job(p_job_id IN jobs.job_id%TYPE, p_job_title IN jobs.job_title%TYPE);
    PROCEDURE upd_job(p_job_id IN jobs.job_id%TYPE, p_new_title IN jobs.job_title%TYPE);
    PROCEDURE del_job(p_job_id IN jobs.job_id%TYPE);
    FUNCTION q_job(p_job_id IN jobs.job_id%TYPE) RETURN jobs.job_title%TYPE;
END job_pack;
/

