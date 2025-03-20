-- Insertar estudiantes
INSERT INTO estudiantes (id_estudiante, nom_estudiante, ape_estudiante, estrato, genero_estudiante, ciudad_nac, fecha_nac)
VALUES (1, 'Jose Maria', 'Romero Davila', 'REGULAR', 'M', 'Queretaro', TO_DATE('2000-05-15', 'YYYY-MM-DD'));

INSERT INTO estudiantes (id_estudiante, nom_estudiante, ape_estudiante, estrato, genero_estudiante, ciudad_nac, fecha_nac)
VALUES (2, 'María', 'Gómez', 'IRREGULAR', 'F', 'Guadalajara', TO_DATE('2001-08-22', 'YYYY-MM-DD'));

INSERT INTO estudiantes (id_estudiante, nom_estudiante, ape_estudiante, estrato, genero_estudiante, ciudad_nac, fecha_nac)
VALUES (3, 'Carlos', 'López', 'REGULAR', 'M', 'Monterrey', TO_DATE('1999-11-10', 'YYYY-MM-DD'));

-- Insertar profesores
INSERT INTO profesores (id_profesor, nom_profesor, ape_profesor, titulo, genero_profesor, area)
VALUES (1, 'Roberto', 'Martínez', 'Doctorado en Matemáticas', 'M', 'Matemáticas');

INSERT INTO profesores (id_profesor, nom_profesor, ape_profesor, titulo, genero_profesor, area)
VALUES (2, 'Ana', 'Fernández', 'Maestría en Física', 'F', 'Física');

INSERT INTO profesores (id_profesor, nom_profesor, ape_profesor, titulo, genero_profesor, area)
VALUES (3, 'Luis', 'Sánchez', 'Doctorado en Ingeniería', 'M', 'Ingeniería');

-- Insertar programas
INSERT INTO programas (id_programa, programa, dpto, facultad)
VALUES (1, 'Ingeniería de Software', 'Ingeniería', 'Ciencias Computacionales');

INSERT INTO programas (id_programa, programa, dpto, facultad)
VALUES (2, 'Matemáticas Aplicadas', 'Ciencias', 'Matemáticas');

INSERT INTO programas (id_programa, programa, dpto, facultad)
VALUES (3, 'Física Teórica', 'Ciencias', 'Física');

-- Insertar asignaturas
INSERT INTO asignaturas (id_asignatura, id_profesor, id_curso, nom_asignatura, creditos)
VALUES (1, 1, 101, 'Cálculo Diferencial', 5);

INSERT INTO asignaturas (id_asignatura, id_profesor, id_curso, nom_asignatura, creditos)
VALUES (2, 2, 102, 'Física Cuántica', 6);

INSERT INTO asignaturas (id_asignatura, id_profesor, id_curso, nom_asignatura, creditos)
VALUES (3, 3, 103, 'Programación en C', 4);

-- Insertar matrículas
INSERT INTO matriculas (id_matricula, id_estudiante, id_asignatura, nota)
VALUES (1, 1, 1, 8.5);

INSERT INTO matriculas (id_matricula, id_estudiante, id_asignatura, nota)
VALUES (2, 1, 2, 9.0);

INSERT INTO matriculas (id_matricula, id_estudiante, id_asignatura, nota)
VALUES (3, 1, 3, 9.9);

INSERT INTO matriculas (id_matricula, id_estudiante, id_asignatura, nota)
VALUES (4, 2, 2, 7.8);

INSERT INTO matriculas (id_matricula, id_estudiante, id_asignatura, nota)
VALUES (5, 3, 3, 9.2);

-- Insertar aulas
INSERT INTO aulas (id_aula, nom_aula, ubicacion, capacidad, tipo)
VALUES (1, 'Aula 101', 'Edificio A', 30, 'AULA');

INSERT INTO aulas (id_aula, nom_aula, ubicacion, capacidad, tipo)
VALUES (2, 'Laboratorio 202', 'Edificio B', 20, 'LABORATORIO');

INSERT INTO aulas (id_aula, nom_aula, ubicacion, capacidad, tipo)
VALUES (3, 'Taller 303', 'Edificio C', 25, 'TALLER');

-- Insertar horarios
INSERT INTO horarios (id_horario, id_asignatura, id_aula, dia, hora_inicio, hora_fin)
VALUES (1, 1, 1, 'Lunes', TO_TIMESTAMP('08:00', 'HH24:MI'), TO_TIMESTAMP('10:00', 'HH24:MI'));

INSERT INTO horarios (id_horario, id_asignatura, id_aula, dia, hora_inicio, hora_fin)
VALUES (2, 2, 2, 'Miércoles', TO_TIMESTAMP('10:00', 'HH24:MI'), TO_TIMESTAMP('12:00', 'HH24:MI'));

INSERT INTO horarios (id_horario, id_asignatura, id_aula, dia, hora_inicio, hora_fin)
VALUES (3, 3, 3, 'Viernes', TO_TIMESTAMP('14:00', 'HH24:MI'), TO_TIMESTAMP('16:00', 'HH24:MI'));

-- Insertar grupos
INSERT INTO grupos (id_grupo, id_profesor, id_asignatura, grupo, num_estudiantes)
VALUES (1, 1, 1, 'Grupo A', 25);

INSERT INTO grupos (id_grupo, id_profesor, id_asignatura, grupo, num_estudiantes)
VALUES (2, 2, 2, 'Grupo B', 20);

INSERT INTO grupos (id_grupo, id_profesor, id_asignatura, grupo, num_estudiantes)
VALUES (3, 3, 3, 'Grupo C', 30);

