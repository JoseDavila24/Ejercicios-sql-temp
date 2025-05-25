CREATE OR REPLACE PROCEDURE change_item_qty (
    p_ordid   IN item.ordid%TYPE,
    p_prodid  IN item.prodid%TYPE,
    p_qty     IN item.qty%TYPE
) IS
BEGIN
    UPDATE item
    SET qty = p_qty
    WHERE ordid = p_ordid AND prodid = p_prodid;

    IF SQL%ROWCOUNT = 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Product/order combination does not exist.');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error updating quantity: ' || SQLERRM);
END;
/

