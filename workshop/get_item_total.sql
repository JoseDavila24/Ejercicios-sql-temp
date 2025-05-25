CREATE OR REPLACE FUNCTION get_item_total (
    p_ordid  IN item.ordid%TYPE,
    p_itemid IN item.itemid%TYPE
) RETURN NUMBER IS
    v_total NUMBER;
BEGIN
    SELECT itemtot INTO v_total
    FROM item
    WHERE ordid = p_ordid AND itemid = p_itemid;

    RETURN v_total;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN NULL;
END;
/

