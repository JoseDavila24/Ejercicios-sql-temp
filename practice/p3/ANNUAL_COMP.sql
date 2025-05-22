CREATE OR REPLACE FUNCTION annual_comp (
    p_monthly_salary  IN employees.salary%TYPE,
    p_commission_pct  IN employees.commission_pct%TYPE
) RETURN NUMBER IS
    v_annual_salary NUMBER;
BEGIN
    v_annual_salary := NVL(p_monthly_salary, 0) * 12 +
                       NVL(p_commission_pct, 0) * NVL(p_monthly_salary, 0) * 12;
    RETURN v_annual_salary;
END;
/

