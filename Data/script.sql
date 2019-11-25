CREATE DATABASE AccentureBiblioteca
GO

USE AccentureBiblioteca;
GO

CREATE TABLE Editoriales
(
	Id int primary key identity(1,1),
	Nombre varchar(100) not null,
)

CREATE TABLE Generos
(
	Id int primary key identity(1,1),
	Nombre varchar(100) not null,
)

CREATE TABLE Libros
(
	Id int primary key identity(1,1),
	ISBN varchar (15) not null UNIQUE,
	Titulo varchar (200) not null,
	Id_Editorial int not null,
	Id_Genero int not null,
	FechaLanzamiento datetime not null,
	CONSTRAINT FK_Editorial FOREIGN KEY (Id_Editorial)
	REFERENCES Editoriales(id),
	CONSTRAINT FK_Genero FOREIGN KEY (Id_Genero)
	REFERENCES Generos(Id)
	ON DELETE CASCADE
)

CREATE TABLE Autores
(
	Id int primary key identity(1,1),
	Nombre varchar(100) not null,
	Contacto varchar(200) not null,
)

CREATE TABLE escritoPor
(
	Id int primary key identity(1,1),
	Id_Autor int not null,
	Id_Libro int not null,
	CONSTRAINT UQ_Autor_Libro UNIQUE (Id_Libro, Id_Autor),
	CONSTRAINT FK_Autor FOREIGN KEY (Id_Autor) 
	REFERENCES Autores(Id),
	CONSTRAINT FK_Libro FOREIGN KEY (Id_Libro) 
	REFERENCES Libros(Id)
	ON DELETE CASCADE
)

SELECT * FROM Editoriales
SELECT * FROM Libros
SELECT * FROM Generos
SELECT * FROM Autores
SELECT * FROM escritoPor

INSERT INTO Editoriales (Nombre)
VALUES
('Astronauta'),
('Aquilina'),
('Atlantida'),
('Bajo la luna'),
('Baltasara'),
('Biblos'),
('Birna'),
('Bruma'),
('Casanova'),
('Chuy'),
('Continente'),
('Entropia')

INSERT INTO Generos (Nombre)
VALUES
('Ciencia Ficcion'),
('Terror'),
('Politica'),
('Novela')

INSERT INTO Libros(ISBN, Titulo, Id_Editorial, Id_Genero, FechaLanzamiento)
VALUES
(9789872562021,'Bambi y sus amigos', 2, 6, CURRENT_TIMESTAMP),
(9789872562011,'Blancanieves', 4, 6, CURRENT_TIMESTAMP),
(9789872562001,'El Rey Leon', 1, 6, CURRENT_TIMESTAMP),
(9789872562301,'Frankenstein', 3, 2, CURRENT_TIMESTAMP),
(9789872562351,'El exorcista', 2, 2, CURRENT_TIMESTAMP),
(9789872562312,'IT', 5, 2, CURRENT_TIMESTAMP),
(9789872562413,'Star Wars XII', 8, 1, CURRENT_TIMESTAMP),
(9789872562319,'Jumanji', 8, 1, CURRENT_TIMESTAMP),
(9789872562317,'The secret of Monkey Island', 5, 1, CURRENT_TIMESTAMP),
(9789872562519,'Mad Max', 5, 1, CURRENT_TIMESTAMP),
(9789872562512,'Yo, Robot', 4, 1, CURRENT_TIMESTAMP),
(9789872562505,'Memorias de una salvaje', 2, 4, CURRENT_TIMESTAMP),
(9789872562515,'Tampoco pido tanto', 6, 4, CURRENT_TIMESTAMP),
(9789872531205,'Ulises', 8, 4, CURRENT_TIMESTAMP),
(9789872531223,'Republica', 10, 3, CURRENT_TIMESTAMP),
(9789872531241,'El principe', 9, 3, CURRENT_TIMESTAMP),
(9789872531232,'Camino de servidumbre', 8, 3, CURRENT_TIMESTAMP),
(9789872531201,'Los crimenes de la calle Morgue', 5, 5, CURRENT_TIMESTAMP),
(9789872531311,'El misterioso caso de Styles', 5, 5, CURRENT_TIMESTAMP),
(9789872530901,'Cuentos de enigmas policiales', 5, 5, CURRENT_TIMESTAMP)


INSERT INTO Autores(Nombre, Contacto)
VALUES
('Edgar Allan Poe', 'edgardpoe@gmail.com'),
('Larry Morey', 'larrymorey@gmail.com'),
('George Lucas', 'georgeylucky@gmail.com'),
('Platon', 'el_platon@gmail.com'),
('Agatha Christie', 'agatha_chris@gmail.com'),
('Stephen King', 'stephen.k@gmail.com'),
('Isaac Asimov', 'isaaAsimov@gmail.com'),
('George Miller', 'georgeMiller@gmail.com'),
('Bebi Fernandez', 'bebiFernandez@gmail.com'),
('Megan Maxwell', 'meganMax@gmail.com'),
('Chris Van Allsburg', 'chrisVanAll@gmail.com')

INSERT INTO escritoPor(Id_Autor, Id_Libro)
VALUES
( 1, 21),
( 5, 20),
( 2, 1),
( 2, 3),
( 2, 4),
( 12, 5),
( 12, 6),
( 6, 7),
( 3, 8),
( 11, 9),
( 3, 10),
( 8, 11),
( 7, 12),
( 9, 13),
( 10, 14),
( 4, 15),
( 4, 16),
( 13, 17),
( 13, 18),
( 1, 19)

