CREATE TABLE Autores (
  ID_Autor INT PRIMARY KEY,
  Nombre VARCHAR(100) NOT NULL,
  Apellido VARCHAR(100) NOT NULL,
  FechaNacimiento DATE
);

CREATE TABLE Libros (
  ISBN VARCHAR(20) PRIMARY KEY,
  Titulo VARCHAR(255) NOT NULL,
  AnioPublicacion INT,
  ID_Autor INT,
  Genero VARCHAR(50),
  CantidadDisponible INT,
  FOREIGN KEY (ID_Autor) REFERENCES Autores(ID_Autor)
);

CREATE TABLE Miembros (
  ID_Miembro INT PRIMARY KEY,
  Nombre VARCHAR(100) NOT NULL,
  Direccion VARCHAR(255),
  Telefono VARCHAR(20),
  FechaRegistro DATE
);

CREATE TABLE Prestamos (
  ID_Prestamo INT PRIMARY KEY,
  ISBN VARCHAR(20),
  ID_Miembro INT,
  FechaPrestamo DATE,
  FechaDevolucion DATE,
  FOREIGN KEY (ISBN) REFERENCES Libros(ISBN),
  FOREIGN KEY (ID_Miembro) REFERENCES Miembros(ID_Miembro)
);

