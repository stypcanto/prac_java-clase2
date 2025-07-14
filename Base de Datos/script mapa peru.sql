CREATE TABLE `departamento` (
  `iddepartamento` int(11) NOT NULL AUTO_INCREMENT,
  `departamento` varchar(100) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`iddepartamento`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

LOCK TABLES `departamento` WRITE;
/*!40000 ALTER TABLE `departamento` DISABLE KEYS */;
INSERT INTO `departamento` VALUES (1,'Amazonas'),(2,'Áncash'),(3,'Apurímac'),(4,'Arequipa'),(5,'Ayacucho'),(6,'Cajamarca'),(7,'Callao'),(8,'Cusco'),(9,'Huancavelica'),(10,'Huánuco'),(11,'Ica'),(12,'Junín'),(13,'La Libertad'),(14,'Lambayeque'),(15,'Lima'),(16,'Loreto'),(17,'Madre de Dios'),(18,'Moquegua'),(19,'Pasco'),(20,'Piura'),(21,'Puno'),(22,'San Martín'),(23,'Tacna'),(24,'Tumbes'),(25,'Ucayali');
/*!40000 ALTER TABLE `departamento` ENABLE KEYS */;
UNLOCK TABLES;


CREATE TABLE `provincia` (
  `idprovincia` int(11) NOT NULL,
  `iddepartamento` int(11) NOT NULL,
  `provincia` varchar(100) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`idprovincia`),
  KEY `FK_provincia_departamento` (`iddepartamento`),
  CONSTRAINT `FK_provincia_departamento` FOREIGN KEY (`iddepartamento`) REFERENCES `departamento` (`iddepartamento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;


LOCK TABLES `provincia` WRITE;
/*!40000 ALTER TABLE `provincia` DISABLE KEYS */;
INSERT INTO `provincia` VALUES (101,1,'Chachapoyas'),(102,1,'Bagua'),(103,1,'Bongará'),(104,1,'Condorcanqui'),(105,1,'Luya'),(106,1,'Rodríguez de Mendoza'),(107,1,'Utcubamba'),(201,2,'Huaraz'),(202,2,'Aija'),(203,2,'Antonio Raymondi'),(204,2,'Asunción'),(205,2,'Bolognesi'),(206,2,'Carhuaz'),(207,2,'Carlos Fermín Fitzcarrald'),(208,2,'Casma'),(209,2,'Corongo'),(210,2,'Huari'),(211,2,'Huarmey'),(212,2,'Huaylas'),(213,2,'Mariscal Luzuriaga'),(214,2,'Ocros'),(215,2,'Pallasca'),(216,2,'Pomabamba'),(217,2,'Recuay'),(218,2,'Santa'),(219,2,'Sihuas'),(220,2,'Yungay'),(301,3,'Abancay'),(302,3,'Andahuaylas'),(303,3,'Antabamba'),(304,3,'Aymaraes'),(305,3,'Cotabambas'),(306,3,'Chincheros'),(307,3,'Grau'),(401,4,'Arequipa'),(402,4,'Camaná'),(403,4,'Caravelí'),(404,4,'Castilla'),(405,4,'Caylloma'),(406,4,'Condesuyos'),(407,4,'Islay'),(408,4,'La Uniòn'),(501,5,'Huamanga'),(502,5,'Cangallo'),(503,5,'Huanca Sancos'),(504,5,'Huanta'),(505,5,'La Mar'),(506,5,'Lucanas'),(507,5,'Parinacochas'),(508,5,'Pàucar del Sara Sara'),(509,5,'Sucre'),(510,5,'Víctor Fajardo'),(511,5,'Vilcas Huamán'),(601,6,'Cajamarca'),(602,6,'Cajabamba'),(603,6,'Celendín'),(604,6,'Chota'),(605,6,'Contumazá'),(606,6,'Cutervo'),(607,6,'Hualgayoc'),(608,6,'Jaén'),(609,6,'San Ignacio'),(610,6,'San Marcos'),(611,6,'San Miguel'),(612,6,'San Pablo'),(613,6,'Santa Cruz'),(701,7,'Prov. Const. del Callao'),(801,8,'Cusco'),(802,8,'Acomayo'),(803,8,'Anta'),(804,8,'Calca'),(805,8,'Canas'),(806,8,'Canchis'),(807,8,'Chumbivilcas'),(808,8,'Espinar'),(809,8,'La Convención'),(810,8,'Paruro'),(811,8,'Paucartambo'),(812,8,'Quispicanchi'),(813,8,'Urubamba'),(901,9,'Huancavelica'),(902,9,'Acobamba'),(903,9,'Angaraes'),(904,9,'Castrovirreyna'),(905,9,'Churcampa'),(906,9,'Huaytará'),(907,9,'Tayacaja'),(1001,10,'Huánuco'),(1002,10,'Ambo'),(1003,10,'Dos de Mayo'),(1004,10,'Huacaybamba'),(1005,10,'Huamalíes'),(1006,10,'Leoncio Prado'),(1007,10,'Marañón'),(1008,10,'Pachitea'),(1009,10,'Puerto Inca'),(1010,10,'Lauricocha '),(1011,10,'Yarowilca '),(1101,11,'Ica '),(1102,11,'Chincha '),(1103,11,'Nasca '),(1104,11,'Palpa '),(1105,11,'Pisco '),(1201,12,'Huancayo '),(1202,12,'Concepción '),(1203,12,'Chanchamayo '),(1204,12,'Jauja '),(1205,12,'Junín '),(1206,12,'Satipo '),(1207,12,'Tarma '),(1208,12,'Yauli '),(1209,12,'Chupaca '),(1301,13,'Trujillo '),(1302,13,'Ascope '),(1303,13,'Bolívar '),(1304,13,'Chepén '),(1305,13,'Julcán '),(1306,13,'Otuzco '),(1307,13,'Pacasmayo '),(1308,13,'Pataz '),(1309,13,'Sánchez Carrión '),(1310,13,'Santiago de Chuco '),(1311,13,'Gran Chimú '),(1312,13,'Virú '),(1401,14,'Chiclayo '),(1402,14,'Ferreñafe '),(1403,14,'Lambayeque '),(1501,15,'Lima '),(1502,15,'Barranca '),(1503,15,'Cajatambo '),(1504,15,'Canta '),(1505,15,'Cañete '),(1506,15,'Huaral '),(1507,15,'Huarochirí '),(1508,15,'Huaura '),(1509,15,'Oyón '),(1510,15,'Yauyos '),(1601,16,'Maynas '),(1602,16,'Alto Amazonas '),(1603,16,'Loreto '),(1604,16,'Mariscal Ramón Castilla '),(1605,16,'Requena '),(1606,16,'Ucayali '),(1607,16,'Datem del Marañón '),(1608,16,'Putumayo'),(1701,17,'Tambopata '),(1702,17,'Manu '),(1703,17,'Tahuamanu '),(1801,18,'Mariscal Nieto '),(1802,18,'General Sánchez Cerro '),(1803,18,'Ilo '),(1901,19,'Pasco '),(1902,19,'Daniel Alcides Carrión '),(1903,19,'Oxapampa '),(2001,20,'Piura '),(2002,20,'Ayabaca '),(2003,20,'Huancabamba '),(2004,20,'Morropón '),(2005,20,'Paita '),(2006,20,'Sullana '),(2007,20,'Talara '),(2008,20,'Sechura '),(2101,21,'Puno '),(2102,21,'Azángaro '),(2103,21,'Carabaya '),(2104,21,'Chucuito '),(2105,21,'El Collao '),(2106,21,'Huancané '),(2107,21,'Lampa '),(2108,21,'Melgar '),(2109,21,'Moho '),(2110,21,'San Antonio de Putina '),(2111,21,'San Román '),(2112,21,'Sandia '),(2113,21,'Yunguyo '),(2201,22,'Moyobamba '),(2202,22,'Bellavista '),(2203,22,'El Dorado '),(2204,22,'Huallaga '),(2205,22,'Lamas '),(2206,22,'Mariscal Cáceres '),(2207,22,'Picota '),(2208,22,'Rioja '),(2209,22,'San Martín '),(2210,22,'Tocache '),(2301,23,'Tacna '),(2302,23,'Candarave '),(2303,23,'Jorge Basadre '),(2304,23,'Tarata '),(2401,24,'Tumbes '),(2402,24,'Contralmirante Villar '),(2403,24,'Zarumilla '),(2501,25,'Coronel Portillo '),(2502,25,'Atalaya '),(2503,25,'Padre Abad '),(2504,25,'Purús');
/*!40000 ALTER TABLE `provincia` ENABLE KEYS */;
UNLOCK TABLES;



CREATE TABLE `distrito` (
  `iddistrito` int(11) NOT NULL,
  `idprovincia` int(11) NOT NULL,
  `distrito` varchar(100) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`iddistrito`),
  KEY `FK_distrito_provincia` (`idprovincia`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

ALTER TABLE distrito
ADD CONSTRAINT FK_distrito_provincia
FOREIGN KEY (idprovincia)
REFERENCES provincia(idprovincia);

LOCK TABLES `distrito` WRITE;
/*!40000 ALTER TABLE `distrito` DISABLE KEYS */;
INSERT INTO `distrito` VALUES (10101,101,'Chachapoyas'),(10102,101,'Asunción'),(10103,101,'Balsas'),(10104,101,'Cheto'),(10105,101,'Chiliquin'),(10106,101,'Chuquibamba'),(10107,101,'Granada'),(10108,101,'Huancas'),(10109,101,'La Jalca'),(10110,101,'Leimebamba'),(10111,101,'Levanto'),(10112,101,'Magdalena'),(10113,101,'Mariscal Castilla'),(10114,101,'Molinopampa'),(10115,101,'Montevideo'),(10116,101,'Olleros'),(10117,101,'Quinjalca'),(10118,101,'San Francisco de Daguas'),(10119,101,'San Isidro de Maino'),(10120,101,'Soloco'),(10121,101,'Sonche'),(10201,102,'Bagua'),(10202,102,'Aramango'),(10203,102,'Copallin'),(10204,102,'El Parco'),(10205,102,'Imaza'),(10206,102,'La Peca'),(10301,103,'Jumbilla'),(10302,103,'Chisquilla'),(10303,103,'Churuja'),(10304,103,'Corosha'),(10305,103,'Cuispes'),(10306,103,'Florida'),(10307,103,'Jazan'),(10308,103,'Recta'),(10309,103,'San Carlos'),(10310,103,'Shipasbamba'),(10311,103,'Valera'),(10312,103,'Yambrasbamba'),(10401,104,'Nieva'),(10402,104,'El Cenepa'),(10403,104,'Río Santiago'),(10501,105,'Lamud'),(10502,105,'Camporredondo'),(10503,105,'Cocabamba'),(10504,105,'Colcamar'),(10505,105,'Conila'),(10506,105,'Inguilpata'),(10507,105,'Longuita'),(10508,105,'Lonya Chico'),(10509,105,'Luya'),(10510,105,'Luya Viejo'),(10511,105,'María'),(10512,105,'Ocalli'),(10513,105,'Ocumal'),(10514,105,'Pisuquia'),(10515,105,'Providencia'),(10516,105,'San Cristóbal'),(10517,105,'San Francisco de Yeso'),(10518,105,'San Jerónimo'),(10519,105,'San Juan de Lopecancha'),(10520,105,'Santa Catalina'),(10521,105,'Santo Tomas'),(10522,105,'Tingo'),(10523,105,'Trita'),(10601,106,'San Nicolás'),(10602,106,'Chirimoto'),(10603,106,'Cochamal'),(10604,106,'Huambo'),(10605,106,'Limabamba'),(10606,106,'Longar'),(10607,106,'Mariscal Benavides'),(10608,106,'Milpuc'),(10609,106,'Omia'),(10610,106,'Santa Rosa'),(10611,106,'Totora'),(10612,106,'Vista Alegre'),(10701,107,'Bagua Grande'),(10702,107,'Cajaruro'),(10703,107,'Cumba'),(10704,107,'El Milagro'),(10705,107,'Jamalca'),(10706,107,'Lonya Grande'),(10707,107,'Yamon'),(20101,201,'Huaraz'),(20102,201,'Cochabamba'),(20103,201,'Colcabamba'),(20104,201,'Huanchay'),(20105,201,'Independencia'),(20106,201,'Jangas'),(20107,201,'La Libertad'),(20108,201,'Olleros'),(20109,201,'Pampas Grande'),(20110,201,'Pariacoto'),(20111,201,'Pira'),(20112,201,'Tarica'),(20201,202,'Aija'),(20202,202,'Coris'),(20203,202,'Huacllan'),(20204,202,'La Merced'),(20205,202,'Succha'),(20301,203,'Llamellin'),(20302,203,'Aczo'),(20303,203,'Chaccho'),(20304,203,'Chingas'),(20305,203,'Mirgas'),(20306,203,'San Juan de Rontoy'),(20401,204,'Chacas'),(20402,204,'Acochaca'),(20501,205,'Chiquian'),(20502,205,'Abelardo Pardo Lezameta'),(20503,205,'Antonio Raymondi'),(20504,205,'Aquia'),(20505,205,'Cajacay'),(20506,205,'Canis'),(20507,205,'Colquioc'),(20508,205,'Huallanca'),(20509,205,'Huasta'),(20510,205,'Huayllacayan'),(20511,205,'La Primavera'),(20512,205,'Mangas'),(20513,205,'Pacllon'),(20514,205,'San Miguel de Corpanqui'),(20515,205,'Ticllos'),(20601,206,'Carhuaz'),(20602,206,'Acopampa'),(20603,206,'Amashca'),(20604,206,'Anta'),(20605,206,'Ataquero'),(20606,206,'Marcara'),(20607,206,'Pariahuanca'),(20608,206,'San Miguel de Aco'),(20609,206,'Shilla'),(20610,206,'Tinco'),(20611,206,'Yungar'),(20701,207,'San Luis'),(20702,207,'San Nicolás'),(20703,207,'Yauya'),(20801,208,'Casma'),(20802,208,'Buena Vista Alta'),(20803,208,'Comandante Noel'),(20804,208,'Yautan'),(20901,209,'Corongo'),(20902,209,'Aco'),(20903,209,'Bambas'),(20904,209,'Cusca'),(20905,209,'La Pampa'),(20906,209,'Yanac'),(20907,209,'Yupan'),(21001,210,'Huari'),(21002,210,'Anra'),(21003,210,'Cajay'),(21004,210,'Chavin de Huantar'),(21005,210,'Huacachi'),(21006,210,'Huacchis'),(21007,210,'Huachis'),(21008,210,'Huantar'),(21009,210,'Masin'),(21010,210,'Paucas'),(21011,210,'Ponto'),(21012,210,'Rahuapampa'),(21013,210,'Rapayan'),(21014,210,'San Marcos'),(21015,210,'San Pedro de Chana'),(21016,210,'Uco'),(21101,211,'Huarmey'),(21102,211,'Cochapeti'),(21103,211,'Culebras'),(21104,211,'Huayan'),(21105,211,'Malvas'),(21201,212,'Caraz'),(21202,212,'Huallanca'),(21203,212,'Huata'),(21204,212,'Huaylas'),(21205,212,'Mato'),(21206,212,'Pamparomas'),(21207,212,'Pueblo Libre'),(21208,212,'Santa Cruz'),(21209,212,'Santo Toribio'),(21210,212,'Yuracmarca'),(21301,213,'Piscobamba'),(21302,213,'Casca'),(21303,213,'Eleazar Guzmán Barron'),(21304,213,'Fidel Olivas Escudero'),(21305,213,'Llama'),(21306,213,'Llumpa'),(21307,213,'Lucma'),(21308,213,'Musga'),(21401,214,'Ocros'),(21402,214,'Acas'),(21403,214,'Cajamarquilla'),(21404,214,'Carhuapampa'),(21405,214,'Cochas'),(21406,214,'Congas'),(21407,214,'Llipa'),(21408,214,'San Cristóbal de Rajan'),(21409,214,'San Pedro'),(21410,214,'Santiago de Chilcas'),(21501,215,'Cabana'),(21502,215,'Bolognesi');
/*!40000 ALTER TABLE `distrito` ENABLE KEYS */;
UNLOCK TABLES;


INSERT INTO distrito (iddistrito, idprovincia, distrito) VALUES
('150101', 1501, 'Ancón'),
('150102', 1501, 'Ate'),
('150103', 1501, 'Barranco'),
('150104', 1501, 'Breña'),
('150105', 1501, 'Carabayllo'),
('150106', 1501, 'Chaclacayo'),
('150107', 1501, 'Chorrillos'),
('150108', 1501, 'Cieneguilla'),
('150109', 1501, 'Comas'),
('150110', 1501, 'El Agustino'),
('150111', 1501, 'Independencia'),
('150112', 1501, 'Jesús María'),
('150113', 1501, 'La Molina'),
('150114', 1501, 'La Victoria'),
('150115', 1501, 'Lima'),
('150116', 1501, 'Lince'),
('150117', 1501, 'Los Olivos'),
('150118', 1501, 'Lurigancho'),
('150119', 1501, 'Lurín'),
('150120', 1501, 'Magdalena del Mar'),
('150121', 1501, 'Pueblo Libre'),
('150122', 1501, 'Miraflores'),
('150123', 1501, 'Pachacámac'),
('150124', 1501, 'Pucusana'),
('150125', 1501, 'Puente Piedra'),
('150126', 1501, 'Rímac'),
('150127', 1501, 'San Bartolo'),
('150128', 1501, 'San Borja'),
('150129', 1501, 'San Isidro'),
('150130', 1501, 'San Juan de Lurigancho'),
('150131', 1501, 'San Juan de Miraflores'),
('150132', 1501, 'San Luis'),
('150133', 1501, 'San Martín de Porres'),
('150134', 1501, 'San Miguel'),
('150135', 1501, 'Santa Anita'),
('150136', 1501, 'Santa María del Mar'),
('150137', 1501, 'Santa Rosa'),
('150138', 1501, 'Santiago de Surco'),
('150139', 1501, 'Surquillo'),
('150140', 1501, 'Villa El Salvador'),
('150141', 1501, 'Villa María del Triunfo');

INSERT INTO distrito (iddistrito, idprovincia, distrito) VALUES
('150201', 1502, 'Barranca'),
('150202', 1502, 'Paramonga'),
('150203', 1502, 'Pativilca'),
('150204', 1502, 'Supe'),
('150205', 1502, 'Supe Puerto');

INSERT INTO distrito (iddistrito, idprovincia, distrito) VALUES
('150401', 1504, 'Canta'),
('150402', 1504, 'Arahuay'),
('150403', 1504, 'Huamantanga'),
('150404', 1504, 'Huaros'),
('150405', 1504, 'Lachaqui'),
('150406', 1504, 'San Buenaventura'),
('150407', 1504, 'Santa Rosa de Quives');


INSERT INTO distrito (iddistrito, idprovincia, distrito) VALUES
('150501', 1505, 'San Vicente de Cañete'),
('150502', 1505, 'Asia'),
('150503', 1505, 'Calango'),
('150504', 1505, 'Cerro Azul'),
('150505', 1505, 'Chilca'),
('150506', 1505, 'Coayllo'),
('150507', 1505, 'Imperial'),
('150508', 1505, 'Lunahuana'),
('150509', 1505, 'Mala'),
('150510', 1505, 'Nuevo Imperial'),
('150511', 1505, 'Pacaran'),
('150512', 1505, 'Quilmana'),
('150513', 1505, 'San Antonio'),
('150514', 1505, 'San Luis'),
('150515', 1505, 'Santa Cruz de Flores'),
('150516', 1505, 'Zúñiga');

INSERT INTO distrito (iddistrito, idprovincia, distrito) VALUES
('150601', 1506, 'Huaral'),
('150602', 1506, 'Atavillos Alto'),
('150603', 1506, 'Atavillos Bajo'),
('150604', 1506, 'Aucallama'),
('150605', 1506, 'Chancay'),
('150606', 1506, 'Ihuari'),
('150607', 1506, 'Lampian'),
('150608', 1506, 'Pacaraos'),
('150609', 1506, 'San Miguel de Acos'),
('150610', 1506, 'Santa Cruz de Andamarca'),
('150611', 1506, 'Sumbilca'),
('150612', 1506, 'Veintisiete de Noviembre');



INSERT INTO distrito (iddistrito, idprovincia, distrito) VALUES
('150701', 1507, 'Matucana'),
('150702', 1507, 'Antioquia'),
('150703', 1507, 'Callahuanca'),
('150704', 1507, 'Carampoma'),
('150705', 1507, 'Chicla'),
('150706', 1507, 'Cuenca'),
('150707', 1507, 'Huachupampa'),
('150708', 1507, 'Huanza'),
('150709', 1507, 'Huarochirí'),
('150710', 1507, 'Lahuaytambo'),
('150711', 1507, 'Langa'),
('150712', 1507, 'Laraos'),
('150713', 1507, 'Mariatana'),
('150714', 1507, 'Ricardo Palma'),
('150715', 1507, 'San Andrés de Tupicocha'),
('150716', 1507, 'San Antonio'),
('150717', 1507, 'San Bartolomé'),
('150718', 1507, 'San Damian'),
('150719', 1507, 'San Juan de Iris'),
('150720', 1507, 'San Juan de Tantaranche'),
('150721', 1507, 'San Lorenzo de Quinti'),
('150722', 1507, 'San Mateo'),
('150723', 1507, 'San Mateo de Otao'),
('150724', 1507, 'San Pedro de Casta'),
('150725', 1507, 'San Pedro de Huancayre'),
('150726', 1507, 'Sangallaya'),
('150727', 1507, 'Santa Cruz de Cocachacra'),
('150728', 1507, 'Santa Eulalia'),
('150729', 1507, 'Santiago de Anchucaya'),
('150730', 1507, 'Santiago de Tuna'),
('150731', 1507, 'Santo Domingo de los Olleros'),
('150732', 1507, 'Surco');


INSERT INTO distrito (iddistrito, idprovincia, distrito) VALUES
('150801', 1508, 'Huacho'),
('150802', 1508, 'Ambar'),
('150803', 1508, 'Caleta de Carquin'),
('150804', 1508, 'Checras'),
('150805', 1508, 'Hualmay'),
('150806', 1508, 'Huaura'),
('150807', 1508, 'Leoncio Prado'),
('150808', 1508, 'Paccho'),
('150809', 1508, 'Santa Leonor'),
('150810', 1508, 'Santa María'),
('150811', 1508, 'Sayan'),
('150812', 1508, 'Vegueta');


INSERT INTO distrito (iddistrito, idprovincia, distrito) VALUES
('150901', 1509, 'Oyón'),
('150902', 1509, 'Andajes'),
('150903', 1509, 'Caujul'),
('150904', 1509, 'Cochamarca'),
('150905', 1509, 'Naván'),
('150906', 1509, 'Pachangara');



INSERT INTO distrito (iddistrito, idprovincia, distrito) VALUES
('151001', 1510, 'Yauyos'),
('151002', 1510, 'Alis'),
('151003', 1510, 'Allauca'),
('151004', 1510, 'Ayaviri'),
('151005', 1510, 'Azángaro'),
('151006', 1510, 'Cacra'),
('151007', 1510, 'Carania'),
('151008', 1510, 'Catahuasi'),
('151009', 1510, 'Chocos'),
('151010', 1510, 'Cochas'),
('151011', 1510, 'Colonia'),
('151012', 1510, 'Hongos'),
('151013', 1510, 'Huampara'),
('151014', 1510, 'Huancaya'),
('151015', 1510, 'Huangascar'),
('151016', 1510, 'Huantan'),
('151017', 1510, 'Huañec'),
('151018', 1510, 'Laraos'),
('151019', 1510, 'Lincha'),
('151020', 1510, 'Madean'),
('151021', 1510, 'Miraflores'),
('151022', 1510, 'Omas'),
('151023', 1510, 'Putinza'),
('151024', 1510, 'Quinches'),
('151025', 1510, 'Quinocay'),
('151026', 1510, 'San Joaquín'),
('151027', 1510, 'San Pedro de Pilas'),
('151028', 1510, 'Tanta'),
('151029', 1510, 'Tauripampa'),
('151030', 1510, 'Tomas'),
('151031', 1510, 'Tupe'),
('151032', 1510, 'Viñac'),
('151033', 1510, 'Vitis');





-- HUANCAYO - 1201
INSERT INTO distrito (iddistrito, idprovincia, distrito) VALUES
(120101, 1201, 'Carhuacallanga'),
(120102, 1201, 'Chacapampa'),
(120103, 1201, 'Chicche'),
(120104, 1201, 'Chilca'),
(120105, 1201, 'Chongos Alto'),
(120106, 1201, 'Chupuro'),
(120107, 1201, 'Colca'),
(120108, 1201, 'Cullhuas'),
(120109, 1201, 'El Tambo'),
(120110, 1201, 'Huacrapuquio'),
(120111, 1201, 'Hualhuas'),
(120112, 1201, 'Huancán'),
(120113, 1201, 'Huancayo'),
(120114, 1201, 'Huasicancha'),
(120115, 1201, 'Huayucachi'),
(120116, 1201, 'Ingenio'),
(120117, 1201, 'Pariahuanca'),
(120118, 1201, 'Pilcomayo'),
(120119, 1201, 'Pucará'),
(120120, 1201, 'Quichuay'),
(120121, 1201, 'Quilcas'),
(120122, 1201, 'San Agustín de Cajas'),
(120123, 1201, 'San Jerónimo de Tunán'),
(120124, 1201, 'San Pedro de Saño'),
(120125, 1201, 'Santo Domingo de Acobamba'),
(120126, 1201, 'Sapallanga'),
(120127, 1201, 'Sicaya'),
(120128, 1201, 'Viques');

-- CONCEPCIÓN - 1202
INSERT INTO distrito (iddistrito, idprovincia, distrito) VALUES
(120201, 1202, 'Concepción'),
(120202, 1202, 'Aco'),
(120203, 1202, 'Andamarca'),
(120204, 1202, 'Chambara'),
(120205, 1202, 'Cochas'),
(120206, 1202, 'Comas'),
(120207, 1202, 'Heroínas Toledo'),
(120208, 1202, 'Manzanares'),
(120209, 1202, 'Mariscal Castilla'),
(120210, 1202, 'Matahuasi'),
(120211, 1202, 'Mito'),
(120212, 1202, 'Nueve de Julio'),
(120213, 1202, 'Orcotuna'),
(120214, 1202, 'San José de Quero'),
(120215, 1202, 'Santa Rosa de Ocopa');

-- CHANCHAMAYO - 1203
INSERT INTO distrito (iddistrito, idprovincia, distrito) VALUES
(120301, 1203, 'Chanchamayo'),
(120302, 1203, 'Perené'),
(120303, 1203, 'Pichanaqui'),
(120304, 1203, 'San Luis de Shuaro'),
(120305, 1203, 'San Ramón'),
(120306, 1203, 'Vitoc');

-- JAUJA - 1204
INSERT INTO distrito (iddistrito, idprovincia, distrito) VALUES
(120401, 1204, 'Acolla'),
(120402, 1204, 'Apata'),
(120403, 1204, 'Ataura'),
(120404, 1204, 'Canchayllo'),
(120405, 1204, 'Curicaca'),
(120406, 1204, 'El Mantaro'),
(120407, 1204, 'Huamalí'),
(120408, 1204, 'Huaripampa'),
(120409, 1204, 'Huertas'),
(120410, 1204, 'Janjaillo'),
(120411, 1204, 'Jauja'),
(120412, 1204, 'Julcán'),
(120413, 1204, 'Leonor Ordóñez'),
(120414, 1204, 'Llocllapampa'),
(120415, 1204, 'Marco'),
(120416, 1204, 'Masma'),
(120417, 1204, 'Masma Chicche'),
(120418, 1204, 'Molinos'),
(120419, 1204, 'Monobamba'),
(120420, 1204, 'Muqui'),
(120421, 1204, 'Muquiyauyo'),
(120422, 1204, 'Paca'),
(120423, 1204, 'Paccha'),
(120424, 1204, 'Pancán'),
(120425, 1204, 'Parco'),
(120426, 1204, 'Pomacancha'),
(120427, 1204, 'Ricrán'),
(120428, 1204, 'San Lorenzo'),
(120429, 1204, 'San Pedro de Chunán'),
(120430, 1204, 'Sausa'),
(120431, 1204, 'Sincos'),
(120432, 1204, 'Tunan Marca'),
(120433, 1204, 'Yauli'),
(120434, 1204, 'Yauyos');

-- JUNÍN - 1205
INSERT INTO distrito (iddistrito, idprovincia, distrito) VALUES
(120501, 1205, 'Carhuamayo'),
(120502, 1205, 'Junín'),
(120503, 1205, 'Ondores'),
(120504, 1205, 'Ulcumayo');

-- SATIPO - 1206
INSERT INTO distrito (iddistrito, idprovincia, distrito) VALUES
(120601, 1206, 'Coviriali'),
(120602, 1206, 'Llaylla'),
(120603, 1206, 'Mazamari'),
(120604, 1206, 'Pampa Hermosa'),
(120605, 1206, 'Pangoa'),
(120606, 1206, 'Río Negro'),
(120607, 1206, 'Río Tambo'),
(120608, 1206, 'Satipo'),
(120609, 1206, 'Vizcatán del Ene');

-- TARMA - 1207
INSERT INTO distrito (iddistrito, idprovincia, distrito) VALUES
(120701, 1207, 'Acobamba'),
(120702, 1207, 'Huaricolca'),
(120703, 1207, 'Huasahuasi'),
(120704, 1207, 'La Unión'),
(120705, 1207, 'Palca'),
(120706, 1207, 'Palcamayo'),
(120707, 1207, 'San Pedro de Cajas'),
(120708, 1207, 'Tapo'),
(120709, 1207, 'Tarma');

-- YAULI - 1208
INSERT INTO distrito (iddistrito, idprovincia, distrito) VALUES
(120801, 1208, 'Chacapalpa'),
(120802, 1208, 'Huayhuay'),
(120803, 1208, 'La Oroya'),
(120804, 1208, 'Marcapomacocha'),
(120805, 1208, 'Morococha'),
(120806, 1208, 'Paccha'),
(120807, 1208, 'Santa Bárbara de Carhuacayán'),
(120808, 1208, 'Santa Rosa de Sacco'),
(120809, 1208, 'Suitucancha'),
(120810, 1208, 'Yauli');

-- CHUPACA - 1209
INSERT INTO distrito (iddistrito, idprovincia, distrito) VALUES
(120901, 1209, 'Ahuac'),
(120902, 1209, 'Chongos Bajo'),
(120903, 1209, 'Chupaca'),
(120904, 1209, 'Huáchac'),
(120905, 1209, 'Huamancaca Chico'),
(120906, 1209, 'San Juan de Yscos'),
(120907, 1209, 'San Juan de Jarpa'),
(120908, 1209, 'Tres de Diciembre'),
(120909, 1209, 'Yanacancha');

-- Para buscar la provincia Cajatambo
 SELECT * FROM provincia WHERE provincia = 'Cajatambo';


-- Distritos de Cajatambo (provincia 1503, departamento Lima)
INSERT INTO distrito (iddistrito, idprovincia, distrito) VALUES
(150301, 1503, 'Cajatambo'),
(150302, 1503, 'Copa'),
(150303, 1503, 'Gorgor'),
(150304, 1503, 'Huancapón'),
(150305, 1503, 'Manás');




CREATE TABLE registro_ubicacion (
    id INT AUTO_INCREMENT PRIMARY KEY,
    iddepartamento INT NOT NULL,
    idprovincia INT NOT NULL,
    iddistrito INT NOT NULL,
    direccion VARCHAR(255) NOT NULL,
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (iddepartamento) REFERENCES departamento(iddepartamento),
    FOREIGN KEY (idprovincia) REFERENCES provincia(idprovincia),
    FOREIGN KEY (iddistrito) REFERENCES distrito(iddistrito)
);