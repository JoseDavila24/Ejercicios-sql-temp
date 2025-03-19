DECLARE
    v_id_cliente INT;
    v_id_factura INT;
    v_id_producto INT;
    v_cantidad INT;
    v_precio_unitario NUMBER(10,2);
    v_subtotal NUMBER(10,2) := 0;
    v_impuesto NUMBER(10,2);
    v_total NUMBER(10,2);
    
    -- Datos ingresados por el usuario
    v_nombre_cliente VARCHAR2(100) := 'Chema';
    v_direccion_cliente VARCHAR2(255) := 'Calle Principal #123, Querétaro';
    v_telefono_cliente VARCHAR2(20) := '4421234567';

BEGIN
    -- Insertar el cliente porque no existen clientes
    INSERT INTO CLIENTES (ID_CLIENTE, NOMBRE, DIRECCION, TELEFONO)
    VALUES (SEQ_ID_CLIENTE.NEXTVAL, v_nombre_cliente, v_direccion_cliente, v_telefono_cliente)
    RETURNING ID_CLIENTE INTO v_id_cliente;

    -- Pedir al usuario que ingrese el producto y la cantidad
    v_id_producto := 1; -- Aquí el usuario debe ingresar el ID del producto
    v_cantidad := 2;    -- Aquí el usuario debe ingresar la cantidad deseada

    -- Obtener el precio del producto
    SELECT PRECIO INTO v_precio_unitario 
    FROM PRODUCTOS 
    WHERE ID_PRODUCTO = v_id_producto;

    -- Crear factura
    INSERT INTO FACTURAS (ID_FACTURA, FECHA, ID_CLIENTE)
    VALUES (SEQ_ID_FACTURA.NEXTVAL, SYSDATE, v_id_cliente)
    RETURNING ID_FACTURA INTO v_id_factura;

    -- Registrar la venta
    INSERT INTO VENTAS (ID_VENTA, ID_FACTURA, ID_PRODUCTO, CANTIDAD)
    VALUES (SEQ_ID_VENTA.NEXTVAL, v_id_factura, v_id_producto, v_cantidad);

    -- Calcular valores de la factura
    v_subtotal := v_precio_unitario * v_cantidad;
    v_impuesto := v_subtotal * 0.16;
    v_total := v_subtotal + v_impuesto;

    -- Imprimir la factura
    DBMS_OUTPUT.PUT_LINE('------------------------------------------------------');
    DBMS_OUTPUT.PUT_LINE('               FACTURA DE VENTA');
    DBMS_OUTPUT.PUT_LINE('------------------------------------------------------');
    DBMS_OUTPUT.PUT_LINE('Factura No.: ' || v_id_factura);
    DBMS_OUTPUT.PUT_LINE('Fecha: ' || TO_CHAR(SYSDATE, 'DD-MON-YYYY HH24:MI:SS'));
    DBMS_OUTPUT.PUT_LINE('Cliente: ' || v_nombre_cliente);
    DBMS_OUTPUT.PUT_LINE('Dirección: ' || v_direccion_cliente);
    DBMS_OUTPUT.PUT_LINE('Teléfono: ' || v_telefono_cliente);
    DBMS_OUTPUT.PUT_LINE('------------------------------------------------------');
    DBMS_OUTPUT.PUT_LINE('PRODUCTO                CANTIDAD    PRECIO UNIT.    TOTAL');
    DBMS_OUTPUT.PUT_LINE('------------------------------------------------------');

    DBMS_OUTPUT.PUT_LINE(
        RPAD('Producto ID ' || v_id_producto, 25) || 
        LPAD(v_cantidad, 10) || 
        LPAD(TO_CHAR(v_precio_unitario, '999,999.99'), 15) || 
        LPAD(TO_CHAR(v_precio_unitario * v_cantidad, '999,999.99'), 12)
    );

    DBMS_OUTPUT.PUT_LINE('------------------------------------------------------');
    DBMS_OUTPUT.PUT_LINE('Subtotal: ' || TO_CHAR(v_subtotal, '999,999.99'));
    DBMS_OUTPUT.PUT_LINE('IVA (16%): ' || TO_CHAR(v_impuesto, '999,999.99'));
    DBMS_OUTPUT.PUT_LINE('TOTAL A PAGAR: ' || TO_CHAR(v_total, '999,999.99'));
    DBMS_OUTPUT.PUT_LINE('------------------------------------------------------');
    DBMS_OUTPUT.PUT_LINE('         ¡Gracias por su compra!');
    DBMS_OUTPUT.PUT_LINE('------------------------------------------------------');

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error en la venta: ' || SQLERRM);
END;
/

