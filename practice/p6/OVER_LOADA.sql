CREATE OR REPLACE PACKAGE BODY over_load IS

    FUNCTION print_date(p_input VARCHAR2) RETURN VARCHAR2 IS
        v_date DATE;
    BEGIN
        v_date := TO_DATE(p_input, 'DD-MON-RR');
        RETURN TO_CHAR(v_date, 'FMMonth, DD YYYY');
    EXCEPTION
        WHEN OTHERS THEN
            RETURN 'Invalid date format: ' || p_input;
    END;

    FUNCTION print_number(p_input VARCHAR2) RETURN NUMBER IS
        v_number NUMBER;
    BEGIN
        v_number := TO_NUMBER(p_input, '999,999.00');
        RETURN v_number;
    EXCEPTION
        WHEN OTHERS THEN
            RETURN NULL;
    END;

END over_load;
/

