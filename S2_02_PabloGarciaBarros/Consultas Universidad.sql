USE universidad;

#Consulta 1
SELECT p.nombre, p.apellido1, p.apellido2 FROM persona AS p WHERE p.tipo = "alumno" ORDER BY p.apellido1, p.apellido2, p.nombre;

#Consulta 2
SELECT p.nombre, p.apellido1, p.apellido2 FROM persona AS p WHERE p.tipo = "alumno" AND p.telefono IS NULL;

#Consulta 3
SELECT * FROM persona AS p WHERE YEAR(p.fecha_nacimiento) = 1999 AND p.tipo = "alumno";

#Consulta 4
SELECT * FROM persona AS p WHERE p.tipo = "profesor" AND p.telefono IS NULL AND p.nif LIKE("%K");    

#Consulta 5
SELECT * FROM asignatura AS a WHERE a.cuatrimestre = 1 AND a.curso = 3 AND id_grado = 7;
    
#Consulta 6
SELECT p.apellido1, p.apellido2, p.nombre, d.nombre FROM persona AS p, departamento AS d WHERE p.id = d.id AND p.tipo = "profesor" ORDER BY p.apellido1, p.apellido2, p.nombre;

#Consulta 7
SELECT a.nombre, ce.anyo_inicio, ce.anyo_fin FROM persona AS p, alumno_se_matricula_asignatura AS am, asignatura AS a, curso_escolar AS ce WHERE am.id_alumno = p.id AND p.nif = "26902806M" AND am.id_asignatura = a.id AND ce.id = am.id_curso_escolar;

#Consulta 8
SELECT d.nombre FROM departamento AS d WHERE d.id IN(SELECT p.id_departamento FROM profesor AS p INNER JOIN asignatura AS a ON a.id_profesor = p.id_profesor INNER JOIN grado AS g ON g.id = a.id_grado AND g.nombre = "Grado en Ingeniería Informática (Plan 2015)");

#Consulta 9
SELECT * FROM persona AS p WHERE p.id IN(SELECT am.id_alumno FROM alumno_se_matricula_asignatura AS am WHERE am.id_curso_escolar IN(SELECT ce.id FROM curso_escolar AS ce WHERE ce.anyo_inicio = 2018));
    
#LEFT JOIN/ RIGHT JOIN
#Consulta 1
SELECT p.id, p.apellido1, p.apellido2, p.nombre, p.tipo, d.nombre FROM persona AS p INNER JOIN profesor AS prof ON p.id = prof.id_profesor LEFT JOIN departamento AS d ON d.id = prof.id_departamento ORDER BY d.nombre, p.apellido1, p.nombre;

#Consulta 2    
SELECT * FROM persona AS p LEFT JOIN profesor AS prof ON prof.id_profesor = p.id WHERE p.tipo = "profesor" AND prof.id_profesor IS NULL;

#Consulta 3
SELECT * FROM departamento AS d LEFT JOIN profesor AS prof ON prof.id_departamento = d.id WHERE prof.id_departamento IS NULL;

#Consulta 4
SELECT prof.id_profesor, p.nombre, p.apellido1, p.apellido2	FROM profesor AS prof LEFT JOIN asignatura AS a ON prof.id_profesor = a.id_profesor INNER JOIN persona AS p ON p.id = prof.id_profesor WHERE a.id_profesor IS NULL;
    
#Consulta 5
SELECT * FROM asignatura AS a LEFT JOIN profesor AS prof ON a.id_profesor = prof.id_profesor WHERE a.id_profesor IS NULL;

#Consulta 6
SELECT d.nombre, d.id FROM departamento AS d LEFT JOIN profesor AS prof ON prof.id_departamento = d.id WHERE prof.id_departamento IS NULL;

#Consultas resumen
#Consulta 1
SELECT COUNT(p.id) AS "Cantidad de alumnos" FROM persona AS p WHERE p.tipo = "alumno";

#Consulta 2
SELECT COUNT(p.id) AS "Cantidad personas nacidas en 1999" FROM persona AS p WHERE YEAR (p.fecha_nacimiento) = 1999 AND p.tipo = "alumno";

#Consulta 3
SELECT COUNT(prof.id_profesor) AS "Cantidad de profesores", d.nombre FROM profesor AS prof INNER JOIN departamento AS d ON prof.id_departamento = d.id GROUP BY d.nombre ORDER BY (COUNT(prof.id_profesor)) DESC;

#Consulta 4
SELECT COUNT(prof.id_profesor) AS "Cantidad de profesores", d.nombre FROM profesor AS prof RIGHT JOIN departamento AS d ON prof.id_departamento = d.id GROUP BY d.nombre;

#Consulta 5
SELECT g.id, g.nombre, a.nombre, COUNT(a.id) AS "Cantidad de asignaturas" FROM grado AS g LEFT JOIN asignatura AS a ON g.id = a.id_grado GROUP BY g.nombre ORDER BY (COUNT(a.id)) DESC;

#Consulta 6
SELECT g.nombre, COUNT(a.id) AS "Cantidad de asignaturas" FROM grado AS g INNER JOIN asignatura AS a ON a.id_grado = g.id GROUP BY g.nombre HAVING COUNT(a.id) > 40;

#Consulta 7
SELECT g.nombre, SUM(a.creditos) AS "Cantidad de creditos", a.tipo FROM grado AS g INNER JOIN asignatura AS a ON a.id_grado = g.id GROUP BY g.nombre, a.tipo;

#Consulta 8
SELECT COUNT(am.id_alumno) AS "Cantidad de alumnos", ce.anyo_inicio FROM alumno_se_matricula_asignatura AS am INNER JOIN curso_escolar AS ce ON am.id_curso_escolar = ce.id GROUP BY ce.id;

#Consulta 9
SELECT p.id, p.nombre, p.apellido1, p.apellido2, COUNT(a.id) AS "Cantidad de asignaturas", prof.id_profesor FROM asignatura AS a RIGHT JOIN profesor AS prof ON prof.id_profesor = a.id_profesor INNER JOIN persona AS p ON p.id = prof.id_profesor GROUP BY(p.nombre) ORDER BY (COUNT(a.id)) DESC;

#Consulta 10
SELECT * FROM persona AS p WHERE YEAR (p.fecha_nacimiento) = (SELECT MAX(YEAR(p.fecha_nacimiento)) FROM persona AS p);

#Consulta 11
SELECT d.nombre, prof.id_profesor, p.nombre, p.apellido1, p.apellido2 FROM profesor AS prof INNER JOIN departamento AS d ON d.id = prof.id_departamento INNER JOIN persona AS p ON p.id = prof.id_profesor LEFT JOIN asignatura AS a ON a.id_profesor = prof.id_profesor WHERE a.id_profesor IS NULL;
    