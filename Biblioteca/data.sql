-- Inserción de datos en Autores
INSERT INTO Autores (ID_Autor, Nombre, Apellido, FechaNacimiento) VALUES (1, 'Gabriel', 'García Márquez', TO_DATE('1927-03-06', 'YYYY-MM-DD'));
INSERT INTO Autores (ID_Autor, Nombre, Apellido, FechaNacimiento) VALUES (2, 'J.K.', 'Rowling', TO_DATE('1965-07-31', 'YYYY-MM-DD'));
INSERT INTO Autores (ID_Autor, Nombre, Apellido, FechaNacimiento) VALUES (3, 'George', 'Orwell', TO_DATE('1903-06-25', 'YYYY-MM-DD'));
INSERT INTO Autores (ID_Autor, Nombre, Apellido, FechaNacimiento) VALUES (4, 'J.R.R.', 'Tolkien', TO_DATE('1892-01-03', 'YYYY-MM-DD'));
INSERT INTO Autores (ID_Autor, Nombre, Apellido, FechaNacimiento) VALUES (5, 'Stephen', 'King', TO_DATE('1947-09-21', 'YYYY-MM-DD'));

-- Inserción de datos en Libros
INSERT INTO Libros (ISBN, Titulo, AnioPublicacion, ID_Autor, Genero, CantidadDisponible) VALUES ('9788439722599', 'Cien años de soledad', 1967, 1, 'Novela', 5);
INSERT INTO Libros (ISBN, Titulo, AnioPublicacion, ID_Autor, Genero, CantidadDisponible) VALUES ('9780747532743', 'Harry Potter y la piedra filosofal', 1997, 2, 'Fantasía', 5);
INSERT INTO Libros (ISBN, Titulo, AnioPublicacion, ID_Autor, Genero, CantidadDisponible) VALUES ('9780451524935', '1984', 1949, 3, 'Distopía', 5);
INSERT INTO Libros (ISBN, Titulo, AnioPublicacion, ID_Autor, Genero, CantidadDisponible) VALUES ('9780618260300', 'El Hobbit', 1937, 4, 'Fantasía', 5);
INSERT INTO Libros (ISBN, Titulo, AnioPublicacion, ID_Autor, Genero, CantidadDisponible) VALUES ('9780307743657', 'El Resplandor', 1977, 5, 'Terror', 5);

-- Inserción de datos en Miembros
INSERT INTO Miembros (ID_Miembro, Nombre, Direccion, Telefono, FechaRegistro) VALUES (1, 'Juan Perez', 'Calle 123', '555-1234', SYSDATE);
INSERT INTO Miembros (ID_Miembro, Nombre, Direccion, Telefono, FechaRegistro) VALUES (2, 'Maria Lopez', 'Avenida 456', '555-5678', SYSDATE);
INSERT INTO Miembros (ID_Miembro, Nombre, Direccion, Telefono, FechaRegistro) VALUES (3, 'Carlos Ruiz', 'Boulevard 789', '555-9012', SYSDATE);
INSERT INTO Miembros (ID_Miembro, Nombre, Direccion, Telefono, FechaRegistro) VALUES (4, 'Laura Gomez', 'Plaza 012', '555-3456', SYSDATE);
INSERT INTO Miembros (ID_Miembro, Nombre, Direccion, Telefono, FechaRegistro) VALUES (5, 'Pedro Martínez', 'Camino 345', '555-7890', SYSDATE);

