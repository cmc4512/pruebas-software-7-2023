



/*

create database upd_database

use upd_database


USUARIOS
CATEGORIA_PRODUCTO
PRODUCTO
PEDIDO
ENVIOS
DETALLE_CARRITO
CARRITO_COMPRA

DROP TABLE USUARIOS;
DROP TABLE CATEGORIA_PRODUCTO;
DROP TABLE PRODUCTO;
DROP TABLE PEDIDO;
DROP TABLE ENVIO;
DROP TABLE DETALLE_CARRITO;
DROP TABLE CARRITO_COMPRA;


*/


--/////////////////////////USUARIOS///////////////////////////////////////////

IF OBJECT_ID('USUARIOS', 'U') IS NOT NULL 
  DROP TABLE USUARIOS; 
GO

CREATE TABLE USUARIOS
(
  "ID"                          INT IDENTITY(1,1),
  "USER_NAME"                   VARCHAR(40) NOT NULL,
  "NOMBRE_COMPLETO"             VARCHAR(100) NOT NULL,
  "PASSWORD"		            VARCHAR(100) NOT NULL,
  "USUARIO_REGISTRO"            VARCHAR(50) DEFAULT SYSTEM_USER NOT NULL,
  "FECHA_REGISTRO"              DATETIME DEFAULT getdate() NOT NULL,
  "ESTADO_REGISTRO"				INT DEFAULT 1 NOT NULL, 
  CONSTRAINT USUARIOS_PK		PRIMARY KEY (ID)
);

--/////////////////////////CATEGORIA_PRODUCTO///////////////////////////////////////////

IF OBJECT_ID('CATEGORIA_PRODUCTO', 'U') IS NOT NULL 
  DROP TABLE CATEGORIA; 
GO

CREATE TABLE CATEGORIA_PRODUCTO
(
  "ID"								INT IDENTITY(1,1),
  "NOMBRE"							VARCHAR(100) NOT NULL,
  "USUARIO_REGISTRO"				VARCHAR(50) DEFAULT SYSTEM_USER NOT NULL,
  "FECHA_REGISTRO"					DATETIME DEFAULT getdate() NOT NULL,
  "ESTADO_REGISTRO"					INT DEFAULT 1 NOT NULL, 
  CONSTRAINT CATEGORIA_PRODUCTO_PK	PRIMARY KEY (ID)
);

--/////////////////////////PRODUCTO///////////////////////////////////////////

IF OBJECT_ID('PRODUCTO', 'U') IS NOT NULL 
  DROP TABLE PRODUCTO; 
GO

CREATE TABLE PRODUCTO
(
  "ID"                          INT IDENTITY(1,1),
  "NOMBRE"						VARCHAR(100) NOT NULL,
  "ID_CATEGORIA"				INT NOT NULL,
  "USUARIO_REGISTRO"            VARCHAR(50) DEFAULT SYSTEM_USER NOT NULL,
  "FECHA_REGISTRO"              DATETIME DEFAULT getdate() NOT NULL,
  "ESTADO_REGISTRO"				INT DEFAULT 1 NOT NULL, 
  CONSTRAINT PRODUCTO_PK		PRIMARY KEY (ID)
);

ALTER TABLE PRODUCTO
  ADD CONSTRAINT "FK_PRODUCTO_TO_CATEGORIA_PRODUCTO" 
  FOREIGN KEY(ID_CATEGORIA)
  REFERENCES CATEGORIA_PRODUCTO("ID");


  --/////////////////////////PEDIDOS///////////////////////////////////////////

 IF OBJECT_ID('PEDIDO', 'U') IS NOT NULL 
  DROP TABLE PEDIDO; 
GO

CREATE TABLE PEDIDO
(
  "ID"                          INT IDENTITY(1,1),
  "ID_USUARIO"                  INT NOT NULL,
  "ID_ENVIO"                    INT NOT NULL,
  "FECHA_PEDIDO"                DATETIME NOT NULL,
  "CANTIDAD"                    INT DEFAULT 1 NOT NULL,
  "ESTADO"                      VARCHAR(50) NOT NULL,
  "USUARIO_REGISTRO"            VARCHAR(50) DEFAULT SYSTEM_USER NOT NULL,
  "FECHA_REGISTRO"              DATETIME DEFAULT getdate() NOT NULL,
  "ESTADO_REGISTRO"             INT DEFAULT 1 NOT NULL, 
  CONSTRAINT PEDIDO_PK          PRIMARY KEY (ID),
  CONSTRAINT FK_PEDIDO__TO_ENVIO    FOREIGN KEY (ID_ENVIO) REFERENCES PEDIDO(ID),
  CONSTRAINT FK_PEDIDO__TO_USUARIO  FOREIGN KEY (ID_USUARIO) REFERENCES USUARIOS(ID)
);


      --/////////////////////////ENVIO///////////////////////////////////////////

  IF OBJECT_ID('ENVIO', 'U') IS NOT NULL 
  DROP TABLE ENVIO; 
GO

CREATE TABLE ENVIO
(
  "ID"                          INT IDENTITY(1,1),
  "NOMBRE_PRODUCTO"             VARCHAR(100) NOT NULL,
  "DIRECCION"                   VARCHAR(50) NOT NULL,
  "CANTIDAD"                    VARCHAR(50) NOT NULL,
  "USUARIO_REGISTRO"            VARCHAR(50) DEFAULT SYSTEM_USER NOT NULL,
  "FECHA_REGISTRO"              DATETIME DEFAULT getdate() NOT NULL,
  "ESTADO_REGISTRO"             INT DEFAULT 1 NOT NULL, 
  CONSTRAINT ENVIO_PK           PRIMARY KEY (ID)
);



--/////////////////////////CARRITO_COMPRA///////////////////////////////////////////

IF OBJECT_ID('CARRITO_COMPRA', 'U') IS NOT NULL 
  DROP TABLE CARRITO_COMPRA; 
GO

CREATE TABLE CARRITO_COMPRA
(
  "ID"                          INT IDENTITY(1,1),
  "FECHA"						            DATETIME NOT NULL,
  "ID_USUARIO"					        INT NOT NULL,
  "USUARIO_REGISTRO"            VARCHAR(50) DEFAULT SYSTEM_USER NOT NULL,
  "FECHA_REGISTRO"              DATETIME DEFAULT getdate() NOT NULL,
  "ESTADO_REGISTRO"				INT DEFAULT 1 NOT NULL, 
  CONSTRAINT CARRITO_COMPRA_PK		PRIMARY KEY (ID)
);

ALTER TABLE CARRITO_COMPRA
  ADD CONSTRAINT "FK_CARRITO_COMPRA_TO_USUARIO" 
  FOREIGN KEY("ID_USUARIO")
  REFERENCES USUARIOS("ID");


--/////////////////////////DETALLE_CARRITO///////////////////////////////////////////

IF OBJECT_ID('DETALLE_CARRITO', 'U') IS NOT NULL 
  DROP TABLE DETALLE_CARRITO; 
GO

CREATE TABLE DETALLE_CARRITO
(
  "ID"								INT IDENTITY(1,1),
  "CANTIDAD"						INT NOT NULL,
  "ID_PRODUCTO"						INT NOT NULL,
  "ID_CARRITO_COMPRA"				INT NOT NULL,
  "USUARIO_REGISTRO"				VARCHAR(50) DEFAULT SYSTEM_USER NOT NULL,
  "FECHA_REGISTRO"					DATETIME DEFAULT getdate() NOT NULL,
  "ESTADO_REGISTRO"					INT DEFAULT 1 NOT NULL, 
  CONSTRAINT DETALLE_CARRITO_PK		PRIMARY KEY (ID)
);

ALTER TABLE DETALLE_CARRITO
  ADD CONSTRAINT "FK_DETALLE_CARRITO_TO_PRODUCTO" 
  FOREIGN KEY("ID_PRODUCTO")
  REFERENCES PRODUCTO("ID");

ALTER TABLE DETALLE_CARRITO
  ADD CONSTRAINT "FK_DETALLE_CARRITO_TO_CARRITO_COMPRA" 
  FOREIGN KEY("ID_CARRITO_COMPRA")
  REFERENCES CARRITO_COMPRA("ID");


  

/*


select * from USUARIOS
select * from CATEGORIA_PRODUCTO
select * from PRODUCTO
select * from PEDIDOS
select * from ENVIOS
select * from CARRITO_COMPRA




INSERT INTO [dbo].[USUARIOS]([USER_NAME], [NOMBRE_COMPLETO], [PASSWORD]) VALUES 
    ('usuario1', 'Juan Pérez', 'clave123'),   ('usuario2', 'María López', 'contraseña456'), ('usuario3', 'Carlos Rodríguez', 'pass789'),
    ('usuario4', 'Ana García', 'secreto123'), ('usuario5', 'Luis Martínez', '123abc'),      ('usuario6', 'Laura Sánchez', 'qwerty'),
    ('usuario7', 'Diego Ramírez', 'abcdef'),  ('usuario8', 'Elena Torres', 'pass123'),      ('usuario9', 'Sergio González', 'p@ssw0rd'),
    ('usuario10', 'Isabel Fernández', 'secure123'), ('usuario11', 'Pedro Morales', 'qwerty123'), ('usuario12', 'Carmen Ortiz', 'contraseña123'),
    ('usuario13', 'Andrés Navarro', 'abc123'),  ('usuario14', 'Raquel Jiménez', 'passpass'),    ('usuario15', 'Hugo Vargas', '123456'),
    ('usuario16', 'Renata Mendoza', 'mipass'),   ('usuario17', 'Fernando Delgado', 'password1'), ('usuario18', 'Lucía Silva', 'securepass'),
    ('usuario19', 'Martín Ríos', 'pass1234'),   ('usuario20', 'Valeria Paredes', 'test123'),     ('usuario21', 'Javier Cárdenas', '123qwe'),
    ('usuario22', 'Lorena Aguilar', 'mypass123'),('usuario23', 'Roberto Núñez', 'clave456'),     ('usuario24', 'Ana Beltrán', 'password123'),
    ('usuario25', 'Miguel Sosa', 'secure456'),   ('usuario26', 'Natalia Cruz', 'contraseña789'),  ('usuario27', 'Óscar Ponce', 'abc456'),
    ('usuario28', 'Julia Torres', 'passpass123'), ('usuario29', 'Emilio Velasco', '654321'),      ('usuario30', 'Carolina Mora', 'qazwsx'),
    ('usuario31', 'Eduardo Ramírez', 'eduardo123'),('usuario32', 'Marina González', 'marina456'), ('usuario33', 'Héctor Morales', 'hectorpass'),
    ('usuario34', 'Diana Martínez', 'diana789'),  ('usuario35', 'Pablo Sánchez', 'pablo123'),      ('usuario36', 'Laura Vargas', 'laura456'),
    ('usuario37', 'Martín Delgado', 'martinpass'), ('usuario38', 'Valentina Ríos', 'valentina789'), ('usuario39', 'Sebastián Cárdenas', 'sebastian123'),
    ('usuario40', 'Camila Aguilar', 'camila456'),   ('usuario41', 'Andrés Núñez', 'andrespass'),     ('usuario42', 'Isabella Beltrán', 'isabella789'),
    ('usuario43', 'Miguel Sosa', 'miguelpass'),     ('usuario44', 'Sofía Cruz', 'sofiapass'),        ('usuario45', 'Matías Ponce', 'matias123'),
    ('usuario46', 'Renata Torres', 'renatapass'),   ('usuario47', 'Lucas Velasco', 'lucas456'),      ('usuario48', 'Valeria Mora', 'valeriapass'),
    ('usuario49', 'Joaquín Ramírez', 'joaquin123'), ('usuario50', 'Amanda González', 'amandapass'),   ('usuario51', 'Emilio Morales', 'emilio789'),
    ('usuario52', 'Catalina Martínez', 'catalinapass'), ('usuario53', 'Agustín Sánchez', 'agustin123'), ('usuario54', 'Olivia Vargas', 'oliviapass'),
    ('usuario55', 'Dante Delgado', 'dantepass'),    ('usuario56', 'Mía Ríos', 'miapass'),              ('usuario57', 'Santiago Cárdenas', 'santiagopass'),
    ('usuario58', 'Luna Aguilar', 'lunapass'),      ('usuario59', 'Benjamín Núñez', 'benjamin123'),     ('usuario60', 'Renata Beltrán', 'renatapass'),
    ('usuario61', 'Eduardo Ramírez', 'eduardo123'), ('usuario62', 'Marina González', 'marina456'),      ('usuario63', 'Héctor Morales', 'hectorpass'),
    ('usuario64', 'Diana Martínez', 'diana789'),      ('usuario65', 'Pablo Sánchez', 'pablo123'),     ('usuario66', 'Laura Vargas', 'laura456'),
    ('usuario67', 'Martín Delgado', 'martinpass'),    ('usuario68', 'Valentina Ríos', 'valentina789'),  ('usuario69', 'Sebastián Cárdenas', 'sebastian123'),
    ('usuario70', 'Camila Aguilar', 'camila456'),   ('usuario71', 'Andrés Núñez', 'andrespass'),    ('usuario72', 'Isabella Beltrán', 'isabella789'),
    ('usuario73', 'Miguel Sosa', 'miguelpass'),   ('usuario74', 'Sofía Cruz', 'sofiapass'),        ('usuario75', 'Matías Ponce', 'matias123'),
    ('usuario76', 'Renata Torres', 'renatapass'),  ('usuario77', 'Lucas Velasco', 'lucas456'),       ('usuario78', 'Valeria Mora', 'valeriapass'),
    ('usuario79', 'Joaquín Ramírez', 'joaquin123'), ('usuario80', 'Amanda González', 'amandapass'),   ('usuario81', 'Emilio Morales', 'emilio789'),
    ('usuario82', 'Catalina Martínez', 'catalinapass'), ('usuario83', 'Agustín Sánchez', 'agustin123'),  ('usuario84', 'Olivia Vargas', 'oliviapass'),
    ('usuario85', 'Dante Delgado', 'dantepass'),     ('usuario86', 'Mía Ríos', 'miapass'),   ('usuario87', 'Santiago Cárdenas', 'santiagopass'),
    ('usuario88', 'Luna Aguilar', 'lunapass'),      ('usuario89', 'Benjamín Núñez', 'benjamin123'),     ('usuario90', 'Renata Beltrán', 'renatapass'),
    ('usuario91', 'Eduardo Ramírez', 'eduardo123'),  ('usuario92', 'Marina González', 'marina456'),     ('usuario93', 'Héctor Morales', 'hectorpass'),
    ('usuario94', 'Diana Martínez', 'diana789'),     ('usuario95', 'Pablo Sánchez', 'pablo123'),        ('usuario96', 'Laura Vargas', 'laura456'),
    ('usuario97', 'Martín Delgado', 'martinpass'),   ('usuario98', 'Valentina Ríos', 'valentina789'),  ('usuario99', 'Sebastián Cárdenas', 'sebastian123'),
    ('usuario100', 'Camila Aguilar', 'camila456')



INSERT INTO [dbo].[CATEGORIA_PRODUCTO]([NOMBRE]) VALUES 

    ('Electrónica'), ('Ropa'), ('Hogar'), ('Alimentos'), ('Juguetes'), ('Deportes'), ('Belleza'), ('Muebles'), ('Automóviles'), ('Libros'), ('Electrodomésticos'),
    ('Informática'),('Mascotas'), ('Joyería'),('Farmacia'), ('Instrumentos Musicales'), ('Bebés'), ('Jardinería'), ('Arte y Manualidades'), ('Viajes'), ('Cine y TV'),
    ('Bricolaje'), ('Salud'), ('Fotografía'), ('Relojes'), ('Videojuegos'), ('Oficina'), ('Moda'), ('Electrodomésticos'), ('Herramientas'), ('Música'), ('Deportes Acuáticos'),
    ('Camping'), ('Fitness'), ('Ropa Deportiva'), ('Cocina'), ('Electrónica'), ('Hogar'), ('Juguetes'), ('Belleza'), ('Electrónica'), ('Ropa'), ('Hogar'), ('Alimentos'),
    ('Juguetes'), ('Deportes'), ('Belleza'), ('Muebles'), ('Automóviles'), ('Libros'), ('Electrodomésticos'), ('Informática'), ('Mascotas'), ('Joyería'), ('Farmacia'),
    ('Instrumentos Musicales'),('Bebés'), ('Jardinería'), ('Arte y Manualidades'), ('Viajes'), ('Cine y TV'), ('Bricolaje'), ('Salud'), ('Fotografía'),('Relojes'),
    ('Videojuegos'),('Oficina'),  ('Moda'),  ('Electrodomésticos'),  ('Herramientas'),  ('Música'),  ('Deportes Acuáticos'),  ('Camping'),  ('Fitness'),  ('Ropa Deportiva'),
    ('Cocina'), ('Electrónica'), ('Hogar'), ('Juguetes'), ('Belleza'), ('Electrónica'), ('Ropa'), ('Hogar'), ('Alimentos'), ('Juguetes'), ('Deportes'), ('Belleza'),
    ('Muebles'), ('Automóviles'),('Libros'),('Electrodomésticos'),('Informática'),('Mascotas'),('Joyería'),('Farmacia'),('Instrumentos Musicales'),('Bebés'),
    ('Jardinería'),('Arte y Manualidades'),('Viajes')


INSERT INTO [dbo].[PRODUCTO]([NOMBRE], [ID_CATEGORIA]) VALUES 

    ('Producto 1', 1), ('Producto 2', 1), ('Producto 3', 2),('Producto 4', 2), ('Producto 5', 3), ('Producto 6', 3),  ('Producto 7', 4), ('Producto 8', 4),
    ('Producto 9', 5), ('Producto 10', 5), ('Producto 11', 1),('Producto 12', 1),('Producto 13', 2),('Producto 14', 2),('Producto 15', 3),('Producto 16', 3),
    ('Producto 17', 4),('Producto 18', 4),('Producto 19', 5),('Producto 20', 5),('Producto 21', 1),('Producto 22', 1),('Producto 23', 2),('Producto 24', 2),
    ('Producto 25', 3),('Producto 26', 3),('Producto 27', 4),('Producto 28', 4),('Producto 29', 5),('Producto 30', 5),('Producto 31', 1),('Producto 32', 1),
    ('Producto 33', 2),('Producto 34', 2),('Producto 35', 3),('Producto 36', 3),('Producto 37', 4),('Producto 38', 4),('Producto 39', 5),('Producto 40', 5),
    ('Producto 41', 1),('Producto 42', 1),('Producto 43', 2),('Producto 44', 2),('Producto 45', 3),('Producto 46', 3),('Producto 47', 4),('Producto 48', 4),
    ('Producto 49', 5), ('Producto 50', 5), ('Producto 51', 1),('Producto 52', 1),('Producto 53', 2),('Producto 54', 2),('Producto 55', 3),('Producto 56', 3),
    ('Producto 57', 4),('Producto 58', 4), ('Producto 59', 5), ('Producto 60', 5), ('Producto 61', 1), ('Producto 62', 1), ('Producto 63', 2), ('Producto 64', 2),
    ('Producto 65', 3),('Producto 66', 3),('Producto 67', 4),('Producto 68', 4),('Producto 69', 5),('Producto 70', 5),('Producto 71', 1),('Producto 72', 1),
    ('Producto 73', 2), ('Producto 74', 2), ('Producto 75', 3), ('Producto 76', 3), ('Producto 77', 4), ('Producto 78', 4), ('Producto 79', 5), ('Producto 80', 5),
    ('Producto 81', 1), ('Producto 82', 1), ('Producto 83', 2), ('Producto 84', 2), ('Producto 85', 3), ('Producto 86', 3), ('Producto 87', 4), ('Producto 88', 4),
    ('Producto 89', 5), ('Producto 90', 5), ('Producto 91', 1), ('Producto 92', 1), ('Producto 93', 2), ('Producto 94', 2), ('Producto 95', 3), ('Producto 96', 3),
    ('Producto 97', 4), ('Producto 98', 4), ('Producto 99', 5), ('Producto 100', 5)


INSERT INTO [dbo].[ENVIO]([NOMBRE_PRODUCTO], [DIRECCION], [CANTIDAD]) VALUES 

 ('Producto 1', 'Dirección 1', 10), 
 ('Producto 2', 'Dirección 2', 2),
 ('Producto 3', 'Dirección 3', 20) 


  INSERT INTO [dbo].[PEDIDO]([ID_USUARIO], [ID_ENVIO], [FECHA_PEDIDO], [CANTIDAD], [ESTADO]) VALUES 
     (1, 1, '2023-08-02',  5, 'FRAGIL'),
     (2, 2, '2023-08-03',  8, 'DELICADO'),
     (3, 3, '2023-08-04',  6, 'SOLIDO') 






INSERT INTO [dbo].[CARRITO_COMPRA]([FECHA], [ID_USUARIO]) VALUES
('2023-08-09', 1001), ('2023-08-09', 1002), ('2023-08-08', 1001), ('2023-08-08', 1003), ('2023-08-07', 1002), ('2023-08-07', 1003), ('2023-08-06', 1004), 
('2023-08-06', 1001), ('2023-08-05', 1005), ('2023-08-05', 1002), ('2023-08-04', 1003), ('2023-08-04', 1001), ('2023-08-03', 1002), ('2023-08-03', 1006),
('2023-08-02', 1004), ('2023-08-02', 1007), ('2023-08-01', 1003), ('2023-08-01', 1002), ('2023-07-31', 1005), ('2023-07-31', 1001), ('2023-07-30', 1006),
('2023-07-30', 1002), ('2023-07-29', 1004), ('2023-07-29', 1001), ('2023-07-28', 1003), ('2023-07-28', 1002), ('2023-07-27', 1005), ('2023-07-27', 1001), 
('2023-07-26', 1006), ('2023-07-26', 1002), ('2023-07-25', 1004), ('2023-07-25', 1001), ('2023-07-24', 1003), ('2023-07-24', 1002), ('2023-07-23', 1001),
('2023-07-23', 1002), ('2023-07-22', 1003), ('2023-07-22', 1004), ('2023-07-21', 1005), ('2023-07-21', 1001), ('2023-07-20', 1002), ('2023-07-20', 1006),
('2023-07-19', 1004), ('2023-07-19', 1001), ('2023-07-18', 1003), ('2023-07-18', 1002),  ('2023-07-17', 1005),  ('2023-07-17', 1001), ('2023-07-16', 1006),
('2023-07-16', 1002), ('2023-07-15', 1004), ('2023-07-15', 1001), ('2023-07-14', 1003), ('2023-07-14', 1002), ('2023-07-13', 1005), ('2023-07-13', 1001),
('2023-07-12', 1006), ('2023-07-12', 1002), ('2023-07-11', 1004), ('2023-07-11', 1001), ('2023-07-10', 1003), ('2023-07-10', 1002), ('2023-07-09', 1005), 
('2023-07-09', 1001), ('2023-07-08', 1006), ('2023-07-08', 1002), ('2023-07-07', 1004), ('2023-07-07', 1001), ('2023-07-06', 1003), ('2023-07-06', 1002),
('2023-07-05', 1005), ('2023-07-05', 1001), ('2023-07-04', 1006), ('2023-07-04', 1002), ('2023-07-03', 1004), ('2023-07-03', 1001), ('2023-07-02', 1003),
('2023-07-02', 1002), ('2023-07-01', 1005), ('2023-07-01', 1001), ('2023-06-30', 1002), ('2023-06-30', 1003), ('2023-06-29', 1004), ('2023-06-29', 1005),
('2023-06-28', 1006), ('2023-06-28', 1001), ('2023-06-27', 1002), ('2023-06-27', 1003), ('2023-06-26', 1004), ('2023-06-26', 1005), ('2023-06-25', 1006),
('2023-06-25', 1001),  ('2023-06-24', 1002), ('2023-06-24', 1003), ('2023-06-23', 1004), ('2023-06-23', 1005), ('2023-06-22', 1006), ('2023-06-22', 1001),
('2023-06-21', 1002), ('2023-06-21', 1003)



INSERT INTO [dbo].[DETALLE_CARRITO]([CANTIDAD], [ID_PRODUCTO], [ID_CARRITO_COMPRA]) VALUES 
    (2, 201, 1),(3, 202, 2),(1, 203, 1), (4, 204, 3), (2, 205, 2), (3, 206, 1), (1, 207, 2), (4, 208, 3), (2, 209, 1), (3, 210, 2),(1, 211, 3), (2, 212, 1), (3, 213, 2),
    (4, 214, 3), (1, 215, 1), (2, 216, 2), (3, 217, 3), (1, 218, 1), (4, 219, 2), (2, 220, 3), (3, 221, 1), (1, 222, 2), (4, 223, 3), (2, 224, 1), (3, 225, 2), (1, 226, 3),
    (2, 227, 1), (3, 228, 2), (4, 229, 3), (1, 230, 1), (2, 231, 2), (3, 232, 3), (1, 233, 1), (4, 234, 2), (2, 235, 3), (3, 236, 1), (1, 237, 2), (4, 238, 3), (2, 239, 1),
    (3, 240, 2), (1, 241, 3), (2, 242, 1), (3, 243, 2), (4, 244, 3), (1, 245, 1), (2, 246, 2), (3, 247, 3), (1, 248, 1), (4, 249, 2), (2, 250, 3),(2, 101, 1),(3, 102, 2),
    (1, 103, 1),(4, 104, 3),(2, 105, 2),(3, 106, 1),(1, 107, 2),(4, 108, 3),(2, 109, 1),(3, 110, 2),(1, 111, 3),(2, 112, 1),(3, 113, 2),(4, 114, 3),(1, 115, 1),(2, 116, 2),
    (3, 117, 3),(1, 118, 1),(4, 119, 2),(2, 120, 3),(3, 121, 1),(1, 122, 2),(4, 123, 3),(2, 124, 1),(3, 125, 2),(21, 126, 3), (2, 127, 1), (3, 128, 2), (4, 129, 3), (1, 130, 1),
    (3, 131, 2),(2, 132, 3),(1, 133, 1),(4, 134, 2),(2, 135, 3),(3, 136, 1),(1, 137, 2),(4, 138, 3),(2, 139, 1),(3, 140, 2),(1, 141, 3),(2, 142, 1),(3, 143, 2),(4, 144, 3),
    (1, 145, 1),(2, 146, 2),(3, 147, 3),(41, 148, 1),(44, 149, 2), (2, 150, 3)

















 "USUARIO_REGISTRO" -> UsuariosRegistro



*/
