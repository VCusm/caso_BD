	-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-04-2026 a las 05:44:41
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO"; -- Sólo al insertar NULL se genera el siguiente num en AUTO_INCREMENT 
START TRANSACTION;
SET time_zone = "+00:00"; -- Muestra el tiempo en UTC

-- Drop tables en caso de que ya existan las tablas para que no aparezca
-- el error de que tabla ya existente
DROP TABLE IF EXISTS Regiones;
DROP TABLE IF EXISTS Sedes;
DROP TABLE IF EXISTS TamañoEmpresa;
DROP TABLE IF EXISTS TipoPersona;
DROP TABLE IF EXISTS EstadoPostulacion;
DROP TABLE IF EXISTS AdministradorCT;

DROP TABLE IF EXISTS AntecedentePostulacion;
DROP TABLE IF EXISTS AntecedenteIniciativa;
DROP TABLE IF EXISTS Empresa;
DROP TABLE IF EXISTS Cronograma;
DROP TABLE IF EXISTS Etapa;
DROP TABLE IF EXISTS EquipoTrabajo;
DROP TABLE IF EXISTS PersonaEquipo;
DROP TABLE IF EXISTS PostulacionIniciativaCT;

-- agregando las tablas de normalizacion UwU
DROP TABLE IF EXISTS Departamento;
DROP TABLE IF EXISTS Roles;
DROP TABLE IF EXISTS Jefes;
DROP TABLE IF EXISTS Coordinadores;
DROP TABLE IF EXISTS Representantes;

#####################################################################
########## Creación de Catálogos ####################################
#####################################################################

START TRANSACTION;
CREATE TABLE Regiones (
  id INT PRIMARY KEY AUTO_INCREMENT,
  descripcion VARCHAR(30) UNIQUE NOT NULL
);

INSERT INTO Regiones (descripcion) VALUES
('Tarapacá'), -- 1
('Antofagasta'), -- 2
('Atacama'), -- 3
('Coquimbo'), -- 4
('Valparaíso'), -- 5
('Libertador General OHiggins'), -- 6
('Maule'), -- 7
('Biobío'),('Araucanía'),('Los Lagos'),('Aysén'),('Magallanes'),
('Metropolitana'), -- 13
('Los Ríos'), -- 14
('Arica y Parinacota'); -- 15

CREATE TABLE Sedes (
  id INT PRIMARY KEY AUTO_INCREMENT,
  descripcion VARCHAR(15) UNIQUE NOT NULL
);

INSERT INTO Sedes(descripcion) VALUES 
('Casa Central'), -- 1
('San Joaquin'), -- 2
('Vitacura'), -- 3
('Viña del Mar'), -- 4
('Concepción'); -- 5

CREATE TABLE TamañoEmpresa (  
  id INT PRIMARY KEY AUTO_INCREMENT,
  descripcion VARCHAR(13) UNIQUE NOT NULL
);

INSERT INTO TamañoEmpresa(descripcion) VALUES 
('Microempresa'), -- 1
('Mediana'), -- 2
('Grande'); -- 3

CREATE TABLE TipoPersona (
  id INT PRIMARY KEY AUTO_INCREMENT,
  descripcion VARCHAR(13) UNIQUE NOT NULL
);

INSERT INTO TipoPersona(descripcion) VALUES
('Estudiante'),
('Profesor');

CREATE TABLE EstadoPostulacion (
  id INT PRIMARY KEY AUTO_INCREMENT,
  descripcion VARCHAR(30) UNIQUE NOT NULL
);

INSERT INTO EstadoPostulacion(descripcion) VALUES
('Revision'),
('Aprobada'),
('Rechada'),
('Cerrada');

-- creacion catálogo Departamentos para normalizar el campo deptoOArea de la tabla PersonaEquipo y evitar redudancia de datos.
CREATE TABLE Departamento (
  id INT PRIMARY KEY AUTO_INCREMENT,
  descripcion VARCHAR(255) UNIQUE NOT NULL
);

INSERT INTO Departamento (descripcion) VALUES 
('Medicina'), ('Informatica'), ('Matematicas'), ('Física'), ('Economía'), 
('Civil'), ('Electrónica'), ('Industrial'), ('Mecánica'), ('Química'), 
('Comercial'), ('Diseño'), ('Arquitectura'), ('Música'), ('Teatro'), 
('Periodismo'), ('Psicología'), ('Antropología'), ('Bioquímica'), ('Sociología'), 
('Historia'), ('Biología'), ('Geografía'), ('Filosofía'), ('Letras'), 
('Enfermería'), ('Kinesiología'), ('Nutrición'), ('Odontología'), ('Veterinaria'), 
('Agronomía'), ('Forestal'), ('Ambiental'), ('Alimentos'), ('Acuicultura'), 
('Astronomía'), ('Meteorología'), ('Oceanografía'), ('Computación'), ('Geología'), 
('Pesca'), ('Recursos Hídricos'), ('Ciencia de Datos');

-- creacion catálogo Roles para normalizar el campo rolQueCumple de la tabla PersonaEquipo y evitar redudancia de datos.
CREATE TABLE Roles (
  id INT PRIMARY KEY AUTO_INCREMENT,
  descripcion VARCHAR(255) UNIQUE NOT NULL
);

INSERT INTO Roles (descripcion) VALUES 
('Gestión de instrumentos'), ('Organizador de eventos'), ('Presentador de eventos'), 
('Bodega'), ('Ayudante'), ('Ayudante 2'), ('Ayudante 3'), ('Técnico'), 
('Ayudante coordinador'), ('Profesor Asistente'), ('Profesor Titular'), 
('Jefe de Proyecto'), ('Investigador'), ('Coordinador'), ('Estudiante Ayudante'), 
('Monitor'), ('Profesor Visitante'), ('Jefe Ayudantía'), ('Profesor Guía'), 
('Coordinador Ayudantes'), ('Profesor Asociado'), ('Profesor'), ('Jefe de Laboratorio'), 
('Profesor Clínico'), ('Monitor Académico'), ('Profesor Investigador'), ('Profesor Joven');

-- para el acceso de los administradores que administran a los coordinadores de proyectos

CREATE TABLE AdministradorCT (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(100) UNIQUE NOT NULL,
  contrasena VARCHAR(255) NOT NULL,
  email VARCHAR(255) DEFAULT NULL
);

INSERT INTO AdministradorCT (nombre, contrasena, email) VALUES
('admin', 'admin123', 'admin@ct-usm.cl'); -- 1

COMMIT;

############################################################################
#################### Creación de tablas ####################################
############################################################################

START TRANSACTION;

#################### parte de normalización UwU ######################

-- creacion de tablas para normalizar los campos jefeCarrera y coordinadorProyectos de la tabla AntecedentePostulacion y evitar redudancia de datos.
CREATE TABLE Jefes (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(255) NOT NULL
);

CREATE TABLE Coordinadores (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(255) NOT NULL,
  activo TINYINT(1) NOT NULL DEFAULT 1 -- 1 activo, 0 inactivo
);

CREATE TABLE Representantes (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(255) NOT NULL
); 

#################### fin parte de normalización ######################

CREATE TABLE AntecedentePostulacion (
  id INT PRIMARY KEY AUTO_INCREMENT, -- id es postulacionNum
  fecha DATE NOT NULL,
  
  -- para acceder al catálogo de sedes
  idSedes INT NOT NULL,
  FOREIGN KEY (idSedes) REFERENCES Sedes(id),
  
  -- para acceder al catálogo de regiones
  idRegionesEjecucion INT NOT NULL,
  FOREIGN KEY (idRegionesEjecucion) REFERENCES Regiones(id),

  idJefes INT NOT NULL, -- UWU
  FOREIGN KEY (idJefes) REFERENCES Jefes(id),
  
  idCoordinadores INT NOT NULL, -- UWU
  FOREIGN KEY (idCoordinadores) REFERENCES Coordinadores(id),
  
  codigo INT(11) UNIQUE NOT NULL, 
  iniciativaEsNueva TINYINT(1) NOT NULL, -- TINYINT(1) actúa como BOOL

  -- para acceder al catálogo de regiones
  idRegionesImpacto INT NOT NULL,
  FOREIGN KEY (idRegionesImpacto) REFERENCES Regiones(id)

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE AntecedenteIniciativa (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nombreIniciativa VARCHAR(255) NOT NULL,
  objetivo VARCHAR(255) NOT NULL, 
  soluciones VARCHAR(255) NOT NULL,
  resultadosEsperados VARCHAR(255) NOT NULL,
  otrosDocs VARCHAR(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE Empresa (
  id CHAR(9) PRIMARY KEY, -- rutEmpresa es id
  nombre VARCHAR(255) NOT NULL,
  idRepresentantes INT NOT NULL, -- UWU
  FOREIGN KEY (idRepresentantes) REFERENCES Representantes(id),


  idTamañoEmpresa INT NOT NULL,
  FOREIGN KEY (idTamañoEmpresa) REFERENCES TamañoEmpresa(id),

  convenio TINYINT(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE Cronograma (
  id INT PRIMARY KEY AUTO_INCREMENT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE Etapa (
  id INT PRIMARY KEY AUTO_INCREMENT,
  etapa VARCHAR(255) NOT NULL,
  idCronograma INT,
  FOREIGN KEY (idCronograma) REFERENCES Cronograma(id),
  plazoSemanas INT(11) NOT NULL,
  entregable VARCHAR(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE EquipoTrabajo (
  id INT PRIMARY KEY AUTO_INCREMENT 
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE PersonaEquipo (
  id CHAR(9) PRIMARY KEY, -- rut es id

  idEquipoTrabajo INT,
  FOREIGN KEY (idEquipoTrabajo) REFERENCES EquipoTrabajo(id),
  
  nombre VARCHAR(255) NOT NULL,

  idDepartamento INT, -- normalizacion por acá
  FOREIGN KEY (idDepartamento) REFERENCES Departamento(id),

  idSedes INT NOT NULL,
  FOREIGN KEY (idSedes) REFERENCES Sedes(id),

  email VARCHAR(255) DEFAULT NULL,
  telefono VARCHAR(255) DEFAULT NULL,

  idRoles INT,
  FOREIGN KEY (idRoles) REFERENCES Roles(id),  -- normalizacion por aqui

  idTipoPersona INT, -- 1 profesor, 2 estudiante
  FOREIGN KEY (idTipoPersona) REFERENCES TipoPersona(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE PostulacionIniciativaCT (
  id INT PRIMARY KEY AUTO_INCREMENT,
  
  idAntecedentePostulacion INT,
  FOREIGN KEY (idAntecedentePostulacion) REFERENCES AntecedentePostulacion(id),

  idAntecedenteIniciativa INT,
  FOREIGN KEY (idAntecedenteIniciativa) REFERENCES AntecedenteIniciativa(id),

  idEmpresa CHAR(9),
  FOREIGN KEY (idEmpresa) REFERENCES Empresa(id),

  idCronograma INT,
  FOREIGN KEY (idCronograma) REFERENCES Cronograma(id),

  idEquipoTrabajo INT,
  FOREIGN KEY (idEquipoTrabajo) REFERENCES EquipoTrabajo(id),

  idEstadoPostulacion INT NOT NULL,
  FOREIGN KEY (idEstadoPostulacion) REFERENCES EstadoPostulacion(id),

  presupuesto FLOAT(24) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


COMMIT;
