## 🧭 Guía básica para usar Oracle SQL

---

### 🔐 Usuarios

- Ver todos los usuarios  
  `SELECT username FROM all_users;`

- Ver tu propio usuario  
  `SELECT * FROM user_users;`

---

### 📄 Tablas

- Ver tablas propias  
  `SELECT table_name FROM user_tables;`

- Ver tablas de otros usuarios  
  `SELECT owner, table_name FROM all_tables;`

- Ver columnas de una tabla  
  `SELECT column_name, data_type, data_length, nullable FROM user_tab_columns WHERE table_name = 'NOMBRE';`

---

### 🔑 Restricciones (Constraints)

- Ver restricciones propias  
  `SELECT constraint_name, constraint_type, table_name FROM user_constraints;`

- Ver columnas asociadas a una constraint  
  `SELECT constraint_name, column_name FROM user_cons_columns;`

- Tipos:  
  `P` = Primary Key  
  `R` = Foreign Key  
  `U` = Unique  
  `C` = Check  
  `N` = Not Null

---

### 🔗 Relaciones

- Ver llaves foráneas  
  `SELECT constraint_name, table_name, r_constraint_name FROM user_constraints WHERE constraint_type = 'R';`

---

### 🧱 Objetos

- Ver vistas propias  
  `SELECT view_name FROM user_views;`

- Ver secuencias  
  `SELECT sequence_name FROM user_sequences;`

- Ver índices  
  `SELECT index_name FROM user_indexes;`

- Ver todos los objetos  
  `SELECT object_name, object_type FROM user_objects;`

---

### 🛠 Procedimientos y funciones

- Ver procedimientos  
  `SELECT object_name FROM user_procedures WHERE object_type = 'PROCEDURE';`

- Ver funciones  
  `SELECT object_name FROM user_procedures WHERE object_type = 'FUNCTION';`

- Ver código fuente  
  `SELECT text FROM user_source WHERE name = 'NOMBRE' ORDER BY line;`

---

### 📦 Ejecución

- Ejecutar procedimiento sin OUT  
  ```sql
  BEGIN
    nombre_procedimiento(parámetros);
  END;
  ```

- Ejecutar con OUT (REF CURSOR)  
  ```sql
  VARIABLE rc REFCURSOR  
  EXEC nombre_procedimiento(:rc)  
  PRINT rc
  ```

---

### 👤 Crear usuario y permisos

- Crear usuario  
  `CREATE USER usuario IDENTIFIED BY contraseña;`

- Dar permisos básicos  
  `GRANT CREATE SESSION TO usuario;`  
  `GRANT CREATE TABLE TO usuario;`  
  `GRANT CREATE VIEW TO usuario;`  
  `GRANT CREATE PROCEDURE TO usuario;`  
  `GRANT CREATE SEQUENCE TO usuario;`  
  `GRANT UNLIMITED TABLESPACE TO usuario;`

- Dar permisos completos (desarrollo)  
  `GRANT CONNECT, RESOURCE TO usuario;`  
  `GRANT UNLIMITED TABLESPACE TO usuario;`

- Dar permisos de DBA (con precaución)  
  `GRANT DBA TO usuario;`
