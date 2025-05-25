CREATE OR REPLACE PROCEDURE check_creditlimit IS
    CURSOR c_customers IS
        SELECT cutid, creditlimit FROM customer;

    v_total NUMBER;
BEGIN
    FOR cust IN c_customers LOOP
        SELECT NVL(SUM(total), 0) INTO v_total
        FROM ord
        WHERE custid = cust.cutid;

        UPDATE customer
        SET creditlimit_indicate = CASE
            WHEN v_total > cust.creditlimit THEN 'YES'
            ELSE 'NO'
        END
        WHERE cutid = cust.cutid;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Credit limits checked.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/

