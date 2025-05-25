CREATE OR REPLACE PROCEDURE add_price (
    p_prodid     IN price.prodid%TYPE,
    p_std_price  IN price.stdprice%TYPE,
    p_min_price  IN price.minprice%TYPE
) IS
BEGIN
    DECLARE
        v_dummy NUMBER;
    BEGIN
        SELECT 1 INTO v_dummy FROM product WHERE prodid = p_prodid;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RAISE_APPLICATION_ERROR(-20002, 'Product does not exist.');
    END;

    UPDATE price
    SET enddate = SYSDATE - 1
    WHERE prodid = p_prodid AND enddate IS NULL;

    INSERT INTO price (prodid, stdprice, minprice, startdate)
    VALUES (p_prodid, p_std_price, p_min_price, SYSDATE);

    DBMS_OUTPUT.PUT_LINE('Price added.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/

