CREATE OR REPLACE FUNCTION get_product_count (
    p_custid IN ord.custid%TYPE
) RETURN NUMBER IS
    v_count NUMBER;
BEGIN
    SELECT COUNT(DISTINCT prodid) INTO v_count
    FROM ord o JOIN item i ON o.ordid = i.ordid
    WHERE o.custid = p_custid;

    RETURN v_count;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 0;
END;
/

