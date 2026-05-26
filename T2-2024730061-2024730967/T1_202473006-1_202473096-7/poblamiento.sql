###########################################################################
############ Inserción de datos ###########################################
###########################################################################

START TRANSACTION; 

INSERT INTO Jefes (nombre) VALUES 
('Carlos Soto'), ('Rodrigo Peña'), ('Alan Brito'), ('George Fan'), 
('Karen Plankton'), ('Saki Fujita'), ('Pedro Godoy'), ('Sigmund Freud');

INSERT INTO Coordinadores (nombre, activo) VALUES 
('Benito Juarez', 1), ('Martín Gonzales', 1), ('Daniel San Martín', 1), ('Luz Rojas', 1), 
('Laura Shigihara', 1), ('Larry Langosta', 1), ('Luka Megurine', 1), ('Grace Hopper', 1), ('Jean-Martin Charcot', 1);

-- Representantes de las empresas
INSERT INTO Representantes (nombre) VALUES 
('Webiwabo'), ('Sigmund Freud'), ('Sucio Dan'), ('Calamarino Elegante'), 
('Calamardo Guapo'), ('Armando Mesa'), ('Ricardo Iglesias'), ('Adalbert Müller'), 
('Lunds Holska'), ('Carroll Smith');

-- =========================================================================
-- ANTECEDENTES DE POSTULACIÓN 
-- =========================================================================
INSERT INTO AntecedentePostulacion (fecha, idSedes, idRegionesEjecucion, idJefes, idCoordinadores, codigo, iniciativaEsNueva, idRegionesImpacto) VALUES
('2009-04-01', 1,  5, 1, 1,    0, 1,  5),
('2010-05-23', 2, 13, 2, 2,    1, 1, 13),
('2015-03-20', 1,  5, 1, 3,    2, 1,  5),
('2017-04-09', 1,  5, 3, 4,  220, 1,  5),
('2019-04-26', 2, 13, 1, 1,    5, 0, 13),
('2021-05-05', 5, 13, 4, 5, 2009, 1, 13),
('2022-05-01', 4, 10, 5, 6,   21, 1, 14),
('2023-01-29', 2, 12, 6, 7,  393, 1, 12),
('2025-04-14', 1, 15, 7, 8,  410, 1, 15),
('2026-01-18', 3,  5, 8, 9,   69, 1,  5), 
('2026-02-01', 1,  5, 1, 1,   70, 1,  5), 
('2026-02-15', 2, 13, 2, 2,   71, 1, 13),
('2026-03-01', 1,  5, 3, 3,   72, 0,  5),
('2026-03-10', 4, 10, 4, 4,   73, 1, 14),
('2026-03-20', 2, 12, 5, 5,   74, 1, 12),
('2026-04-01', 1, 15, 6, 6,   75, 0, 15),
('2026-04-05', 3,  5, 7, 7,   76, 1,  5),
('2026-04-12', 5, 13, 8, 8,   77, 1, 13),
('2026-04-18', 1,  5, 1, 9,   78, 1,  5),
('2026-04-25', 2, 13, 2, 1,   79, 0, 13);

-- =========================================================================
-- EMPRESAS 
-- =========================================================================
INSERT INTO Empresa (id, nombre, idRepresentantes, idTamañoEmpresa, convenio) VALUES
('102359637','Crazy Dave',          1, 1, 0),
('092357891','Freud',                2, 3, 1),
('453657854','Cabeza de bolo',       3, 3, 0),
('143217534','Calamarino Enterprise',4, 2, 0),
('415327689','GUAPO',                5, 3, 1),
('112354627','Mesas de madera',      6, 2, 1),
('129542340','Green&co',             7, 3, 1),
('037192985','LTH Solutions',        8, 1, 1),
('168234501','Abennteuer',           9, 2, 1),
('29091253k','EtaAixAI',            10, 3, 1);

INSERT INTO Empresa (nombre, id, idRepresentantes, idTamañoEmpresa, convenio) VALUES
('NovaTech SpA','500000001', 1, 1, 1),
('Integra Labs','500000002', 2, 2, 0),
('Andes Software','500000003', 3, 3, 1),
('Ruta Digital','500000004', 4, 1, 1),
('Data Sur','500000005', 5, 2, 0),
('Soluciones Norte','500000006', 6, 3, 1),
('Red Activa','500000007', 7, 1, 1),
('Proyecto Uno','500000008', 8, 2, 0),
('Vision Chile','500000009', 9, 3, 1),
('Creativa Tech','500000010', 10, 1, 1);

-- =========================================================================
-- CREACIÓN DE LOS EQUIPOS DE TRABAJO
-- =========================================================================
INSERT INTO EquipoTrabajo (id) VALUES 
(NULL),(NULL),(NULL),(NULL),(NULL),(NULL),(NULL),(NULL),(NULL),(NULL),
(NULL),(NULL),(NULL),(NULL),(NULL),(NULL),(NULL),(NULL),(NULL),(NULL);


INSERT INTO PersonaEquipo (id, idEquipoTrabajo, nombre, idDepartamento, idSedes, email, telefono, idRoles, idTipoPersona) VALUES
-- Equipo 1
('19944643k', 1, 'Carlos Chacón', 1, 1, 'cchaconh@usm.cl', NULL, 1, 1),
('148925029', 1, 'Ricardo Gonzales', 2, 1, 'rricardo1415@gmail.com', NULL, 2, 1),
('542356022', 1, 'Gabriel García', 3, 1, 'ggarciac@usm.cl', '944569852', 3, 1),
('552356322', 1, 'Ismael Riquelme', 3, 1, 'iriquelmer@usm.cl', NULL, 4, 2),
('100000001', 1, 'Roberto Muñoz', 1, 1, 'rmunoz@usm.cl', NULL, 2, 2),

-- Equipo 2
('182345671', 2, 'Elena Torres', 1, 2, 'elena.torres@usm.cl', '955512345', 1, 1),
('100000002', 2, 'Juan Pérez', 2, 2, 'jperez@usm.cl', NULL, 2, 1),
('100000003', 2, 'María López', 3, 2, 'mlopez@usm.cl', NULL, 3, 1),
('173456782', 2, 'Pablo Neruda', 2, 2, 'pablo.neruda@gmail.com', NULL, 2, 2),
('100000004', 2, 'Ana Arce', 1, 2, 'aarce@gmail.com', NULL, 4, 2),

-- Equipo 3
('164567893', 3, 'Ada Lovelace', 3, 1, 'ada.lovelace@usm.cl', '966623456', 1, 1),
('100000005', 3, 'Charles Babbage', 3, 1, 'cbabbage@usm.cl', NULL, 2, 1),
('100000006', 3, 'Alan Turing', 1, 1, 'aturing@usm.cl', NULL, 3, 1),
('155678904', 3, 'Linus Torvalds', 1, 1, 'linus.t@outlook.com', NULL, 4, 2),
('100000007', 3, 'Grace Hopper', 2, 1, 'ghopper@outlook.com', NULL, 2, 2),

-- Equipo 4
('146789015', 4, 'SpongeBob SquarePants', 2, 4, 'pantalones.cuadrados@usm.cl', NULL, 3, 1),
('100000008', 4, 'Squidward Tentacles', 2, 4, 'stentacles@usm.cl', NULL, 1, 1),
('100000009', 4, 'Eugene Krabs', 2, 4, 'ekrabs@usm.cl', NULL, 2, 1),
('137890126', 4, 'Patrick Star', 2, 4, 'estrella.pat@gmail.com', '977734567', 2, 2),
('100000010', 4, 'Sandy Cheeks', 3, 4, 'scheeks@gmail.com', NULL, 4, 2),

-- Equipo 5
('128901237', 5, 'Sheldon Cooper', 3, 2, 'scooper@usm.cl', NULL, 1, 1),
('100000011', 5, 'Leonard Hofstadter', 3, 2, 'lhofstadter@usm.cl', NULL, 2, 1),
('100000012', 5, 'Howard Wolowitz', 1, 2, 'hwolowitz@usm.cl', NULL, 3, 1),
('100000013', 5, 'Rajesh Koothrappali', 1, 2, 'rajesh@gmail.com', NULL, 4, 2),
('100000014', 5, 'Penny Hofstadter', 2, 2, 'penny@gmail.com', NULL, 2, 2),

-- Equipo 6
('119012348', 6, 'Hatsune Miku', 1, 5, 'miku.vocaloid@usm.cl', '988845678', 1, 1),
('100000015', 6, 'Megurine Luka', 1, 5, 'luka@usm.cl', NULL, 2, 1),
('100000016', 6, 'Kagamine Rin', 2, 5, 'rin@usm.cl', NULL, 3, 1),
('201234569', 6, 'Kaito Shion', 2, 5, 'kaito.blue@gmail.com', NULL, 2, 2),
('100000017', 6, 'Kagamine Len', 2, 5, 'len@gmail.com', NULL, 4, 2),

-- Equipo 7
('212345670', 7, 'Walter White', 3, 4, 'heisenberg@usm.cl', NULL, 1, 1),
('100000018', 7, 'Saul Goodman', 3, 4, 'sgoodman@usm.cl', NULL, 2, 1),
('100000019', 7, 'Gustavo Fring', 2, 4, 'gfring@usm.cl', NULL, 3, 1),
('223456781', 7, 'Jesse Pinkman', 1, 4, 'chili.p@hotmail.com', '999956789', 3, 2),
('100000020', 7, 'Skyler White', 1, 4, 'swhite@hotmail.com', NULL, 4, 2),

-- Equipo 8
('234567892', 8, 'Bruce Wayne', 2, 2, 'bwayne@usm.cl', NULL, 1, 1),
('100000021', 8, 'Clark Kent', 1, 2, 'ckent.b@usm.cl', NULL, 2, 1),
('100000022', 8, 'Diana Prince', 3, 2, 'diana.b@usm.cl', NULL, 3, 1),
('100000023', 8, 'Barry Allen', 1, 2, 'ballen@gmail.com', NULL, 4, 2),
('100000024', 8, 'Arthur Curry', 2, 2, 'acurry@gmail.com', NULL, 2, 2),

-- Equipo 9
('245678903', 9, 'Arthur Pendragon', 1, 1, 'apendragon@usm.cl', '911122233', 2, 1),
('100000025', 9, 'Merlin Ambrosius', 1, 1, 'merlin@usm.cl', NULL, 1, 1),
('100000026', 9, 'Lancelot DuLac', 3, 1, 'lancelot@usm.cl', NULL, 3, 1),
('256789014', 9, 'Gwenevere', 3, 1, 'gwen@dailyplanet.com', NULL, 4, 2),
('100000027', 9, 'Morgana LeFay', 2, 1, 'morgana@gmail.com', NULL, 2, 2),

-- Equipo 10
('267890125', 10, 'Tony Stark', 2, 3, 'tstark@usm.cl', '933344455', 1, 1),
('100000028', 10, 'Steve Rogers', 2, 3, 'srogers@usm.cl', NULL, 2, 1),
('100000029', 10, 'Thor Odinson', 1, 3, 'todinson@usm.cl', NULL, 3, 1),
('100000030', 10, 'Natasha Romanoff', 1, 3, 'nromanoff@gmail.com', NULL, 4, 2),
('100000031', 10, 'Bruce Banner', 3, 3, 'bbanner@gmail.com', NULL, 2, 2),

-- Equipo 11
('278901236', 11, 'Peter Parker', 1, 1, 'pparker@usm.cl', NULL, 3, 1),
('100000032', 11, 'Miles Morales', 1, 1, 'mmorales@usm.cl', NULL, 1, 1),
('100000033', 11, 'Gwen Stacy', 2, 1, 'gstacy@usm.cl', NULL, 2, 1),
('100000034', 11, 'Mary Jane', 2, 1, 'mjane@gmail.com', NULL, 4, 2),
('100000035', 11, 'Harry Osborn', 3, 1, 'hosborn@gmail.com', NULL, 2, 2),

-- Equipo 12
('289012347', 12, 'Sherlock Holmes', 3, 2, 'sholmes.d@usm.cl', '944455566', 1, 1),
('100000036', 12, 'John Watson', 3, 2, 'jwatson.d@usm.cl', NULL, 2, 1),
('100000037', 12, 'Mycroft Holmes', 1, 2, 'mholmes@usm.cl', NULL, 3, 1),
('100000038', 12, 'Irene Adler', 1, 2, 'iadler@gmail.com', NULL, 4, 2),
('100000039', 12, 'James Moriarty', 2, 2, 'jmoriarty@gmail.com', NULL, 2, 2),

-- Equipo 13
('101234561', 13, 'Rick Sanchez', 2, 1, 'wubbalubba@usm.cl', NULL, 1, 1),
('100000040', 13, 'Summer Smith', 2, 1, 'ssmith@usm.cl', NULL, 2, 1),
('100000041', 13, 'Beth Smith', 3, 1, 'bsmith@usm.cl', NULL, 3, 1),
('102345672', 13, 'Morty Smith', 1, 1, 'morty.s@gmail.com', '955566677', 4, 2),
('100000042', 13, 'Jerry Smith', 1, 1, 'jsmith@gmail.com', NULL, 2, 2),

-- Equipo 14
('103456783', 14, 'Luke Skywalker', 3, 4, 'luke.sky@usm.cl', NULL, 1, 1),
('100000043', 14, 'Leia Organa', 3, 4, 'lorgana@usm.cl', NULL, 2, 1),
('100000044', 14, 'Han Solo', 1, 4, 'hsolo@usm.cl', NULL, 3, 1),
('100000045', 14, 'Chewbacca', 1, 4, 'chewie@gmail.com', NULL, 4, 2),
('100000046', 14, 'Lando Calrissian', 2, 4, 'lando@gmail.com', NULL, 2, 2),

-- Equipo 15
('104567894', 15, 'Anakin Skywalker', 1, 2, 'vader.s@usm.cl', '966677788', 2, 1),
('100000047', 15, 'Obi-Wan Kenobi', 1, 2, 'okenobi@usm.cl', NULL, 1, 1),
('100000048', 15, 'Padme Amidala', 2, 2, 'pamidala@usm.cl', NULL, 3, 1),
('105678905', 15, 'Ahsoka Tano', 2, 2, 'atano@army.com', NULL, 4, 2),
('100000049', 15, 'Mace Windu', 3, 2, 'mwindu@army.com', NULL, 2, 2),

-- Equipo 16
('106789016', 16, 'Harry Potter', 3, 5, 'hpotter.l@usm.cl', NULL, 1, 1),
('100000050', 16, 'Ron Weasley', 3, 5, 'rweasley@usm.cl', NULL, 2, 1),
('100000051', 16, 'Hermione Granger', 1, 5, 'hgranger@usm.cl', NULL, 3, 1),
('100000052', 16, 'Albus Dumbledore', 1, 5, 'adumbledore@gmail.com', NULL, 4, 2),
('100000053', 16, 'Severus Snape', 2, 5, 'ssnape@gmail.com', NULL, 2, 2),

-- Equipo 17
('107890127', 17, 'Frodo Baggins', 1, 1, 'vader.f@usm.cl', '977788899', 1, 1),
('100000054', 17, 'Aragorn Elessar', 1, 1, 'aragorn@usm.cl', NULL, 2, 1),
('100000055', 17, 'Legolas Greenleaf', 2, 1, 'legolas@usm.cl', NULL, 3, 1),
('100000056', 17, 'Samwise Gamgee', 2, 1, 'samg@gmail.com', NULL, 4, 2),
('100000057', 17, 'Gimli Gloin', 3, 1, 'gimli@gmail.com', NULL, 2, 2),

-- Equipo 18
('108901238', 18, 'Danny Phantom', 2, 2, 'hello.d@usm.cl', NULL, 2, 1),
('100000058', 18, 'Tucker Foley', 2, 2, 'tfoley@usm.cl', NULL, 1, 1),
('100000059', 18, 'Sam Manson', 1, 2, 'smanson@usm.cl', NULL, 3, 1),
('100000060', 18, 'Jazz Fenton', 1, 2, 'jfenton@gmail.com', NULL, 4, 2),
('100000061', 18, 'Vlad Masters', 3, 2, 'vmasters@gmail.com', NULL, 2, 2),

-- Equipo 19
('109012349', 19, 'Percy Jackson', 3, 3, 'pjackson@usm.cl', '988899900', 1, 1),
('100000062', 19, 'Annabeth Chase', 3, 3, 'achase@usm.cl', NULL, 2, 1),
('100000063', 19, 'Grover Underwood', 1, 3, 'gunderwood@usm.cl', NULL, 3, 1),
('110123450', 19, 'Chiron Horse', 1, 3, 'chiron@gmail.com', NULL, 3, 2),
('100000064', 19, 'Luke Castellan', 2, 3, 'lcastellan@gmail.com', NULL, 4, 2),

-- Equipo 20
('111234562', 20, 'Ash Ketchum', 2, 1, 'ash.k@usm.cl', NULL, 1, 1),
('100000065', 20, 'Brock Slate', 2, 1, 'brock@usm.cl', NULL, 2, 1),
('100000066', 20, 'Misty Water', 1, 1, 'misty@usm.cl', NULL, 3, 1),
('112345673', 20, 'Gary Oak', 1, 1, 'gary.o@shire.com', '922233344', 4, 2),
('100000067', 20, 'Professor Oak', 3, 1, 'poak@shire.com', NULL, 2, 2);

-- =========================================================================
-- ANTECEDENTES DE INICIATIVA
-- =========================================================================
INSERT INTO AntecedenteIniciativa (nombreIniciativa, objetivo, soluciones, resultadosEsperados, otrosDocs) VALUES
('Plataforma de seguimiento 1', 'Mejorar control', 'Panel web', 'Seguimiento centralizado', NULL),
('Sistema de alertas 2', 'Avisos oportunos', 'Correo automatico', 'Menor retraso', NULL),
('Laboratorio digital 3', 'Gestionar practicas', 'Modulo de reservas', 'Mejor uso de recursos', NULL),
('App de reportes 4', 'Registrar incidentes', 'Formulario movil', 'Reportes rapidos', NULL),
('Optimiza procesos 5', 'Reducir tiempos', 'Automatizacion', 'Menos carga manual', NULL),
('Tablero analitico 6', 'Visualizar datos', 'Dashboards', 'Decisiones mas rapidas', NULL),
('Gestion documental 7', 'Ordenar archivos', 'Repositorio central', 'Busqueda simple', NULL),
('Control de asistencia 8', 'Registrar asistencia', 'QR y web', 'Mayor trazabilidad', NULL),
('Monitoreo remoto 9', 'Supervisar avance', 'Sensores y web', 'Seguimiento continuo', 'blablabla'),
('Registro de proyectos 10', 'Unificar informacion', 'Modulo unico', 'Datos consistentes', NULL),
('Plataforma de seguimiento 11', 'Mejorar control', 'Panel web', 'Seguimiento centralizado', NULL),
('Sistema de alertas 12', 'Avisos oportunos', 'Correo automatico', 'Menor retraso', NULL),
('Laboratorio digital 13', 'Gestionar practicas', 'Modulo de reservas', 'Mejor uso de recursos', NULL),
('App de reportes 14', 'Registrar incidentes', 'Formulario movil', 'Reportes rapidos', 'blablabla'),
('Optimiza procesos 15', 'Reducir tiempos', 'Automatizacion', 'Menos carga manual', NULL),
('Tablero analitico 16', 'Visualizar datos', 'Dashboards', 'Decisiones mas rapidas', NULL),
('Gestion documental 17', 'Ordenar archivos', 'Repositorio central', 'Busqueda simple', NULL),
('Control de asistencia 18', 'Registrar asistencia', 'QR y web', 'Mayor trazabilidad', NULL),
('Monitoreo remoto 19', 'Supervisar avance', 'Sensores y web', 'Seguimiento continuo', 'blablabla'),
('Registro de proyectos 20', 'Unificar informacion', 'Modulo unico', 'Datos consistentes', NULL);

-- =========================================================================
-- CRONOGRAMAS Y ETAPAS
-- =========================================================================
INSERT INTO Cronograma VALUES
(NULL),(NULL),(NULL),(NULL),(NULL),(NULL),(NULL),(NULL),(NULL),(NULL),
(NULL),(NULL),(NULL),(NULL),(NULL),(NULL),(NULL),(NULL),(NULL),(NULL);

INSERT INTO Etapa (etapa, idCronograma, plazoSemanas, entregable) VALUES
('Inicio',         1, 2, 'Plan inicial'),
('Levantamiento',  2, 3, 'Requerimientos'),
('Diseno',         3, 2, 'Prototipo'),
('Desarrollo',     4, 4, 'Version funcional'),
('Pruebas',        5, 2, 'Informe de pruebas'),
('Implementacion', 6, 3, 'Sistema en marcha'),
('Revision',       7, 2, 'Ajustes finales'),
('Cierre',         8, 1, 'Entrega final'),
('Inicio',         9, 2, 'Plan inicial'),
('Levantamiento', 10, 3, 'Requerimientos'),
('Diseno',        11, 2, 'Prototipo'),
('Desarrollo',    12, 4, 'Version funcional'),
('Pruebas',       13, 2, 'Informe de pruebas'),
('Implementacion',14, 3, 'Sistema en marcha'),
('Revision',      15, 2, 'Ajustes finales'),
('Cierre',        16, 1, 'Entrega final'),
('Inicio',        17, 2, 'Plan inicial'),
('Levantamiento', 18, 3, 'Requerimientos'),
('Diseno',        19, 2, 'Prototipo'),
('Desarrollo',    20, 4, 'Version funcional');


INSERT INTO PostulacionIniciativaCT (idAntecedentePostulacion, idAntecedenteIniciativa, idEmpresa, idCronograma, idEquipoTrabajo, idEstadoPostulacion, presupuesto) VALUES
( 1,  1, '102359637', 1,   1, 1, 2500000),
( 2,  2, '092357891', 2,   2, 2, 3200000),
( 3,  3, '453657854', 3,   3, 1, 4100000),
( 4,  4, '143217534', 4,   4, 3, 1800000),
( 5,  5, '415327689', 5,   5, 1, 2750000),
( 6,  6, '112354627', 6,   6, 2, 3900000),
( 7,  7, '129542340', 7,   7, 1, 2100000),
( 8,  8, '037192985', 8,   8, 4, 5100000),
( 9,  9, '168234501', 9,   9, 2, 4600000),
(10, 10, '29091253k', 10, 10, 1, 3300000),
(11, 11, '500000001', 11, 11, 1, 2800000),
(12, 12, '500000002', 12, 12, 2, 3600000),
(13, 13, '500000003', 13, 13, 1, 4450000),
(14, 14, '500000004', 14, 14, 3, 1950000),
(15, 15, '500000005', 15, 15, 1, 2300000),
(16, 16, '500000006', 16, 16, 2, 5000000),
(17, 17, '500000007', 17, 17, 1, 1700000),
(18, 18, '500000008', 18, 18, 4, 4100000),
(19, 19, '500000009', 19, 19, 2, 3900000),
(20, 20, '500000010', 20, 20, 1, 5200000);

COMMIT;