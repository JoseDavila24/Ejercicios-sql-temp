CREATE OR REPLACE PROCEDURE secure_dml IS
    v_day     VARCHAR2(10);
    v_hour    NUMBER;
    v_minute  NUMBER;
    v_time_ok BOOLEAN := FALSE;
BEGIN
    -- Día de la semana: MON, TUE, ..., SUN
    v_day := TO_CHAR(SYSDATE, 'DY', 'NLS_DATE_LANGUAGE=ENGLISH');

    -- Hora actual convertida a minutos desde medianoche
    v_hour   := TO_NUMBER(TO_CHAR(SYSDATE, 'HH24'));
    v_minute := TO_NUMBER(TO_CHAR(SYSDATE, 'MI'));

    -- Hora actual en minutos desde 00:00
    DECLARE
        v_now NUMBER := v_hour * 60 + v_minute;
    BEGIN
        -- 08:45 = 525 minutos, 17:30 = 1050 minutos
        IF v_day IN ('MON', 'TUE', 'WED', 'THU', 'FRI') AND
           v_now BETWEEN 525 AND 1050 THEN
            v_time_ok := TRUE;
        END IF;
    END;

    -- Si no está dentro del rango permitido, bloquear
    IF NOT v_time_ok THEN
        RAISE_APPLICATION_ERROR(-20001, '⛔ You may only make changes during normal office hours.');
    END IF;
END;
/

