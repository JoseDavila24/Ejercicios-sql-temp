CREATE OR REPLACE PACKAGE over_load IS
    FUNCTION print_date(p_input VARCHAR2) RETURN VARCHAR2;
    FUNCTION print_number(p_input VARCHAR2) RETURN NUMBER;
END over_load;
/

