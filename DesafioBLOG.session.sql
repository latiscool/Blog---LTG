-- -- 1. Crear base de datos llamada blog
-- -- **************************************
CREATE DATABASE blog;

-- -- 2. Crear las tablas indicadas de acuerdo al modelo de datos.
-- -- *****************************************************************
CREATE TABLE usuario (
id_usuario SERIAL UNIQUE PRIMARY KEY,
email VARCHAR (35) NOT NULL
);

CREATE TABLE post (
id_post SERIAL UNIQUE PRIMARY KEY,
id_usuario INT,
titulo VARCHAR (50) NOT NULL,
fecha DATE NOT NULL,
FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario)
);

CREATE TABLE comentario(
id_comentario SERIAL UNIQUE PRIMARY KEY,
id_post INT,
id_usuario INT,
texto VARCHAR(35) NOT NULL,
fecha DATE,
FOREIGN KEY (id_post) REFERENCES post (id_post),
FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario)
);

-- -- 3. Insertar los siguientes registros.
-- -- *****************************************
INSERT INTO usuario (email)
VALUES
('usuario01@hotmail.com'),
('usuario02@gmail.com'),
('usuario03@gmail.com'),
('usuario04@hotmail.com'),
('usuario05@yahoo.com'),
('usuario06@hotmail.com'),
('usuario07@yahoo.com'),
('usuario08@yahoo.com'),
('usuario09@yahoo.com');


INSERT INTO post ( id_usuario,titulo,fecha)
VALUES
(1,'Post 1: Esto es malo','2020-06-29'),
(5,'Post 2: Esto es malo','2020-06-20'),
(1,'Post 3: Esto es excelente','2020-05-30'),
(9,'Post 4: Esto es bueno','2020-05-09'),
(7,'Post 5: Esto es bueno','2020-07-10'),
(5,'Post 6: Esto es excelente','2020-07-18'),
(8,'Post 7: Esto es excelente','2020-07-07'),
(5,'Post 8: Esto es excelente','2020-05-14'),
(2,'Post 9: Esto es bueno','2020-05-08'),
(6,'Post 10: Esto es bueno','2020-06-02'),
(4,'Post 11: Esto es bueno','2020-05-05'),
(9,'Post 12: Esto es malo','2020-07-23'),
(5,'Post 13: Esto es excelente','2020-05-30'),
(8,'Post 14: Esto es excelente','2020-05-01'),
(7,'Post 15: Esto es malo','2020-06-17');


INSERT INTO comentario (id_post,id_usuario,texto,fecha)
VALUES
(3,6,'Este es el comentario 1','2020-07-08'),
(4,2,'Este es el comentario 2','2020-06-07'),
(6,4,'Este es el comentario 3','2020-06-16'),
(2,13,'Este es el comentario 4','2020-06-15'),
(6,6,'Este es el comentario 5','2020-05-14'),
(3,3,'Este es el comentario 6','2020-07-08'),
(6,1,'Este es el comentario 7','2020-05-22'),
(6,7,'Este es el comentario 8','2020-07-09'),
(8,13,'Este es el comentario 9','2020-06-30'),
(8,6,'Este es el comentario 10','2020-06-19'),
(5,1,'Este es el comentario 11','2020-05-09'),
(8,15,'Este es el comentario 12','2020-06-17'),
(1,9,'Este es el comentario 13','2020-05-01'),
(2,5,'Este es el comentario 14','2020-05-31'),
(4,3,'Este es el comentario 15','2020-06-28');


-- -- 4. Seleccionar el correo, id y título de todos los post publicados por el usuario 5
-- -- *************************************************************************************

SELECT usuario.email as "CORREO", post.id_post as "ID POST", post.titulo as "TITULO"
FROM usuario, post 
WHERE usuario.id_usuario=5;


-- -- 5. Listar el correo, id y el detalle de todos los comentarios que no hayan sido realizados
-- -- por el usuario con email ​usuario06@hotmail.com​ (el correo usuario06@hotmail.com​ es igual al id_usuario)
-- -- ****************************************************************************************
SELECT usuario.email as "correo", comentario.id_usuario , comentario.texto, comentario.fecha
FROM  usuario, comentario
WHERE  usuario.id_usuario = comentario.id_usuario  AND  comentario.id_usuario <> 6 
ORDER BY id_usuario ASC;


-- -- 6. Listar los usuarios que no han publicado ningún post.
-- -- *************,***********************************************
SELECT usuario.id_usuario AS "USUARIO SIN POST" , post.titulo "SIN POST"  FROM post 
FULL OUTER JOIN usuario
ON post.id_usuario = usuario.id_usuario
WHERE post.id_usuario IS NULL
ORDER BY usuario.id_usuario ASC;


-- -- 7. Listar todos los post con sus comentarios (incluyendo aquellos que no poseen
-- -- comentarios).
-- -- ****************************************************************************

SELECT *FROM post 
LEFT JOIN comentario
ON post.id_post = comentario.id_post
ORDER BY id_comentario ASC;


-- -- 8. Listar todos los usuarios que hayan publicado un post en Junio.
-- -- ********************************************************************
SELECT usuario.id_usuario AS  "ID USUARIO", post.fecha as "POST JUNIO 2020" FROM usuario, post
WHERE usuario.id_usuario=post.id_usuario
AND ( post.fecha BETWEEN '2020-06-01' AND '2020-06-30') ;

