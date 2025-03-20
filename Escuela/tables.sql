-- Creación de las tablas sin AUTO_INCREMENT
CREATE TABLE estudiantes (
    id_estudiante INT PRIMARY KEY,
    nom_estudiante VARCHAR2(100) NOT NULL,
    ape_estudiante VARCHAR2(100) NOT NULL,
    estrato VARCHAR2(10) CHECK (estrato IN ('REGULAR', 'IRREGULAR')),
    genero_estudiante CHAR(1) CHECK (genero_estudiante IN ('M', 'F')),
    ciudad_nac VARCHAR2(100),
    fecha_nac DATE
);

CREATE TABLE profesores (
    id_profesor INT PRIMARY KEY,
    nom_profesor VARCHAR2(100) NOT NULL,
    ape_profesor VARCHAR2(100) NOT NULL,
    titulo VARCHAR2(100),
    genero_profesor CHAR(1) CHECK (genero_profesor IN ('M', 'F')),
    area VARCHAR2(100)
);

CREATE TABLE programas (
    id_programa INT PRIMARY KEY,
    programa VARCHAR2(100) NOT NULL,
    dpto VARCHAR2(100),
    facultad VARCHAR2(100)
);

CREATE TABLE asignaturas (
    id_asignatura INT PRIMARY KEY,
    id_profesor INT,
    id_curso INT,
    nom_asignatura VARCHAR2(100) NOT NULL,
    creditos INT,
    FOREIGN KEY (id_profesor) REFERENCES profesores(id_profesor)
);

CREATE TABLE matriculas (
    id_matricula INT PRIMARY KEY,
    id_estudiante INT,
    id_asignatura INT,
    nota DECIMAL(4,2),
    FOREIGN KEY (id_estudiante) REFERENCES estudiantes(id_estudiante),
    FOREIGN KEY (id_asignatura) REFERENCES asignaturas(id_asignatura)
);

CREATE TABLE aulas (
    id_aula INT PRIMARY KEY,
    nom_aula VARCHAR2(100) NOT NULL,
    ubicacion VARCHAR2(100),
    capacidad INT,
    tipo VARCHAR2(15) CHECK (tipo IN ('TALLER', 'LABORATORIO', 'AULA'))
);

CREATE TABLE horarios (
    id_horario INT PRIMARY KEY,
    id_asignatura INT,
    id_aula INT,
    dia VARCHAR2(20),
    hora_inicio TIMESTAMP,
    hora_fin TIMESTAMP,
    FOREIGN KEY (id_asignatura) REFERENCES asignaturas(id_asignatura),
    FOREIGN KEY (id_aula) REFERENCES aulas(id_aula)
);

CREATE TABLE grupos (
    id_grupo INT PRIMARY KEY,
    id_profesor INT,
    id_asignatura INT,
    grupo VARCHAR2(50),
    num_estudiantes INT,
    FOREIGN KEY (id_profesor) REFERENCES profesores(id_profesor),
    FOREIGN KEY (id_asignatura) REFERENCES asignaturas(id_asignatura)
);

