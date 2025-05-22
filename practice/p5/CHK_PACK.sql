CREATE OR REPLACE PACKAGE chk_pack IS
    PROCEDURE chk_hiredate(p_hiredate IN DATE);
    PROCEDURE chk_dept_mgr(p_emp_id IN employees.employee_id%TYPE, p_mgr_id IN employees.manager_id%TYPE);
END chk_pack;
/

