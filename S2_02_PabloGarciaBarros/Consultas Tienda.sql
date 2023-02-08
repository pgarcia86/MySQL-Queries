#Consulta 1
USE Tienda;
SELECT p.nombre FROM producto AS p;

#Consulta 2
SELECT p.nombre, p.precio FROM producto AS p;

#Consulta 3
SELECT * FROM producto;

#Consulta 4
SELECT p.nombre, p.precio AS "Precio En €", (p.precio * 1.08) AS "Precio en USD" FROM producto AS p;

#Consulta 5
SELECT p.nombre AS "Nombre de Producto", p.precio AS Euros, (p.precio * 1.08) AS "Dolares" FROM producto AS p;
    
#Consulta 6
SELECT p.codigo, UPPER(p.nombre) AS "Nombre producto", p.precio, p.codigo_fabricante FROM producto AS p;

#Consulta 7
SELECT p.codigo, LOWER(p.nombre) AS "Nombre producto", p.precio, p.codigo_fabricante FROM producto AS p;
    
#Consulta 8
SELECT p.nombre, UPPER(SUBSTRING(p.nombre, 1, 2)) AS "Primeras letras" FROM producto AS p;

#Consulta 9
SELECT p.nombre, ROUND(p.precio) AS "Precio redondeado"	FROM producto AS p;

#Consulta 10
SELECT p.nombre, TRUNCATE(p.precio, 0) AS "Precio sin Decimales" FROM producto AS p;
    
#Consulta 11
SELECT f.codigo AS "Codigo Fabricante" FROM producto AS p, fabricante AS f WHERE p.codigo_fabricante = f.codigo;

#Consulta 12
SELECT DISTINCT f.codigo AS "Codigo Fabricante" FROM fabricante AS f, producto AS p	WHERE p.codigo_fabricante = f.codigo;
    
#Consulta 13
SELECT f.nombre AS "Nombre Fabricante" FROM fabricante AS f ORDER BY f.nombre ASC;
    
#Consulta 14
SELECT f.nombre AS "Nombre Fabricante" FROM fabricante AS f ORDER BY f.nombre DESC;
    
#Consulta 15
SELECT * FROM producto AS p ORDER BY p.nombre ASC, p.precio DESC;
    
#Consulta 16
SELECT * FROM fabricante LIMIT 5;
    
#Consulta 17
SELECT * FROM fabricante AS f ORDER BY f.codigo DESC LIMIT 4;
    
#Consulta 18
SELECT p.nombre, p.precio FROM producto AS p ORDER BY p.precio ASC LIMIT 1;
    
#Consulta 19
SELECT p.nombre, p.precio FROM producto AS p ORDER BY p.precio DESC LIMIT 1;
    
#Consulta 20
SELECT p.nombre, p.codigo_fabricante FROM producto AS p WHERE p.codigo_fabricante = 2;
    
#Consulta 21
SELECT p.nombre, p.precio, f.nombre FROM producto AS p, fabricante AS f WHERE p.codigo_fabricante = f.codigo;

#Consulta 22
SELECT p.nombre, p.precio, f.nombre	FROM producto AS p, fabricante AS f WHERE p.codigo_fabricante = f.codigo ORDER BY f.nombre;

#Consulta 23
SELECT p.codigo, p.nombre, f.codigo, f.nombre FROM producto AS p, fabricante AS f WHERE p.codigo_fabricante = f.codigo;
    
#Consulta 24
SELECT p.precio, p.nombre AS "Nombre producto", f.nombre AS "Nombre fabricante"	FROM producto AS p, fabricante AS f	WHERE p.codigo_fabricante = f.codigo ORDER BY p.precio ASC LIMIT 1;

#Consulta 25
SELECT p.precio, p.nombre AS "Nombre producto", f.nombre AS "Nombre fabricante"	FROM producto AS p, fabricante AS f WHERE p.codigo_fabricante = f.codigo ORDER BY p.precio DESC LIMIT 1;

#Consulta 26
SELECT p.precio, p.nombre AS "Nombre producto", f.nombre AS "Nombre fabricante" FROM producto AS p, fabricante AS f WHERE f.codigo = p.codigo_fabricante AND f.nombre = "Lenovo";
    
#Consulta 27
SELECT p.precio, p.nombre AS "Nombre producto", f.nombre AS "Nombre fabricante"	FROM producto AS p, fabricante AS f	WHERE f.codigo = p.codigo_fabricante AND f.nombre = "Crucial" AND p.precio > 200;
    
#Consulta 28    
SELECT p.nombre AS "Nombre producto", f.nombre AS "Nombre fabricante" FROM producto AS p, fabricante AS f WHERE f.codigo = p.codigo_fabricante AND( f.nombre = "Asus" OR f.nombre = "Hewlett-Packard" OR f.nombre = "Seagate");
    
#Consulta 29
SELECT p.nombre AS "Nombre producto", f.nombre AS "Nombre fabricante" FROM producto AS p, fabricante AS f WHERE p.codigo_fabricante = f.codigo AND f.nombre IN("Asus", "Hewlett-Packard", "Seagate");

#Consulta 30
SELECT p.nombre AS "Nombre producto", p.precio, f.nombre AS "Nombre fabricante"	FROM producto AS p, fabricante AS f WHERE p.codigo_fabricante = f.codigo AND f.nombre LIKE("%e");
    
#Consulta 31
SELECT p.precio, p.nombre AS "Nombre producto", f.nombre AS "Nombre fabricante"	FROM producto AS p, fabricante AS f WHERE p.codigo_fabricante = f.codigo AND f.nombre LIKE("%w%");
    
#Consulta 32
SELECT p.precio, p.nombre AS "Nombre producto", f.nombre AS "Nombre fabricante"	FROM producto AS p, fabricante AS f WHERE p.codigo_fabricante = f.codigo AND p.precio >= 180 ORDER BY p.precio DESC, p.nombre ASC;
    
#Consulta 33
SELECT DISTINCT f.nombre AS "Nombre fabricante", f.codigo AS "Codigo fabricante" FROM producto AS p, fabricante AS f WHERE p.codigo_fabricante = f.codigo;

#Consulta 34 
SELECT f.nombre, p.nombre FROM fabricante AS f LEFT JOIN producto AS p ON f.codigo = p.codigo_fabricante;

#Consulta 35
SELECT f.nombre FROM fabricante AS f WHERE f.codigo NOT IN (SELECT p.codigo_fabricante FROM producto AS p);

#Consulta 36
SELECT p.nombre AS "Nombre producto", f.nombre AS "Nombre fabricante" FROM producto AS p, fabricante AS f WHERE p.codigo_fabricante = f.codigo AND f.nombre = "Lenovo";

#Consulta 37
SELECT * FROM producto AS p WHERE p.precio IN(SELECT MAX(p.precio) FROM producto AS p WHERE p.codigo_fabricante IN(SELECT f.codigo FROM fabricante AS f	WHERE f.nombre = "Lenovo"));

#Consulta 38
SELECT p.precio, p.nombre AS "Nombre producto", f.nombre AS "Nombre fabricante"	FROM producto AS p, fabricante AS f WHERE p.codigo_fabricante = f.codigo AND f.nombre = "Lenovo" ORDER BY p.precio DESC LIMIT 1;
    
#Consulta 39
SELECT p.precio, p.nombre AS "Nombre producto", f.nombre AS "Nombre fabricante" FROM producto AS p, fabricante AS f WHERE p.codigo_fabricante = f.codigo AND f.nombre = "Hewlett-Packard" ORDER BY p.precio ASC LIMIT 1;

#Consulta 40
SELECT * FROM producto AS p WHERE p.precio BETWEEN(SELECT MAX(p.precio) FROM producto AS p WHERE p.codigo_fabricante IN(SELECT f.codigo	FROM fabricante AS f WHERE f.nombre = "Lenovo")) AND(SELECT MAX(p.precio));
       
#Consulta 41
SELECT * FROM producto AS p INNER JOIN fabricante AS f ON p.codigo_fabricante = f.codigo WHERE p.precio > (SELECT AVG(p.precio) FROM producto AS p WHERE f.nombre = "Asus" AND f.codigo = p.codigo_fabricante);