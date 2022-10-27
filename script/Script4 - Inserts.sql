USE CRM
GO

-- eliminacion de los datos de la tabla
DELETE FROM CasosActividad
DELETE FROM CasosTarea
DELETE FROM ContactoTarea
DELETE FROM ContactoActividad
DELETE FROM EjecucionTarea
DELETE FROM EjecucionActividad
DELETE FROM Caso
DELETE FROM Ejecucion
DELETE FROM ProductoCotizacion
DELETE FROM CotizacionActividad
DELETE FROM Cotizacion
DELETE FROM Contacto
DELETE FROM Direccion
DELETE FROM Actividad
DELETE FROM Canton
DELETE FROM CuentaCliente
DELETE FROM Cliente
DELETE FROM Competidor
DELETE FROM CotizacionTarea
DELETE FROM UsuarioRoles
DELETE FROM Usuario
DELETE FROM Departamento
DELETE FROM Distrito
DELETE FROM Estado
DELETE FROM EstadoCaso
DELETE FROM Etapa
DELETE FROM Producto
DELETE FROM EstadoProducto
DELETE FROM Familia
DELETE FROM EstadoFamilia
DELETE FROM Inflacion
DELETE FROM Moneda
DELETE FROM Motivo
DELETE FROM Origen
DELETE FROM Prioridad
DELETE FROM PrivilegiosXrol
DELETE FROM Probabilidad
DELETE FROM Provincia
DELETE FROM Rol
DELETE FROM Sector
DELETE FROM Tarea
DELETE FROM TipoCaso
DELETE FROM TipoContacto
DELETE FROM TipoPrivilegio
DELETE FROM Zona
DELETE FROM EstadoTarea

-- insertar datos en la tabla

--departamentos
INSERT INTO dbo.Departamento (id, nombre) VALUES
       (1, 'Ventas'),
        (2, 'Compras'),
        (3, 'Contabilidad'),
        (4, 'Recursos Humanos'),
        (5, 'Informática'),
        (6, 'Marketing'),
        (7, 'Producción'),
        (8, 'Logística'),
        (9, 'Calidad'),
        (10, 'Finanzas'),
        (11, 'Administración'),
        (12, 'Gerencia'),
        (13, 'Comunicación'),
        (14, 'Legal'),
        (15, 'Seguridad'),
        (16, 'Mantenimiento'),
        (17, 'Servicios Generales'),
        (18, 'Servicios Técnicos'),
        (19, 'Servicios de Apoyo'),
        (20, 'Servicios de Soporte')

--provincias
INSERT INTO dbo.Provincia VALUES
        (1, 'San José'),
        (2, 'Alajuela'),
        (3, 'Cartago'),
        (4, 'Heredia'),
        (5, 'Guanacaste'),
        (6, 'Puntarenas'),
        (7, 'Limón');

--cantones
INSERT INTO Canton VALUES
      (1,'San José'),
      (2,'Escazú'),
      (3,'Desamparados'),
      (4,'Puriscal'),
      (5,'Tarrazú'),
      (6,'Aserrí'),
      (7,'Mora'),
      (8,'Goicochea'),
      (9,'Santa Ana'),
      (10,'Alajuelita'),
      (11,'Vásquez de Coronado'),
      (12,'Acosta'),
      (13,'Tibás'),
      (14,'Moravia'),
      (15,'Montes de oca'),
      (16,'Turrubare'),
      (17,'Dota'),
      (18,'Curridabat'),
      (19,'Pérez Zeledon'),
      (20,'León Cortés'),
      (21,'Alajuela'),
      (22,'San Ramón'),
      (23,'Grecia'),
      (24,'San Mateo'),
      (25,'Atenas'),
      (26,'Palmares'),
      (27,'Orotina'),
      (28,'San Carlos'),
      (29,'Zarcero'),
      (30,'Sarchí'),
      (31,'Upala'),
      (32,'Los Chiles'),
      (33,'Guatuso'),
      (34,'Cartago'),
      (35,'Paraíso'),
      (36,'La Unión'),
      (37,'Jiménez'),
      (38,'Turrialba'),
      (39,'Alvarado'),
      (40,'Oreamuno'),
      (41,'El Guarco'),
      (42,'Heredia'),
      (43,'Barva'),
      (44,'Santo Domingo'),
      (45,'Santa Bárbara'),
      (46,'San Rafael'),
      (47,'San Isidro'),
      (48,'Belén'),
      (49,'Flores'),
      (50,'San Pablo'),
      (51,'Sarapiquí'),
      (52,'Liberia'),
      (53,'Nicoya'),
      (54,'Santa Cruz'),
      (55,'Bagaces'),
      (56,'Carrillo'),
      (57,'Cañas'),
      (58,'Abangares'),
      (59,'Tilarán'),
      (60,'Nandayure'),
      (61,'La Cruz'),
      (62,'Hojancha'),
      (63,'Puntarenas'),
      (64,'Esparza'),
      (65,'Buenos Aires'),
      (66,'Montes de Oro'),
      (67,'Osa'),
      (68,'Aguirre'),
      (69,'Golfito'),
      (70,'Coto Brus'),
      (71,'Parrita'),
      (72,'Corredores'),
      (73,'Garabito'),
      (74,'Limón'),
      (75,'Pococí'),
      (76,'Siquirres'),
      (77,'Talamanca'),
      (78,'Matina'),
      (79,'Guácimo');


--distritos
INSERT INTO Distrito VALUES 
  (1,'Carmen'),
  (2,'Merced'),
  (3,'Hospital'),
  (4,'Catedral'),
  (5,'Zapote'),
  (6,'San Francisco de Dos Ríos'),
  (7,'Uruca'),
  (8,'Mata Redonda'),
  (9,'Pavas'),
  (10,'Hatillo'),
  (11,'San Sebastián'),
  (12,'Escazú'),
  (13,'San Antonio'),
  (14,'San Rafael'),
  (15,'Desamparados'),
  (16,'San Miguel'),
  (17,'San Juan de Dios'),
  (18,'San Rafael Arriba'),
  (19,'San Antonio'),
  (20,'Frailes'),
  (21,'Patarrá'),
  (22,'San Cristóbal'),
  (23,'Rosario'),
  (24,'Damas'),
  (25,'San Rafael Abajo'),
  (26,'Gravilias'),
  (27,'Los Guido'),
  (28,'Santiago'),
  (29,'Mercedes Sur'),
  (30,'Barbacoas'),
  (31,'Grifo Alto'),
  (32,'San Rafael'),
  (33,'Candelarita'),
  (34,'Desamparaditos'),
  (35,'San Antonio'),
  (36,'Chires'),
  (37,'San Marcos'),
  (38,'San Lorenzo'),
  (39,'San Carlos'),
  (40,'Aserrí'),
  (41,'Tarbaca'),
  (42,'Vuelta de Jorco'),
  (43,'San Gabriel'),
  (44,'Legua'),
  (45,'Monterrey'),
  (46,'Salitrillos'),
  (47,'Colón'),
  (48,'Guayabo'),
  (49,'Tabarcia'),
  (50,'Piedras Negras'),
  (51,'Picagres'),
  (52,'Guadalupe'),
  (53,'San Francisco'),
  (54,'Calle Blancos'),
  (55,'Mata de Plátano'),
  (56,'Ipís'),
  (57,'Rancho Redondo'),
  (58,'Purral'),
  (59,'Santa Ana'),
  (60,'Salitral'),
  (61,'Pozos'),
  (62,'Uruca'),
  (63,'Piedades'),
  (64,'Brasil'),
  (65,'Alajuelita'),
  (66,'San Josecito'),
  (67,'San Antonio'),
  (68,'Concepción'),
  (69,'San Felipe'),
  (70,'San Isidro'),
  (71,'San Rafael'),
  (72,'Dulce Nombre de Jesús'),
  (73,'Patalillo'),
  (74,'Cascajal'),
  (75,'San Ignacio'),
  (76,'Guaitil'),
  (77,'Palmichal'),
  (78,'Cangrejal'),
  (79,'Sabanillas'),
  (80,'San Juan'),
  (81,'Cinco Esquinas'),
  (82,'Anselmo Llorente'),
  (83,'León XIII'),
  (84,'Colima'),
  (85,'San Vicente'),
  (86,'San Jerónimo'),
  (87,'La Trinidad'),
  (88,'San Pedro'),
  (89,'Sabanilla'),
  (90,'Mercedes'),
  (91,'San Rafael'),
  (92,'San Pablo'),
  (93,'San Pedro'),
  (94,'San Juan de Mata'),
  (95,'San Luis'),
  (96,'Carara'),
  (97,'Santa María'),
  (98,'Jardín'),
  (99,'Copey'),
  (100,'Curridabat'),
  (101,'Granadilla'),
  (102,'Sánchez'),
  (103,'Tirrases'),
  (104,'San Isidro de El General'),
  (105,'El General'),
  (106,'Daniel Flores'),
  (107,'Rivas'),
  (108,'San Pedro'),
  (109,'Platanares'),
  (110,'Pejibaye'),
  (111,'Cajón'),
  (112,'Barú'),
  (113,'Río Nuevo'),
  (114,'Páramo'),
  (115,'San Pablo'),
  (116,'San Andrés'),
  (117,'Llano Bonito'),
  (118,'San Isidro'),
  (119,'Santa Cruz'),
  (120,'San Antonio'),
  (121,'Alajuela'),
  (122,'San José'),
  (123,'Carrizal'),
  (124,'San Antonio'),
  (125,'Guácima'),
  (126,'San Isidro'),
  (127,'Sabanilla'),
  (128,'San Rafael'),
  (129,'Río Segundo'),
  (130,'Desamparados'),
  (131,'Turrúcares'),
  (132,'Tambor'),
  (133,'Garita'),
  (134,'Sarapiquí'),
  (135,'San Ramón'),
  (136,'Santiago'),
  (137,'San Juan'),
  (138,'Piedades Norte'),
  (139,'Piedades Sur'),
  (140,'San Rafael'),
  (141,'San Isidro'),
  (142,'Ángeles'),
  (143,'Alfaro'),
  (144,'Volio'),
  (145,'Concepción'),
  (146,'Zapotal'),
  (147,'Peñas Blancas'),
  (148,'Grecia'),
  (149,'San Isidro'),
  (150,'San José'),
  (151,'San Roque'),
  (152,'Tacares'),
  (153,'Río Cuarto'),
  (154,'Puente de Piedra'),
  (155,'Bolívar'),
  (156,'San Mateo'),
  (157,'Desmonte'),
  (158,'Jesús María'),
  (159,'Atenas'),
  (160,'Jesús'),
  (161,'Mercedes'),
  (162,'San Isidro'),
  (163,'Concepción'),
  (164,'San José'),
  (165,'Santa Eulalia'),
  (166,'Escobal'),
  (167,'Palmares'),
  (168,'Zaragoza'),
  (169,'Buenos Aires'),
  (170,'Santiago'),
  (171,'Candelaria'),
  (172,'Esquipulas'),
  (173,'La Granja'),
  (174,'Palmitos'),
  (175,'San Pedro'),
  (176,'San Juan'),
  (177,'San Rafael'),
  (178,'Carrillos'),
  (179,'Sabana Redonda'),
  (180,'Orotina'),
  (181,'El Mastate'),
  (182,'Hacienda Vieja'),
  (183,'Coyolar'),
  (184,'La Ceiba'),
  (185,'Quesada'),
  (186,'Florencia'),
  (187,'Buenavista'),
  (188,'Aguas Zarcas'),
  (189,'Venecia'),
  (190,'Pital'),
  (191,'La Fortuna'),
  (192,'La Tigra'),
  (193,'La Palmera'),
  (194,'Venado'),
  (195,'Cutris'),
  (196,'Monterrey'),
  (197,'Pocosol'),
  (198,'Alfaro Ruiz'),
  (199,'Zarcero'),
  (200,'Laguna'),
  (201,'Tapesco'),
  (202,'Guadalupe'),
  (203,'Palmira'),
  (204,'Zapote'),
  (205,'Brisas'),
  (206,'Sarchí Norte'),
  (207,'Sarchí Sur'),
  (208,'Toro Amarillo'),
  (209,'San Pedro'),
  (210,'Rodríguez'),
  (211,'Upala'),
  (212,'Aguas Claras'),
  (213,'San José o Pizote'),
  (214,'Bijagua'),
  (215,'Delicias'),
  (216,'Dos Ríos'),
  (217,'Yolillal'),
  (218,'Los Chiles'),
  (219,'Caño Negro'),
  (220,'El Amparo'),
  (221,'San Jorge'),
  (222,'San Rafael'),
  (223,'Buenavista'),
  (224,'Cote'),
  (225,'Katira'),
  (226,'Oriental'),
  (227,'Occidental'),
  (228,'Carmen'),
  (229,'San Nicolás'),
  (230,'Aguacaliente/San Francisco'),
  (231,'Guadalupe o Arenilla'),
  (232,'Corralillo'),
  (233,'Tierra Blanca'),
  (234,'Dulce Nombre'),
  (235,'Llano Grande'),
  (236,'Quebradilla'),
  (237,'Paraíso'),
  (238,'Santiago'),
  (239,'Orosi'),
  (240,'Cachí'),
  (241,'Llanos de Santa Lucía'),
  (242,'Tres Ríos'),
  (243,'San Diego'),
  (244,'San Juan'),
  (245,'San Rafael'),
  (246,'Concepción'),
  (247,'Dulce Nombre'),
  (248,'San Ramón'),
  (249,'Río Azul'),
  (250,'Juan Viñas'),
  (251,'Tucurrique'),
  (252,'Pejibaye'),
  (253,'Turrialba'),
  (254,'La Suiza'),
  (255,'Peralta'),
  (256,'Santa Cruz'),
  (257,'Santa Teresita'),
  (258,'Pavones'),
  (259,'Tuis'),
  (260,'Tayutic'),
  (261,'Santa Rosa'),
  (262,'Tres Equis'),
  (263,'La Isabel'),
  (264,'Chirripó'),
  (265,'Pacayas'),
  (266,'Cervantes'),
  (267,'Capellades'),
  (268,'San Rafael'),
  (269,'Cot'),
  (270,'Potrero Cerrado'),
  (271,'Cipreses'),
  (272,'Santa Rosa'),
  (273,'El Tejar'),
  (274,'San Isidro'),
  (275,'Tobosi'),
  (276,'Patio de Agua'),
  (277,'Heredia'),
  (278,'Mercedes'),
  (279,'San Francisco'),
  (280,'Ulloa'),
  (281,'Varablanca'),
  (282,'Barva'),
  (283,'San Pedro'),
  (284,'San Pablo'),
  (285,'San Roque'),
  (286,'Santa Lucía'),
  (287,'San José de la Montaña'),
  (288,'Santo Domingo'),
  (289,'San Vicente'),
  (290,'San Miguel'),
  (291,'Paracito'),
  (292,'Santo Tomás'),
  (293,'Santa Rosa'),
  (294,'Tures'),
  (295,'Pará'),
  (296,'Santa Bárbara'),
  (297,'San Pedro'),
  (298,'San Juan'),
  (299,'Jesús'),
  (300,'Santo Domingo'),
  (301,'Purabá'),
  (302,'San Rafael'),
  (303,'San Josecito'),
  (304,'Santiago'),
  (305,'Ángeles'),
  (306,'Concepción'),
  (307,'San Isidro'),
  (308,'San José'),
  (309,'Concepción'),
  (310,'San Francisco'),
  (311,'San Antonio'),
  (312,'La Ribera'),
  (313,'La Asunción'),
  (314,'San Joaquín'),
  (315,'Barrantes'),
  (316,'Llorente'),
  (317,'San Pablo'),
  (318,'Rincón Sabanilla'),
  (319,'Puerto Viejo'),
  (320,'La Virgen'),
  (321,'Las Horquetas'),
  (322,'Llanuras del Gaspar'),
  (323,'Cureña'),
  (324,'Liberia'),
  (325,'Cañas Dulces'),
  (326,'Mayorga'),
  (327,'Nacascolo'),
  (328,'Curubandé'),
  (329,'Nicoya'),
  (330,'Mansión'),
  (331,'San Antonio'),
  (332,'Quebrada Honda'),
  (333,'Sámara'),
  (334,'Nosara'),
  (335,'Belén de Nosarita'),
  (336,'Santa Cruz'),
  (337,'Bolsón'),
  (338,'Veintisiete de Abril'),
  (339,'Tempate'),
  (340,'Cartagena'),
  (341,'Cuajiniquil'),
  (342,'Diriá'),
  (343,'Cabo Velas'),
  (344,'Tamarindo'),
  (345,'Bagaces'),
  (346,'La Fortuna'),
  (347,'Mogote'),
  (348,'Río Naranjo'),
  (349,'Filadelfia'),
  (350,'Palmira'),
  (351,'Sardinal'),
  (352,'Belén'),
  (353,'Cañas'),
  (354,'Palmira'),
  (355,'San Miguel'),
  (356,'Bebedero'),
  (357,'Porozal'),
  (358,'Las Juntas'),
  (359,'Sierra'),
  (360,'San Juan'),
  (361,'Colorado'),
  (362,'Tilarán'),
  (363,'Quebrada Grande'),
  (364,'Tronadora'),
  (365,'Santa Rosa'),
  (366,'Líbano'),
  (367,'Tierras Morenas'),
  (368,'Arenal'),
  (369,'Carmona'),
  (370,'Santa Rita'),
  (371,'Zapotal'),
  (372,'San Pablo'),
  (373,'Porvenir'),
  (374,'Bejuco'),
  (375,'La Cruz'),
  (376,'Santa Cecilia'),
  (377,'La Garita'),
  (378,'Santa Elena'),
  (379,'Hojancha'),
  (380,'Monte Romo'),
  (381,'Puente Carrillo'),
  (382,'Huacas'),
  (383,'Puntarenas'),
  (384,'Pitahaya'),
  (385,'Chomes'),
  (386,'Lepanto'),
  (387,'Paquera'),
  (388,'Manzanillo'),
  (389,'Guacimal'),
  (390,'Barranca'),
  (391,'Monte Verde'),
  (392,'Cóbano'),
  (393,'Chacarita'),
  (394,'Chira'),
  (395,'Acapulco'),
  (396,'El Roble'),
  (397,'Arancibia'),
  (398,'Espíritu Santo'),
  (399,'San Juan Grande'),
  (400,'Macacona'),
  (401,'San Rafael'),
  (402,'San Jerónimo'),
  (403,'Buenos Aires'),
  (404,'Volcán'),
  (405,'Potrero Grande'),
  (406,'Boruca'),
  (407,'Pilas'),
  (408,'Colinas'),
  (409,'Chánguena'),
  (410,'Biolley'),
  (411,'Brunka'),
  (412,'Miramar'),
  (413,'La Unión'),
  (414,'San Isidro'),
  (415,'Puerto Cortés'),
  (416,'Palmar'),
  (417,'Sierpe'),
  (418,'Bahía Ballena'),
  (419,'Piedras Blancas'),
  (420,'Quepos'),
  (421,'Savegre'),
  (422,'Naranjito'),
  (423,'Golfito'),
  (424,'Puerto Jiménez'),
  (425,'Guaycará'),
  (426,'Pavón'),
  (427,'San Vito'),
  (428,'Sabalito'),
  (429,'Aguabuena'),
  (430,'Limoncito'),
  (431,'Pittier'),
  (432,'Parrita'),
  (433,'Corredor'),
  (434,'La Cuesta'),
  (435,'Canoas'),
  (436,'Laurel'),
  (437,'Jacó'),
  (438,'Tárcoles'),
  (439,'Limón'),
  (440,'Valle La Estrella'),
  (441,'Río Blanco'),
  (442,'Matama'),
  (443,'Guápiles'),
  (444,'Jiménez'),
  (445,'Rita'),
  (446,'Roxana'),
  (447,'Cariari'),
  (448,'Colorado'),
  (449,'Siquirres'),
  (450,'Pacuarito'),
  (451,'Florida'),
  (452,'Germania'),
  (453,'El Cairo'),
  (454,'Alegría'),
  (455,'Bratsi'),
  (456,'Sixaola'),
  (457,'Cahuita'),
  (458,'Telire'),
  (459,'Matina'),
  (460,'Batán'),
  (461,'Carrandi'),
  (462,'Guácimo'),
  (463,'Mercedes'),
  (464,'Pocora'),
  (465,'Río Jiménez'),
  (466,'Duacarí');

--direcciones
INSERT INTO Direccion VALUES 
	(1,1,1,1),
	(2,1,1,2),
	(3,1,1,3),
	(4,1,1,4),
	(5,1,1,5),
	(6,1,1,6),
	(7,1,1,7),
	(8,1,1,8),
	(9,1,1,9),
	(10,1,1,10),
	(11,1,1,11),
	(12,1,2,12),
	(13,1,2,13),
	(14,1,2,14),
	(15,1,3,15),
	(16,1,3,16),
	(17,1,3,17),
	(18,1,3,18),
	(19,1,3,19),
	(20,1,3,20),
	(21,1,3,21),
	(22,1,3,22),
	(23,1,3,23),
	(24,1,3,24),
	(25,1,3,25),
	(26,1,3,26),
	(27,1,3,27),
	(28,1,4,28),
	(29,1,4,29),
	(30,1,4,30),
	(31,1,4,31),
	(32,1,4,32),
	(33,1,4,33),
	(34,1,4,34),
	(35,1,4,35),
	(36,1,4,36),
	(37,1,5,37),
	(38,1,5,38),
	(39,1,5,39),
	(40,1,6,40),
	(41,1,6,41),
	(42,1,6,42),
	(43,1,6,43),
	(44,1,6,44),
	(45,1,6,45),
	(46,1,6,46),
	(47,1,7,47),
	(48,1,7,48),
	(49,1,7,49),
	(50,1,7,50),
	(51,1,7,51),
	(52,1,8,52),
	(53,1,8,53),
	(54,1,8,54),
	(55,1,8,55),
	(56,1,8,56),
	(57,1,8,57),
	(58,1,8,58),
	(59,1,9,59),
	(60,1,9,60),
	(61,1,9,61),
	(62,1,9,62),
	(63,1,9,63),
	(64,1,9,64),
	(65,1,10,65),
	(66,1,10,66),
	(67,1,10,67),
	(68,1,10,68),
	(69,1,10,69),
	(70,1,11,70),
	(71,1,11,71),
	(72,1,11,72),
	(73,1,11,73),
	(74,1,11,74),
	(75,1,12,75),
	(76,1,12,76),
	(77,1,12,77),
	(78,1,12,78),
	(79,1,12,79),
	(80,1,13,80),
	(81,1,13,81),
	(82,1,13,82),
	(83,1,13,83),
	(84,1,13,84),
	(85,1,14,85),
	(86,1,14,86),
	(87,1,14,87),
	(88,1,15,88),
	(89,1,15,89),
	(90,1,15,90),
	(91,1,15,91),
	(92,1,16,92),
	(93,1,16,93),
	(94,1,16,94),
	(95,1,16,95),
	(96,1,16,96),
	(97,1,17,97),
	(98,1,17,98),
	(99,1,17,99),
	(100,1,18,100),
	(101,1,18,101),
	(102,1,18,102),
	(103,1,18,103),
	(104,1,19,104),
	(105,1,19,105),
	(106,1,19,106),
	(107,1,19,107),
	(108,1,19,108),
	(109,1,19,109),
	(110,1,19,110),
	(111,1,19,111),
	(112,1,19,112),
	(113,1,19,113),
	(114,1,19,114),
	(115,1,20,115),
	(116,1,20,116),
	(117,1,20,117),
	(118,1,20,118),
	(119,1,20,119),
	(120,1,20,120),
	(121,2,21,121),
	(122,2,21,122),
	(123,2,21,123),
	(124,2,21,124),
	(125,2,21,125),
	(126,2,21,126),
	(127,2,21,127),
	(128,2,21,128),
	(129,2,21,129),
	(130,2,21,130),
	(131,2,21,131),
	(132,2,21,132),
	(133,2,21,133),
	(134,2,21,134),
	(135,2,22,135),
	(136,2,22,136),
	(137,2,22,137),
	(138,2,22,138),
	(139,2,22,139),
	(140,2,22,140),
	(141,2,22,141),
	(142,2,22,142),
	(143,2,22,143),
	(144,2,22,144),
	(145,2,22,145),
	(146,2,22,146),
	(147,2,22,147),
	(148,2,23,148),
	(149,2,23,149),
	(150,2,23,150),
	(151,2,23,151),
	(152,2,23,152),
	(153,2,23,153),
	(154,2,23,154),
	(155,2,23,155),
	(156,2,24,156),
	(157,2,24,157),
	(158,2,24,158),
	(159,2,25,159),
	(160,2,25,160),
	(161,2,25,161),
	(162,2,25,162),
	(163,2,25,163),
	(164,2,25,164),
	(165,2,25,165),
	(166,2,25,166),
	(167,2,26,167),
	(168,2,26,168),
	(169,2,26,169),
	(170,2,26,170),
	(171,2,26,171),
	(172,2,26,172),
	(173,2,26,173),
	(174,2,26,174),
	(175,2,26,175),
	(176,2,26,176),
	(177,2,26,177),
	(178,2,26,178),
	(179,2,26,179),
	(180,2,27,180),
	(181,2,27,181),
	(182,2,27,182),
	(183,2,27,183),
	(184,2,27,184),
	(185,2,28,185),
	(186,2,28,186),
	(187,2,28,187),
	(188,2,28,188),
	(189,2,28,189),
	(190,2,28,190),
	(191,2,28,191),
	(192,2,28,192),
	(193,2,28,193),
	(194,2,28,194),
	(195,2,28,195),
	(196,2,28,196),
	(197,2,28,197),
	(198,2,29,198),
	(199,2,29,199),
	(200,2,29,200),
	(201,2,29,201),
	(202,2,29,202),
	(203,2,29,203),
	(204,2,29,204),
	(205,2,29,205),
	(206,2,30,206),
	(207,2,30,207),
	(208,2,30,208),
	(209,2,30,209),
	(210,2,30,210),
	(211,2,31,211),
	(212,2,31,212),
	(213,2,31,213),
	(214,2,31,214),
	(215,2,31,215),
	(216,2,31,216),
	(217,2,31,217),
	(218,2,32,218),
	(219,2,32,219),
	(220,2,32,220),
	(221,2,32,221),
	(222,2,33,222),
	(223,2,33,223),
	(224,2,33,224),
	(225,2,33,225),
	(226,3,34,226),
	(227,3,34,227),
	(228,3,34,228),
	(229,3,34,229),
	(230,3,34,230),
	(231,3,34,231),
	(232,3,34,232),
	(233,3,34,233),
	(234,3,34,234),
	(235,3,34,235),
	(236,3,34,236),
	(237,3,35,237),
	(238,3,35,238),
	(239,3,35,239),
	(240,3,35,240),
	(241,3,35,241),
	(242,3,36,242),
	(243,3,36,243),
	(244,3,36,244),
	(245,3,36,245),
	(246,3,36,246),
	(247,3,36,247),
	(248,3,36,248),
	(249,3,36,249),
	(250,3,37,250),
	(251,3,37,251),
	(252,3,37,252),
	(253,3,38,253),
	(254,3,38,254),
	(255,3,38,255),
	(256,3,38,256),
	(257,3,38,257),
	(258,3,38,258),
	(259,3,38,259),
	(260,3,38,260),
	(261,3,38,261),
	(262,3,38,262),
	(263,3,38,263),
	(264,3,38,264),
	(265,3,39,265),
	(266,3,39,266),
	(267,3,39,267),
	(268,3,40,268),
	(269,3,40,269),
	(270,3,40,270),
	(271,3,40,271),
	(272,3,40,272),
	(273,3,41,273),
	(274,3,41,274),
	(275,3,41,275),
	(276,3,41,276),
	(277,4,42,277),
	(278,4,42,278),
	(279,4,42,279),
	(280,4,42,280),
	(281,4,42,281),
	(282,4,43,282),
	(283,4,43,283),
	(284,4,43,284),
	(285,4,43,285),
	(286,4,43,286),
	(287,4,43,287),
	(288,4,44,288),
	(289,4,44,289),
	(290,4,44,290),
	(291,4,44,291),
	(292,4,44,292),
	(293,4,44,293),
	(294,4,44,294),
	(295,4,44,295),
	(296,4,45,296),
	(297,4,45,297),
	(298,4,45,298),
	(299,4,45,299),
	(300,4,45,300),
	(301,4,45,301),
	(302,4,46,302),
	(303,4,46,303),
	(304,4,46,304),
	(305,4,46,305),
	(306,4,46,306),
	(307,4,47,307),
	(308,4,47,308),
	(309,4,47,309),
	(310,4,47,310),
	(311,4,48,311),
	(312,4,48,312),
	(313,4,48,313),
	(314,4,49,314),
	(315,4,49,315),
	(316,4,49,316),
	(317,4,50,317),
	(318,4,50,318),
	(319,4,51,319),
	(320,4,51,320),
	(321,4,51,321),
	(322,4,51,322),
	(323,4,51,323),
	(324,5,52,324),
	(325,5,52,325),
	(326,5,52,326),
	(327,5,52,327),
	(328,5,52,328),
	(329,5,53,329),
	(330,5,53,330),
	(331,5,53,331),
	(332,5,53,332),
	(333,5,53,333),
	(334,5,53,334),
	(335,5,53,335),
	(336,5,54,336),
	(337,5,54,337),
	(338,5,54,338),
	(339,5,54,339),
	(340,5,54,340),
	(341,5,54,341),
	(342,5,54,342),
	(343,5,54,343),
	(344,5,54,344),
	(345,5,55,345),
	(346,5,55,346),
	(347,5,55,347),
	(348,5,55,348),
	(349,5,56,349),
	(350,5,56,350),
	(351,5,56,351),
	(352,5,56,352),
	(353,5,57,353),
	(354,5,57,354),
	(355,5,57,355),
	(356,5,57,356),
	(357,5,57,357),
	(358,5,58,358),
	(359,5,58,359),
	(360,5,58,360),
	(361,5,58,361),
	(362,5,59,362),
	(363,5,59,363),
	(364,5,59,364),
	(365,5,59,365),
	(366,5,59,366),
	(367,5,59,367),
	(368,5,59,368),
	(369,5,60,369),
	(370,5,60,370),
	(371,5,60,371),
	(372,5,60,372),
	(373,5,60,373),
	(374,5,60,374),
	(375,5,61,375),
	(376,5,61,376),
	(377,5,61,377),
	(378,5,61,378),
	(379,5,62,379),
	(380,5,62,380),
	(381,5,62,381),
	(382,5,62,382),
	(383,6,63,383),
	(384,6,63,384),
	(385,6,63,385),
	(386,6,63,386),
	(387,6,63,387),
	(388,6,63,388),
	(389,6,63,389),
	(390,6,63,390),
	(391,6,63,391),
	(392,6,63,392),
	(393,6,63,393),
	(394,6,63,394),
	(395,6,63,395),
	(396,6,63,396),
	(397,6,63,397),
	(398,6,64,398),
	(399,6,64,399),
	(400,6,64,400),
	(401,6,64,401),
	(402,6,64,402),
	(403,6,65,403),
	(404,6,65,404),
	(405,6,65,405),
	(406,6,65,406),
	(407,6,65,407),
	(408,6,65,408),
	(409,6,65,409),
	(410,6,65,410),
	(411,6,65,411),
	(412,6,66,412),
	(413,6,66,413),
	(414,6,66,414),
	(415,6,67,415),
	(416,6,67,416),
	(417,6,67,417),
	(418,6,67,418),
	(419,6,67,419),
	(420,6,68,420),
	(421,6,68,421),
	(422,6,68,422),
	(423,6,69,423),
	(424,6,69,424),
	(425,6,69,425),
	(426,6,69,426),
	(427,6,70,427),
	(428,6,70,428),
	(429,6,70,429),
	(430,6,70,430),
	(431,6,70,431),
	(432,6,71,432),
	(433,6,72,433),
	(434,6,72,434),
	(435,6,72,435),
	(436,6,72,436),
	(437,6,73,437),
	(438,6,73,438),
	(439,7,74,439),
	(440,7,74,440),
	(441,7,74,441),
	(442,7,74,442),
	(443,7,75,443),
	(444,7,75,444),
	(445,7,75,445),
	(446,7,75,446),
	(447,7,75,447),
	(448,7,75,448),
	(449,7,76,449),
	(450,7,76,450),
	(451,7,76,451),
	(452,7,76,452),
	(453,7,76,453),
	(454,7,76,454),
	(455,7,77,455),
	(456,7,77,456),
	(457,7,77,457),
	(458,7,77,458),
	(459,7,78,459),
	(460,7,78,460),
	(461,7,78,461),
	(462,7,79,462),
	(463,7,79,463),
	(464,7,79,464),
	(465,7,79,465),
	(466,7,79,466);

--inflacion
insert into inflacion values
  (2010,0.5),
  (2011,0.5),
  (2012,0.5),
  (2013,0.5),
  (2014,0.5),
  (2015,0.5),
  (2016,0.5),
  (2017,0.5),
  (2018,0.5),
  (2019,0.5),
  (2020,0.5),
  (2021,0.5);

--clientes
DECLARE @i INT, @cedula INT, @telefono INT, @celular INT, @nombre VARCHAR(30), @apellido1 VARCHAR(30), @apellido2 VARCHAR(30), @randomNombre INT, @randomApellido1 INT, @randomApellido2 INT

SET @i = 1;
WHILE @i <= 1000
BEGIN
  SET @cedula = 111111111 + RAND() * 999999999;
  SET @telefono = 66666666 + RAND() * 89999999;
  SET @celular = 66666666 + RAND() * 89999999;
  SET @randomNombre = 1 + RAND() * 10;
  SET @randomApellido1 = 1 + RAND() * 10;
  SET @randomApellido2 = 1 + RAND() * 10;
  SET @nombre = CHOOSE(@randomNombre, 'Juan', 'Pedro', 'Jose', 'Maria', 'Luis', 'Carlos', 'Ana', 'Luisa', 'Rosa', 'Miguel');
  SET @apellido1 = CHOOSE(@randomApellido1, 'Perez', 'Gonzalez', 'Lopez', 'Martinez', 'Gomez', 'Rodriguez', 'Fernandez', 'Diaz', 'Sanchez', 'Perez');
  SET @apellido2 = CHOOSE(@randomApellido2, 'Barrera', 'Torres', 'Chaves', 'Vives', 'Paz', 'Zepeda', 'Messi', 'Dos santos', 'Gómez', 'Quesada');
  INSERT INTO cliente VALUES (@cedula, @telefono, @celular, @nombre, @apellido1, @apellido2);
  SET @i = @i + 1;
END;

-- Insercciones de datos en la tabla de Competidor

INSERT INTO Competidor VALUES
  ('IBM'),
  ('Microsoft'),
  ('Oracle'),
  ('Google'),
  ('Apple'),
  ('Amazon'),
  ('Facebook'),
  ('Samsung'),
  ('Sony'),
  ('Intel'),
  ('HP'),
  ('Dell'),
  ('Cisco'),
  ('Lenovo'),
  ('LG');

-- Insercciones de datos en la tabla de Estado para contacto
INSERT INTO Estado VALUES
  (1, 'Activo'),
  (2, 'Inactivo'),
  (3, 'Con poca mercadería'),
  (4, 'Agotado');

-- Inserciones de los datos para la tabla estados de los productos
INSERT INTO EstadoProducto VALUES
  (1, 'Agotado'),
  (2, 'Disponible'),
  (3, 'Obsoleto'),
  (4, 'Vencido');

-- Inserciones de los datos para la tabla estados de las familias de productos
INSERT INTO EstadoFamilia VALUES
  (1, 'Activo'),
  (2, 'Inactivo'),
  (3, 'No comercializado'),
  (4, 'En proceso de adquisicion');

-- Insercciones de datos en la tabla de Estapa
INSERT INTO Etapa VALUES
  ('etapa1'),
  ('etapa2'),
  ('etapa3'),
  ('etapa4'),
  ('etapa5');

-- Insercciones de datos en la tabla de EstadoCaso
INSERT INTO EstadoCaso VALUES
  (1, '1EstadoCaso'),
  (2, '2EstadoCaso'),
  (3, '3EstadoCaso'),
  (4, '4EstadoCaso'),
  (5, '5EstadoCaso'); 

-- Insercciones de datos en la tabla de Moneda

INSERT INTO Moneda VALUES
  (1, 'Dolar'),
  (2, 'Colon');


--Se registran posibles motivos por los que una cotizacion puede ser rechazada
INSERT INTO Motivo VALUES
  (1, 'El competidor ofreció mejor precio.'),
  (2, 'El cliente no se comunicó.'),
  (3, 'El cliente no se interesó.'),
  (4, 'El cliente no respondió.'),
  (5, 'El cliente no se presentó.');

-- Insercciones de datos en la tabla de Origen
INSERT INTO origen VALUES (1, 'Origen 1'),
  (2, 'Origen 2'),
  (3, 'Origen 3'),
  (4, 'Origen 4'),
  (5, 'Origen 5'),
  (6, 'Origen 6'),
  (7, 'Origen 7'),
  (8, 'Origen 8'),
  (9, 'Origen 9'),
  (10, 'Origen 10'),
  (11, 'Origen 11'),
  (12, 'Origen 12'),
  (13, 'Origen 13'),
  (14, 'Origen 14'),
  (15, 'Origen 15');

-- Insercciones de datos en la tabla de Prioridad
INSERT INTO prioridad VALUES (1, 'Urgente'),
(2, 'Alta'),
(3, 'Media'),
(4, 'Baja'),
(5, 'Muy Baja');

-- Insercciones de datos en la tabla de Probabilidad
INSERT INTO probabilidad VALUES
  (23), (45), (67), (89), (100), (1), (2), (3), (4), (5), (6), (7),
  (8), (9), (10);

-- Insercciones de datos en la tabla de Rol
INSERT INTO rol VALUES
  (1, 'Administrador'),
  (2, 'Usuario'),
  (3, 'Invitado'),
  (4, 'Administrador'),
  (5, 'Usuario'),
  (6, 'Invitado'),
  (7, 'Administrador'),
  (8, 'Usuario'),
  (9, 'Invitado'),
  (10, 'Administrador'),
  (11, 'Usuario'),
  (12, 'Invitado'),
  (13, 'Administrador'),
  (14, 'Usuario'),
  (15, 'Invitado');

-- Insercciones de datos en la tabla de Sector
INSERT INTO sector (id, nombre) VALUES 
  (1, 'Sector 1'),
  (2, 'Sector 2'),
  (3, 'Sector 3'),
  (4, 'Sector 4'),
  (5, 'Sector 5'),
  (6, 'Sector 6'),
  (7, 'Sector 7'),
  (8, 'Sector 8'),
  (9, 'Sector 9'),
  (10, 'Sector 10');

-- Insercciones de datos en la tabla de EstadoTarea
INSERT INTO EstadoTarea VALUES
  (1, 'Sin iniciar'),
  (2, 'En proceso'),
  (3, 'Finalizada'),
  (4, 'Cancelada');

-- Insercciones de datos en la tabla de Tarea
INSERT INTO tarea (id, fecha_finalizacion, fecha_creacion, estado, descripcion) VALUES
	(1, '2019-01-01', '2019-01-01', 3, 'Comprar Productos'),
	(2, '2019-01-01', '2019-01-01', 4, 'Vender'),
	(3, '2019-01-01', '2019-01-01', 3, 'Comprar Productos'),
	(4, '2019-01-01', '2019-01-01', 2, 'Vender'),
	(5, '2019-01-01', '2019-01-01', 1, 'Comprar Productos'),
	(6, '2019-01-01', '2019-01-01', 3, 'Vender'),
	(7, '2019-01-01', '2019-01-01', 4, 'Comprar Productos'),
	(8, '2019-01-01', '2019-01-01', 2, 'Vender'),
	(9, '2019-01-01', '2019-01-01', 1, 'Comprar Productos'),
	(10, '2019-01-01', '2019-01-01', 3, 'Vender');

-- Insercciones de datos en la tabla de TipoCaso
INSERT INTO tipocaso (id, tipo) VALUES (1, 'Tipo 1'),
(2, 'Tipo 2'),
(3, 'Tipo 3'),
(4, 'Tipo 4'),
(5, 'Tipo 5');

-- Insercciones de datos en la tabla de TipoContacto
INSERT INTO tipocontacto (id, tipo) VALUES (1, 'Vendedor'),
(2, 'Cliente'),
(3, 'Proveedor'),
(4, 'Otro');

-- Insercciones de datos en la tabla de TipoPrivilegio
INSERT INTO tipoprivilegio (id, tipo) VALUES (1, 'Administrador'),
(2, 'Usuario'),
(3, 'Invitado'),
(4, 'Otro');

-- Insercciones de datos en la tabla de Usuario
DECLARE @clave INT, @randomCedula INT, @randomClave INT, @randomDepartamento INT
SET @i = 1
WHILE @i <= 1000
BEGIN
  SET @cedula = 111111111 + RAND() * 999999999;
    SET @clave = 11111111 + RAND() * 99999999;
    -- random de nombres de 1 al 10
    SET @randomNombre = 1 + RAND() * 10;
    -- random de apellidos de 1 al 10
    SET @randomApellido1 = 1 + RAND() * 10;
    SET @randomApellido2 = 1 + RAND() * 10;
    -- random de cedula de 1 al 10
    set @nombre  = CHOOSE(@randomNombre, 'Juan', 'Pedro', 'Jose', 'Maria', 'Luis', 'Ana', 'Carlos', 'Luisa', 'Rosa', 'Ramon');
    set @apellido1  = CHOOSE(@randomApellido1, 'Perez', 'Gonzalez', 'Rodriguez', 'Fernandez', 'Lopez', 'Martinez', 'Gomez', 'Sanchez', 'Perez', 'Gonzalez');
    set @apellido2  = CHOOSE(@randomApellido2, 'Porras', 'Romero', 'Torre', 'Hernandez', 'Garcia', 'Gutierrez', 'Perez', 'Sanchez', 'Perez', 'Gonzalez');
    -- random de departamento de 1 al 20
    SET @randomDepartamento = 1 + RAND() * 20;
    INSERT INTO usuario (cedula, clave, nombre, apellido1, apellido2, id_departamento) VALUES (@cedula, @clave, @nombre, @apellido1, @apellido2, @randomDepartamento)
    SET @i = @i + 1
END

-- Insercciones de datos en la tabla de Zona
INSERT INTO Zona (id, nombre) VALUES
(1, 'Central'),
(2, 'Chorotega'),
(3, 'Pacífico Central'),
(4, 'Brunca'),
(5, 'Huetar Atlántica'),
(6, 'Huetar Norte'),
(7, 'Pacífico Sur'),
(8, 'Talamanca'),
(9, 'Golfo de Nicoya'),
(10, 'Zona Norte'),
(11, 'Zona Sur'),
(12, 'Zona Este'),
(13, 'Zona Oeste'),
(14, 'Zona Central'),
(15, 'Zona Insular');

--inserciones de las familias de productos
INSERT INTO Familia VALUES
  (1, 'Electrodomésticos', 1,  'Muebles importados del Polo norte'),
  (2, 'Ropa', 1, 'Ropa con hilos de oro'),
  (3, 'Juguetes', 1, 'Juguetes de madera'),
  (4, 'Muebles', 1, 'Muebles de madera'),
  (5, 'Cocina', 1, 'Utensilios de cocina'),
  (6, 'Hogar', 1, 'Utensilios de hogar'),
  (7, 'Jardín', 1, 'Utensilios de jardín'),
  (8, 'Deportes', 1, 'Utensilios de deporte'),
  (9, 'Tecnología', 1, 'Utensilios de tecnología'),
  (10, 'Mascotas', 1, 'Utensilios de mascotas'),
  (11, 'Bebés', 1, 'Utensilios de bebés'),
  (12, 'Libros', 1, 'Libros de todo tipo'),
  (13, 'Música', 1, 'Música de todo tipo'),
  (14, 'Películas', 1, 'Películas de todo tipo'),
  (15, 'Videojuegos', 1, 'Videojuegos de todo tipo'),
  (16, 'Herramientas', 1, 'Herramientas de todo tipo'),
  (17, 'Belleza', 1, 'Productos de belleza'),
  (18, 'Salud', 1, 'Productos de salud'),
  (19, 'Automóviles', 1, 'Productos de automóviles'),
  (20, 'Motos', 1, 'Productos de motos'),
  (21, 'Bicicletas', 1, 'Productos de bicicletas'),
  (22, 'Muebles de oficina', 1, 'Productos de muebles de oficina'),
  (23, 'Muebles de cocina', 1, 'Productos de muebles de cocina')


  /* Insecciones de PrivilegiosXRol con idRol de un rol existente y 
idPrivilegio de un privilegio existente */
DECLARE @maxElement int, @random1 int, @randomRol int, @privilegio int

SET @maxElement = 1;
WHILE @maxElement <= 20
BEGIN
  SELECT TOP 1 @randomRol = id FROM rol ORDER BY NEWID()
  select TOP 1 @privilegio = id FROM TipoPrivilegio ORDER BY NEWID()
  IF NOT (SELECT COUNT(*) From PrivilegiosXrol where  id_rol = @randomRol and id_privilegio = @privilegio) > 0
  BEGIN
    INSERT INTO PrivilegiosXrol (id_rol, id_privilegio) VALUES (@randomRol, @privilegio)
  END
  SET @maxElement = @maxElement + 1
END
 

/* Insecciones de productos con codigo, codigoFamilia, nombre, precioEstandar,
estado, descripcion */
INSERT INTO Producto VALUES
  (1, 1, 'Refrigerador', 1000, 1, 'Refrigerador de 2 puertas'),
  (2, 1, 'Lavadora', 1000, 1, 'Lavadora de 2 puertas'),
  (3, 1, 'Secadora', 1000, 1, 'Secadora de 2 puertas'),
  (4, 1, 'Estufa', 1000, 1, 'Estufa de 2 puertas'),
  (5, 1, 'Microondas', 1000, 1, 'Microondas de 2 puertas'),
  (6, 1, 'Licuadora', 1000, 1, 'Licuadora de 2 puertas'),
  (7, 1, 'Batidora', 1000, 1, 'Batidora de 2 puertas'),
  (8, 1, 'Aspiradora', 1000, 1, 'Aspiradora de 2 puertas'),
  (9, 1, 'Cafetera', 1000, 1, 'Cafetera de 2 puertas'),
  (10, 1, 'Horno', 1000, 1, 'Horno de 2 puertas'),
  (11, 1, 'Televisor', 1000, 1, 'Televisor de 2 puertas'),
  (12, 1, 'Radio', 1000, 1, 'Radio de 2 puertas'),
  (13, 1, 'DVD', 1000, 1, 'DVD de 2 puertas'),
  (14, 1, 'Videocasetera', 1000, 1, 'Videocasetera de 2 puertas'),
  (15, 1, 'Videojuego', 1000, 1, 'Videojuego de 2 puertas'),
  (16, 1, 'Computadora', 1000, 1, 'Computadora de 2 puertas'),
  (17, 1, 'Impresora', 1000, 1, 'Impresora de 2 puertas');

  

/* Insercciones de 10 UsuarioRoles con id rol de 1 a 15 y cedula usuario de usuarios existentes */
--DECLARE @maxElement int, @random1 int, @randomRol int

SET @maxElement = 10;
WHILE @maxElement > 0
BEGIN
  SELECT top 1 @cedula = cedula FROM Usuario ORDER BY NEWID();
  -- Random de 1 a 4
  SET @random1 = ROUND(RAND()*3,0)+1
  WHILE @random1 > 0
  BEGIN
    SELECT TOP 1 @randomRol = id FROM Rol ORDER BY NEWID();
    IF NOT (SELECT COUNT(*) FROM UsuarioRoles WHERE cedula_usuario = @cedula AND id_rol = @randomRol) > 0
    BEGIN
      INSERT INTO UsuarioRoles (id_rol, cedula_usuario) VALUES (@randomRol, @cedula);
      SET @random1 = @random1 - 1;
    END
  END
  SET @maxElement = @maxElement - 1;
END

/* Insercciones de cuentaCliente con id, cedula_cliente debe ser uno de los existente, nombre_cuenta, moneda debe ser 1 o 2,
contacto_principal, sitio_web, informacion_adicional, correo_electronico, id_zona de los existente, id_sector de los existente*/
DEclare @zona int, @sector int
--, @maxElement int, @cedula int

SET @maxElement = 1;
WHILE @maxElement < 25
BEGIN
  SELECT TOP 1 @cedula = cedula FROM Cliente ORDER BY NEWID();
  SELECT TOP 1 @zona = id FROM Zona ORDER BY NEWID();
  SELECT TOP 1 @sector = id FROM Sector ORDER BY NEWID();
  IF NOT (SELECT COUNT(*) FROM CuentaCliente WHERE cedula_cliente = @cedula) > 0
  BEGIN	
	  INSERT INTO CuentaCliente (id,cedula_cliente, nombre_cuenta, moneda, contacto_principal, sitio_web, informacion_adicional, correo_electronico, id_zona, id_sector) 
	  VALUES (@maxElement, @cedula, 'Cuenta de prueba'+CAST(@maxElement AS varchar), 1, 'Contacto de prueba', 'www.prueba.com', 'Informacion de prueba', 'andy@gmail.com', @zona, @sector);
	  SET @maxElement = @maxElement + 1;
  END
END


DECLARE @cliente VARCHAR(9), @usuario VARCHAR(9), @TipoContacto INT,
		--@telefono VARCHAR(10),
		@correo_electronico VARCHAR(50), @estado INT,
		@direccion INT, @descripcion VARCHAR(255), @id_zona INT, @id_sector INT,
		@motivo VARCHAR(255),@randNombre INT, @randTelefono INT
		--@nombre VARCHAR, 

--DECLARE @i INT
SET @i = 35
SET @motivo = 'Provedor de productos'
SET @descripcion = 'Se le provee productos a la empresa'
WHILE @i > 0
BEGIN
	  SET @cliente = (SELECT TOP(1) cedula_cliente FROM CuentaCliente ORDER BY NEWID())
	  SET @usuario = (SELECT TOP(1) cedula FROM Usuario ORDER BY NEWID())
	  SET @TipoContacto = (SELECT TOP(1) id FROM TipoContacto ORDER BY NEWID())
	  SET @estado = (SELECT TOP(1) id FROM Estado ORDER BY NEWID())
	  SET @randNombre = 1 + RAND() * 10;
	  SET @randTelefono = 1 + RAND() * 10;
	  SET @nombre = CHOOSE(@randNombre, 'Juan', 'Pedro', 'Carlos', 'Luis', 'Jose', 'Maria', 'Ana', 'Luisa', 'Sofia', 'Camila')
      SET @telefono = CHOOSE(@randTelefono, '809134567', '809124568', '809124569', '809123450', '809123457', '809123452', '809123473', '809123457', '809123457', '809123457')
	  SET @correo_electronico = CHOOSE(@randNombre, 'xz', 'xy', 'xw', 'xv', 'xu', 'xt', 'xs', 'xr', 'xq', 'xp') + '@gmail.com'
	  SET @direccion = (SELECT TOP(1) id FROM Direccion ORDER BY (NEWID()))
	  SET @id_zona = (SELECT TOP(1) id FROM Zona ORDER BY (NEWID()))
	  SET @id_sector = (SELECT TOP(1) id FROM Sector ORDER BY (NEWID()))
	  IF NOT (SELECT COUNT(*) FROM Contacto WHERE cedula_usuario = @usuario or cedula_cliente = @cliente) > 0
	  BEGIN
    begin try
      begin
        INSERT INTO Contacto (id,cedula_cliente, cedula_usuario,tipo_contacto, nombre, telefono, correo_electronico, estado, direccion, descripcion, id_zona, id_sector, motivo)
		  VALUES (@i,@cliente, @usuario, @TipoContacto, @nombre, @telefono, @correo_electronico, @estado, @direccion, @descripcion, @id_zona, @id_sector, @motivo)
		  SET @i = @i - 1
      end
    end try
    begin catch
      begin
        PRINT 'cedula ya existe'
		SET @i = @i - 1
      end
    end catch
	 END
END


/* Insercciones de Cotizacion con numero_cotizacion, id_factura, id_contacto de los existente, tipo, nombre_oportunidad, fecha_cotizacion,
nombre_cuenta de los existente en cotizacion, fecha_proyecccion_cierre, fecha_cierre, orden_compra, descripcion, precio_negociodo, 
id_zona de los existente, id_sector de los existente, id_etapa de los existente, id_moneda de los existente, id_asesor de los existente, probabilidad de los existente,
motivo_denegacion de los existente, id_competidor de los existente, id_cuenta_cliente de los existente
*/
-- @maxElement int, @random1 int, @randomRol int
DECLARE @randomContacto int, @randomCuenta VARCHAR(30), @randomZona int,
@randomSector int, @randomEtapa VARCHAR(30), @randomMoneda int, @randomAsesor int, @randomProbabilidad int,
@randomMotivo int, @randomCompetidor VARCHAR(30)

SET @maxElement = 1;
WHILE @maxElement < 15
BEGIN
  SELECT TOP 1 @randomContacto = id FROM Contacto ORDER BY NEWID();
  SELECT TOP 1 @randomCuenta = nombre_cuenta FROM CuentaCliente ORDER BY NEWID();
  SELECT TOP 1 @randomZona = id FROM Zona ORDER BY NEWID();
  SELECT TOP 1 @randomSector = id FROM Sector ORDER BY NEWID();
  SELECT TOP 1 @randomEtapa = nombre FROM Etapa ORDER BY NEWID();
  SELECT TOP 1 @randomMoneda = id FROM Moneda ORDER BY NEWID();
  SELECT TOP 1 @randomAsesor = cedula FROM Usuario ORDER BY NEWID();
  SELECT TOP 1 @randomProbabilidad = porcentaje FROM Probabilidad ORDER BY NEWID();
  SELECT TOP 1 @randomMotivo = id FROM Motivo ORDER BY NEWID();
  SELECT TOP 1 @randomCompetidor = nombre FROM Competidor ORDER BY NEWID();
  SELECT @random1 = 1 + RAND() * 100;
  IF NOT (SELECT COUNT(*) FROM Cotizacion WHERE id_factura = @random1 or nombre_cuenta = @randomCuenta) > 0
  BEGIN
    INSERT INTO Cotizacion (numero_cotizacion, id_factura, id_contacto, tipo, nombre_oportunidad, fecha_cotizacion, nombre_cuenta, fecha_proyeccion_cierre, fecha_cierre, orden_compra, descripcion, precio_negociado, id_zona, id_sector, id_moneda, id_etapa, id_asesor, probabilidad, motivo_denegacion, id_competidor) 
    VALUES (@maxElement,@random1, @randomContacto, 'Tipo de prueba', 'Oportunidad de prueba', '2017-01-01', @randomCuenta, '2017-01-01', '2017-01-01', 'Orden de prueba', 'Descripcion de prueba', 1000, @randomZona, @randomSector, @randomMoneda,@randomEtapa, @randomAsesor, @randomProbabilidad, @randomMotivo, @randomCompetidor);
    SET @maxElement = @maxElement + 1;
  END
END



/* Insercciones de Ejecucion con id, numeroCotizacion, asesor, fechaEjecucion, nombreCuenta,
nombreEjecucion, propietarioEjecucion, añoProyectadoCierre, mesProyectadoCierre, fechaCierre, id_departamento de los existente
*/
DECLARE @departamento int, @cotizacion int, @cedulaPropietario varchar(30)--, @nombre varchar, @cedula varchar

SET @maxElement = 1;
WHILE @maxElement < 10
BEGIN
  SELECT TOP 1 @cotizacion = numero_cotizacion FROM Cotizacion ORDER BY NEWID();
  SELECT TOP 1 @departamento = id FROM Departamento ORDER BY NEWID();
  SELECT TOP 1 @nombre = nombre_cuenta FROM Cotizacion ORDER BY NEWID();
  SELECT TOP 1 @cedula = cedula from Usuario ORDER BY NEWID();
  SELECT TOP 1 @cedulaPropietario = cedula from Usuario ORDER BY NEWID();
  IF NOT (SELECT COUNT(*) FROM Ejecucion WHERE nombreCuenta = @nombre or numeroCotizacion =@cotizacion ) > 0
  BEGIN
    INSERT INTO Ejecucion (id, numeroCotizacion, asesor, fechaEjecucion, nombreCuenta, nombreEjecucion, propietarioEjecucion, añoProyectadoCierre, mesProyectadoCierre, fechaCierre, id_departamento) 
    VALUES (@maxElement, @cotizacion, @cedula ,'2018-01-01',@nombre , 'Ejecucion de prueba', @cedulaPropietario, 2018, 1, '2018-01-01', @departamento);
    SET @maxElement = @maxElement + 1;
  END
END
GO


/* Insercciones de ProductoCotizacion con codigo_producto de los existente, numero_cotizacion de los existente, cantidad
*/

DECLARE @producto int, @cotizacion int, @maxElement int

SET @maxElement = 1;
WHILE @maxElement < 10
BEGIN
  SELECT TOP 1 @producto = codigo FROM Producto ORDER BY NEWID();
  SELECT TOP 1 @cotizacion = numero_cotizacion FROM Cotizacion ORDER BY NEWID();
  IF NOT (SELECT COUNT(*) FROM ProductoCotizacion WHERE codigo_producto = @producto or numero_cotizacion =@cotizacion ) > 0
  BEGIN
    INSERT INTO ProductoCotizacion (codigo_producto, numero_cotizacion, cantidad) 
    VALUES (@producto, @cotizacion, 1);
    SET @maxElement = @maxElement + 1;
  END
END

INSERT INTO Actividad (id, descripcion, fecha_finalizacion) VALUES
  (1, 'Realizar cambios a cotizacion', (SELECT DATEADD(DAY, ABS(CHECKSUM(NEWID()) % 30) * -1, GETDATE()))),
  (2, 'Realizar visita', (SELECT DATEADD(DAY, ABS(CHECKSUM(NEWID()) % 30) * -1, GETDATE()))),
  (3, 'Realizar llamada', (SELECT DATEADD(DAY, ABS(CHECKSUM(NEWID()) % 30) * -1, GETDATE()))),
  (4, 'Realizar reunión', (SELECT DATEADD(DAY, ABS(CHECKSUM(NEWID()) % 30) * -1, GETDATE()))),
  (5, 'Realizar cotización', (SELECT DATEADD(DAY, ABS(CHECKSUM(NEWID()) % 30) * -1, GETDATE()))),
  (6, 'Realizar seguimiento', (SELECT DATEADD(DAY, ABS(CHECKSUM(NEWID()) % 30) * -1, GETDATE()))),
  (7, 'Realizar propuesta', (SELECT DATEADD(DAY, ABS(CHECKSUM(NEWID()) % 30) * -1, GETDATE()))),
  (8, 'Realizar seguimiento', (SELECT DATEADD(DAY, ABS(CHECKSUM(NEWID()) % 30) * -1, GETDATE()))),
  (9, 'Realizar propuesta', (SELECT DATEADD(DAY, ABS(CHECKSUM(NEWID()) % 30) * -1, GETDATE()))),
  (10, 'Realizar seguimiento', (SELECT DATEADD(DAY, ABS(CHECKSUM(NEWID()) % 30) * -1, GETDATE())));

DECLARE @tarea INT, @actividad INT, @ejecucion int

DECLARE @i INT
SET @i = 7
WHILE @i > 0
  BEGIN
    SET @ejecucion = (SELECT TOP(1) id FROM Ejecucion ORDER BY NEWID())
    SET @tarea = (SELECT TOP(1) id FROM Tarea ORDER BY NEWID())
    SET @actividad = (SELECT TOP(1) id FROM Actividad ORDER BY NEWID())

    IF NOT (SELECT COUNT(*) FROM EjecucionTarea WHERE id_ejecucion = @ejecucion OR id_tarea = @tarea) > 0
    BEGIN
      INSERT INTO EjecucionTarea VALUES
      (@ejecucion, @tarea)
    END
    IF NOT (SELECT COUNT(*) FROM EjecucionActividad WHERE id_actividad  = @actividad OR id_ejecucion = @ejecucion) > 0
    BEGIN
      INSERT INTO EjecucionActividad VALUES
      (@ejecucion, @actividad)
    END
    SET @i = @i - 1
  END


/*INSERTS DEPENDIENTES MILTON*/
DECLARE @contacto INT
SET @i = 4
WHILE @i > 0
  BEGIN
    SET @contacto = (SELECT TOP(1) id FROM Contacto ORDER BY NEWID())
    SET @actividad = (SELECT TOP(1) id FROM Actividad ORDER BY NEWID())

    INSERT INTO ContactoActividad VALUES
    (@contacto, @actividad)
   
    SET @i = @i - 1
  END



-- Inserción de nueva tarea de contacto
SET @i = 10
WHILE @i > 0
  BEGIN
    SET @contacto = (SELECT TOP(1) id FROM Contacto ORDER BY NEWID())
    SET @tarea = (SELECT TOP(1) id FROM Tarea ORDER BY NEWID())

	begin try
      begin
		INSERT INTO ContactoTarea VALUES (@contacto, @tarea)
		  SET @i = @i - 1
      end
    end try
    begin catch
      begin
        PRINT 'Registro ya existe'
		SET @i = @i - 1
      end
    end catch
  END




  -- insercion de 10 nuevas cotizaciones
DECLARE @proyecto INT, @propietarioCaso INT, @asunto VARCHAR(255), @nombreCuenta VARCHAR(255), @descripcion VARCHAR(255),
        @direccion INT, @estado INT, @tipo INT, @prioridad INT, @nombreContacto VARCHAR (255), @origen INT;

SET @i = 5


WHILE @i > 0
  BEGIN
    SET @proyecto = (SELECT TOP(1) id FROM Ejecucion ORDER BY NEWID())
    SET @propietarioCaso = (SELECT TOP(1) cedula FROM Usuario ORDER BY NEWID())
    SET @asunto = 'Garantías de productos'
    SET @nombreCuenta = (SELECT TOP (1) nombreCuenta FROM Ejecucion ORDER BY NEWID())
	SET @nombreContacto = (SELECT TOP(1) nombre FROM Contacto ORDER BY NEWID())
    SET @descripcion = 'El cliente solicitó una consulta sobre los términos y condiciones de una garantía'
    SET @direccion = (SELECT TOP(1) id FROM Direccion ORDER BY NEWID())
    SET @estado = (SELECT TOP(1) id FROM Estado ORDER BY NEWID())
    SET @tipo = (SELECT TOP(1) id FROM TipoCaso ORDER BY NEWID())
    SET @prioridad = (SELECT TOP(1) id FROM Prioridad ORDER BY NEWID())
	SET @origen	 = (SELECT TOP(1) id FROM Origen ORDER BY NEWID())
    INSERT INTO Caso (id, proyectoAsociado, propietarioCaso, asunto, nombreCuenta, nombreContacto, descripcion, id_direccion, id_origen, id_estado, id_tipo, id_prioridad) VALUES
    (@i, @proyecto, @propietarioCaso, @asunto, @nombreCuenta, @nombreContacto,@descripcion, @direccion, @origen ,@estado, @tipo, @prioridad)

    SET @i = @i - 1
  END


DECLARE @caso INT

SET @i = 20
WHILE @i > 0
  BEGIN
    SET @caso = (SELECT TOP(1) id FROM Caso ORDER BY NEWID())
    SET @tarea = (SELECT TOP(1) id FROM Tarea ORDER BY NEWID())
    SET @actividad = (SELECT TOP(1) id FROM Actividad ORDER BY NEWID())


	begin try
      begin

		INSERT INTO CasosTarea VALUES
		(@caso, @tarea)

		INSERT INTO CasosActividad VALUES
		(@caso, @actividad)

		  SET @i = @i - 1
      end
    end try
    begin catch
      begin
        PRINT 'Registro ya existe'
		SET @i = @i - 1
      end
    end catch
  END


SET @i = 20
WHILE @i > 0
  BEGIN
    SET @cotizacion = (SELECT TOP(1) id FROM Caso ORDER BY NEWID())
    SET @tarea = (SELECT TOP(1) id FROM Tarea ORDER BY NEWID())
    SET @actividad = (SELECT TOP(1) id FROM Actividad ORDER BY NEWID())


	begin try
      begin
			INSERT INTO CasosTarea VALUES
			(@caso, @tarea)

			INSERT INTO CasosActividad VALUES
			(@caso, @actividad)

		  SET @i = @i - 1
      end
    end try
    begin catch
      begin
        PRINT 'Registro ya existe'
		SET @i = @i - 1
      end
    end catch
  END