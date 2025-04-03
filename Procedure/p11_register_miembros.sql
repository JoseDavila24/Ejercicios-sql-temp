CREATE OR REPLACE PROCEDURE insertar_miembro (
    p_id_miembro     IN NUMBER,
    p_nombre         IN VARCHAR2,
    p_direccion      IN VARCHAR2 DEFAULT NULL,
    p_telefono       IN VARCHAR2 DEFAULT NULL,
    p_fecharegistro  IN DATE DEFAULT SYSDATE
)
AS
BEGIN
    INSERT INTO miembros (
        id_miembro, nombre, direccion, telefono, fecharegistro
    ) VALUES (
        p_id_miembro, p_nombre, p_direccion, p_telefono, p_fecharegistro
    );
    
    COMMIT;
END;
/

