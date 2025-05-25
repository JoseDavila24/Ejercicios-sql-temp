CREATE OR REPLACE PROCEDURE add_order (
    p_cust_id    IN ord.custid%TYPE,
    p_commplan   IN ord.commplan%TYPE DEFAULT NULL
) IS
BEGIN
    INSERT INTO ord (ordid, custid, orderdate, commplan)
    VALUES (
        ordid_seq.NEXTVAL,
        p_cust_id,
        SYSDATE,
        p_commplan
    );
    DBMS_OUTPUT.PUT_LINE('Order inserted successfully.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error adding order: ' || SQLERRM);
END;
/

