-- Activar la salida de DBMS_OUTPUT
SET SERVEROUTPUT ON;


DECLARE
    -- Declarar un record basado en COUNTRIES
    v_country_rec COUNTRIES%ROWTYPE;
BEGIN
    -- Buscar el país según el ID proporcionado
    SELECT *
    INTO v_country_rec
    FROM COUNTRIES
    WHERE COUNTRY_ID = '&country_id';

    -- Imprimir la información
    DBMS_OUTPUT.PUT_LINE('Country ID   : ' || v_country_rec.COUNTRY_ID);
    DBMS_OUTPUT.PUT_LINE('Country Name : ' || v_country_rec.COUNTRY_NAME);
    DBMS_OUTPUT.PUT_LINE('Region ID    : ' || v_country_rec.REGION_ID);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('❌ No country found with ID: &country_id');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('⚠️ Error: ' || SQLERRM);
END;
/

