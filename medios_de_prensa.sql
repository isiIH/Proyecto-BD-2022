-- MySQL dump 10.19  Distrib 10.3.34-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: medios_de_prensa
-- ------------------------------------------------------
-- Server version	10.3.34-MariaDB-0ubuntu0.20.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `medios`
--

DROP TABLE IF EXISTS `medios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `url` text DEFAULT NULL,
  `region` varchar(255) DEFAULT NULL,
  `pais` varchar(255) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `tipo` varchar(10) DEFAULT NULL,
  `idioma` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medios`
--

LOCK TABLES `medios` WRITE;
/*!40000 ALTER TABLE `medios` DISABLE KEYS */;
INSERT INTO `medios` VALUES (1,'El Cachapoal','https://elcachapoal.cl/','Ohiggins','Chile','2003-11-05','regional','es'),(2,'El Rancaguino','https://www.elrancaguino.cl/','Ohiggins','Chile','1938-01-15','regional','es'),(3,'La Noticia Online','http://lanoticiaonline.cl/','Ohiggins','Chile','2014-07-25','regional','es');
/*!40000 ALTER TABLE `medios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mencionar`
--

DROP TABLE IF EXISTS `mencionar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mencionar` (
  `id_noticias` int(11) NOT NULL,
  `id_personas` int(11) NOT NULL,
  PRIMARY KEY (`id_noticias`,`id_personas`),
  KEY `id_personas` (`id_personas`),
  CONSTRAINT `mencionar_ibfk_1` FOREIGN KEY (`id_noticias`) REFERENCES `noticias` (`id`),
  CONSTRAINT `mencionar_ibfk_2` FOREIGN KEY (`id_personas`) REFERENCES `personas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mencionar`
--

LOCK TABLES `mencionar` WRITE;
/*!40000 ALTER TABLE `mencionar` DISABLE KEYS */;
INSERT INTO `mencionar` VALUES (1,1),(1,2),(1,3),(1,4),(3,5),(3,6),(3,7),(4,8),(4,9),(4,10),(4,11),(4,12),(4,13);
/*!40000 ALTER TABLE `mencionar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `noticias`
--

DROP TABLE IF EXISTS `noticias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `noticias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` text DEFAULT NULL,
  `titulo` text DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `contenido` text DEFAULT NULL,
  `id_medios` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_medios` (`id_medios`),
  CONSTRAINT `noticias_ibfk_1` FOREIGN KEY (`id_medios`) REFERENCES `medios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `noticias`
--

LOCK TABLES `noticias` WRITE;
/*!40000 ALTER TABLE `noticias` DISABLE KEYS */;
INSERT INTO `noticias` VALUES (1,'https://elcachapoal.cl/2022/07/12/expertos-destacan-la-importancia-de-los-humedales-en-charla-organizada-por-ingenieria-ambiental-uoh-%ef%bf%bc/','Expertos destacan la importancia de los humedales en charla organizada por Ingenier??a Ambiental UOH .???','2022-07-12',' La carrera perteneciente a la Escuela de Ciencias Agroalimentarias, Animales y Ambientales (ECA3) de la Universidad Estatal de O???Higgins (UOH) organiz?? un conversatorio donde se abord?? la necesidad de proteger estos reservorios de biodiversidad. Estudiantes, acad??micas y acad??micos, docentes y representantes de Municipalidades de Placilla, Pichilemu y Las Cabras entre otros actores sociales fueron protagonistas del conversatorio ???Humedales de la Regi??n de O???Higgins???, que se realiz?? en el sal??n auditorio del Campus Colchagua de la UOH, y que cont?? con tres expositores que destacaron la importancia de los humedales, por su constante interrelaci??n con los seres vivos que los habitan, y que los convierten en reservas fundamentales para la conservaci??n de flora y fauna. La primera exposici??n estuvo a cargo de la Seremi del Medioambiente de O???Higgins, Giovanna Amaya, quien analiz?? los humedales urbanos. ???Nos interesa trabajar con la academia, con la formaci??n de los futuros profesionales que se van a enfrentar a los desaf??os ambientales que tiene nuestra Regi??n. Entre ellos, los humedales urbanos representan un gran hotspot (lugar de gran riqueza) para la biodiversidad y, por ello, estamos trabajando con las ordenanzas ambientales y con la ordenanza local, respecto a la protecci??n de estos territorios???, se??al?? la autoridad. Regi??n rica y diversa Ver??nica Gonz??lez, encargada del Departamento de Ecosistemas Acu??ticos de la Seremi del Medio Ambiente, se refiri?? a la riqueza de la Regi??n de O???Higgins en materia de presencia de humedales de diversa tipolog??a. ???Tenemos varios tipos, pues contamos con una gran cuenca en la zona de Rapel; tenemos muchos cuerpos de agua continentales, tambi??n una red de humedales costeros y cordones de glaciares en la cordillera con humedales altos andinos y peque??as vegas. Por ello, es interesante ver las formas de identificarlos, diagnosticarlos y conservarlos???. Los humedales almacenan carbono, reducen inundaciones, aten??an las sequ??as, amortiguan la intensidad del mar y son esenciales para la conservaci??n de la flora y la fauna, ya que ???el 40% de las especies vegetales y animales viven o se reproducen en humedales???, afirm?? Diego Pe??aloza, profesional de Departamento de ??reas Silvestres Protegidas de Conaf O???Higgins. Tambi??n explic?? que el monitoreo de los humedales, se realiza a trav??s de censos de especies, la academia y la denuncia de la comunidad. En nombre de los organizadores del conversatorio, destac?? la importancia de realizar estas actividades, el director ECA3, Dr. Set P??rez: ???Los humedales son temas del ??mbito ambiental y nuestra Universidad debe ser un actor relevante, entregando soluciones como tambi??n observando, vigilando y supervisando acciones que se realizan en el ??mbito cient??fico respecto al medio ambiente, y que tambi??n entreguen informaci??n para la formaci??n de nuestros estudiantes, que ser??n agentes de cambio que contribuir??n con ideas e innovaci??n en ??mbitos que son importantes para la regi??n y el pa??s???. Por su parte, los estudiantes de ECA3, especialmente los de Ingenier??a Ambiental, mostraron su inter??s realizando diversas preguntas a los tres expositores y Renata Pino Z????iga, alumna de tercer a??o de la carrera sostuvo que ???nuestra profesi??n est?? directamente relacionada con la conservaci??n y protecci??n de h??bitats y los humedales est??n en peligro de conservaci??n, por lo tanto, estos conversatorios nos permiten conocer m??s sobre estos importantes temas y con distintos puntos de vista sobre la materia???.',1),(2,'https://elcachapoal.cl/2022/07/12/circulacion-de-virus-respiratorios-tiende-a-la-baja-%ef%bf%bc/','Circulaci??n de virus respiratorios tiende a la baja.???','2022-07-12',' Seg??n inform?? la Seremi de Salud O??Higgins, en las ??ltimas semanas los ??ndices bajaron de un 74.2% a un 62%. En palabras de la titular regional de la cartera, y en base a las ???118 muestras analizadas por el ISP: un 36% corresponder??a a virus respiratorio sincicial, un 16% a SARS-CoV-2, y un 21% a metapneumovirus???. La seremi de Salud de O??Higgins, Dra. Carolina Torres Pinto, inform?? que ???desde el 15 de mayo en adelante hab??amos tenido una circulaci??n viral un poquito m??s preocupante???, que alcanz?? un??peak??de 74.2%. Sin embargo, ???estas ??ltimas semanas ha ido a la baja???, llegando al 62%. La Dra. Torres, detall?? que ???de los ciento dieciocho casos que hizo an??lisis el ISP, tomando muestras de los distintos casos que llegan a consultar en urgencia, tenemos que un 36% de ellos present?? virus respiratorio sincicial, un 16% infecci??n por??SARS-CoV-2, y el 21% por metapneumovirus???. Para la Autoridad Sanitaria la evoluci??n de las enfermedades respiratorias resulta relevante, ???porque adelantar las vacaciones y extenderlas una semana va dirigido, justamente, a disminuir la circulaci??n viral???. ???Se ve??a que este invierno afectar??a m??s intensamente a la poblaci??n pedi??trica, entonces este tema nos ha tenido ocupados. La idea es ir revisando resultados???, afirm??. A regl??n seguido, la titular regional de Salud se??al?? que ???si bien es cierto que estas ??ltimas semanas se ha visto una disminuci??n de las consultas, de todas formas, es necesario reiterar la invitaci??n a que los padres nos ayuden en el ??xito de la estrategia: que ojal?? no vayan a lugares demasiado concurridos, que recuerden utilizar todas las capas de protecci??n y dentro de ellas la primera es mantener actualizado nuestro esquema de vacunaci??n???. ???As?? que pedirles que, por favor, aprovechen estos d??as para ir a los vacunatorios y ponerse al d??a con sus vacunas contra el COVID-19 e influenza. Recordemos que hay algunos grupos que no han respondido adecuadamente a esta invitaci??n???, dijo la Dra. Torres. Finalmente, la Seremi de Salud de O??Higgins invit?? a ???quienes est??n sospechando de SARS-CoV-2 a concurrir a los puntos de testeo y as?? poder confirmar o descartar la enfermedad, y al mismo tiempo tomar las medidas de contenci??n correspondientes: que se haga el aislamiento, si se puede en casa excelente, de lo contrario, para ser derivados a las residencias sanitarias que, como Serem??a, tenemos habilitadas???.',1),(3,'https://elcachapoal.cl/2022/07/12/balance-lluvias-trabajos-preventivos-evitaron-emergencias-en-sectores-que-historicamente-se-inundaban-en-rancagua-%ef%bf%bc%ef%bf%bc/','Balance lluvias: trabajos preventivos evitaron emergencias en sectores que hist??ricamente se inundaban en Rancagua.??????','2022-07-12',' Alcalde Juan Ram??n Godoy destac??, adem??s, que equipos de emergencia trabajaron en terreno para resguardar la seguridad de vecinos y vecinas. Durante el fin de semana en Rancagua cayeron 45,6 mil??metros de agua producto de las lluvias. Pero a pesar de lo intenso del sistema frontal, los trabajos preventivos realizados por la Municipalidad de Rancagua permitieron disminuir las situaciones de emergencia en la ciudad. Los esfuerzos se concentraron, primero, en los d??as previos a las precipitaciones. Durante la semana pasada se reuni?? el Comit?? de Gesti??n del Riesgo de Desastres (COGRID), compuesto por distintas direcciones municipales y entidades p??blico-privadas, para coordinar los trabajos a realizar con el fin de resguardar a las y los rancag??inos. Junto a lo anterior, equipos de la Direcci??n de Gesti??n Ambiental (DGA) de la Municipalidad de Rancagua realizaron limpieza de sumideros, canaletas, canales y reposici??n de rejillas de drenaje en distintos puntos de la capital de O???Higgins. Trabajos que evitaron emergencias en sectores que hist??ricamente se inundaban. As?? lo destaca el alcalde de Rancagua, Juan Ram??n Godoy:?????Nosotros durante una semana, junto a los equipos municipales, comenzamos un plan preventivo de limpieza de canales, limpieza de sumideros, y tambi??n identificando los puntos cr??ticos de la ciudad que se inundan???. Ya durante el fin de semana, el municipio dispuso de cuadrillas de operaciones que fueron reforzadas con equipos de arbolado y ??reas verdes; trabajaron camiones hidrojet y aljibes en puntos estrat??gicos, que fueron en apoyo de vecinas y vecinos que as?? lo requirieron. ???Contratamos camiones hidrojet, el paso nivel de la Alameda no se inund?? y que hist??ricamente se inunda; tambi??n estuvimos en el paso Rep??blica de Chile y en distintos puntos de la ciudad donde con estos camiones pudimos tener una fluidez del tr??nsito que es complejo en tiempos de invierno???,??complement?? el alcalde de Rancagua. Por otra parte, durante s??bado y domingo se reforzaron los turnos de emergencia de asistentes sociales de la Direcci??n de Desarrollo Comunitario (Dideco) para cubrir el evento clim??tico pronosticado, entregando ayuda en terreno a familias que viven en campamentos y tambi??n en situaci??n de calle. ???Los campamentos recibieron todo tipo de equipamiento, combustible, frazadas, tambi??n estamos trabajando en temas de alimentaci??n, con los equipos psico-sociales que tenemos en todos los campamentos de la ciudad???,??a??adi?? el alcalde Juan Ram??n Godoy. Adem??s, se reforzaron las capacidades de operaci??n del albergue municipal, donde actualmente permanecen 200 personas.',1),(4,'https://elcachapoal.cl/2022/07/12/municipalidad-entrego-subvenciones-a-organizaciones-sociales-e-instituciones-de-rancagua-%ef%bf%bc/','Municipalidad entreg?? subvenciones a organizaciones sociales e instituciones de Rancagua.???','2022-07-12',' El alcalde Juan Ram??n Godoy se??al?? que este beneficio?????es un apoyo importante para el desarrollo, autogesti??n y tambi??n, para el trabajo que est??n realizando con la comunidad. Agradecerle a cada una de las organizaciones porque entendemos que hay un trabajo de fondo, sacrificio y compromiso???. 29 instituciones y organizaciones sociales fueron beneficiadas con la entrega de subvenciones por parte de la Municipalidad de Rancagua, monto que -en total- supera los 138 millones de pesos. De esta forma, se busca entregar una ayuda para que??puedan continuar desarrollando sus actividades y proyectos que permitan mejorar su calidad de vida. El alcalde Juan Ram??n Godoy destac?? que?????este beneficio es un apoyo importante para el desarrollo, autogesti??n y tambi??n, para el trabajo que est??n realizando con la comunidad. Agradecerle a cada una de las organizaciones porque entendemos que hay un trabajo de fondo, sacrificio y compromiso???. Sobre el beneficio que recibir??n algunas instituciones, el alcalde puntualiz?? que?????para muchas juntas de vecinos esta subvenci??n tambi??n considera los medidores. Hemos tenido una gran cantidad de vandalismo en toda la ciudad de Rancagua (???) Juntas y juntos sin duda construimos un Rancagua m??s cerca, pero tambi??n m??s seguro y eso se hace no solo con un alcalde y un concejo municipal, sino que con todas las organizaciones sociales de nuestra ciudad???. Alicia Reyes Ferrada, representante de??la Agrupaci??n Social Comit?? de Administraci??n del Centro Comunitario San Joaqu??n??entreg?? unas palabras en la actividad:?????Nos reunimos en una ocasi??n muy especial donde se nos har?? entrega de una importante ayuda que ir?? en beneficio de cada una de las organizaciones presentes que nos permitir?? continuar con nuestras actividades y quehaceres propios (???) reciban ustedes nuestras m??s sinceras gratitudes y al alcalde, muchas gracias por la gesti??n que ha realizado???. En la entrega participaron la diputada Marta Gonz??lez, los concejales Cristian Toledo, Mar??a del Carmen Orueta y el consejero regional, Lenin Arroyo.',1),(5,'https://elcachapoal.cl/2022/07/12/pdi-detuvo-a-sujeto-que-tenia-computadores-robados-a-centro-asistencial-de-santa-cruz/','PDI detuvo a sujeto que ten??a computadores robados a Centro Asistencial de Santa Cruz.','2022-07-12',' Intent?? deshacerse de los equipos, lanz??ndolos por la ventana al advertir la presencia de la polic??a civil. Durante la tarde de ayer, personal de la Brigada de Investigaci??n Criminal (BICRIM) Santa Cruz, recopil?? antecedentes en los cuales se se??alaba que, al interior de un departamento de la Poblaci??n Pablo Neruda de misma comuna, hab??a equipos computacionales que fueron robados desde la Estaci??n M??dico Urbana (EMU) santacruzana. Debido a lo anterior, los polic??as tomaron contacto con el fiscal de turno, quien solicit?? al personal de la BICRIM Santa Cruz concurrir hasta el departamento indicado, para verificar los datos obtenidos. Sin embargo, mientras el equipo de la PDI iba llegando al lugar, divisaron a un sujeto que arroj?? una bolsa por la ventana, la que fue revisada por los detectives, quienes constataron la existencia de computadores en su interior. Seguidamente los efectivos policiales golpearon la puerta del departamento denunciado y fueron atendidos por el mismo sujeto que hab??a arrojado las especies por la ventana, raz??n por la cual, tras verificar con documentos que se trataba de los equipos robados a la EMU Santa Cruz, fue detenido por el delito de receptaci??n flagrante. El procedimiento fue informado al fiscal de turno, quien instruy?? que el sujeto de 25 a??os de edad -que ya hab??a sido detenido por la PDI hace dos meses, por el delito microtr??fico-, fuese puesto a disposici??n del Juzgado de Garant??a de Santa Cruz, para su respectivo control de detenci??n.',1);
/*!40000 ALTER TABLE `noticias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personas`
--

DROP TABLE IF EXISTS `personas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `wiki` tinyint(1) DEFAULT NULL,
  `profesion` varchar(255) DEFAULT NULL,
  `nacimiento` date DEFAULT NULL,
  `nacionalidad` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personas`
--

LOCK TABLES `personas` WRITE;
/*!40000 ALTER TABLE `personas` DISABLE KEYS */;
INSERT INTO `personas` VALUES (1,'Giovanna Amaya',1,'Gobierno','1886-01-01','Gobierno Vasco'),(2,'Ver??nica Gonz??lez',1,'modelo','1983-01-22','costarricense'),(3,'Diego Pe??aloza',1,'educadora y pedagoga','1950-05-28','argentina'),(4,'Renata Pino Z????iga',1,'mam??','2022-07-12','Valdivia'),(5,'Alcalde Juan Ram??n Godoy',1,'pol??tico','1977-11-20','chileno'),(6,'Juan Ram??n Godoy:?????Nosotros',1,'pol??tico','1977-11-20','chileno'),(7,'Juan Ram??n Godoy',1,'pol??tico','1977-11-20','chileno'),(8,'Juan Ram??n Godoy',1,'pol??tico','1977-11-20','chileno'),(9,'Alicia Reyes Ferrada',1,'Mendes','2022-07-12','chilena'),(10,'Marta Gonz??lez',1,'actriz','1944-11-28','argentina'),(11,'Cristian Toledo',1,'Albacete','2022-07-12','Espa??a'),(12,'Mar??a del Carmen Orueta',1,'teniente general de los Reales Ej??rcitos','1736-01-01','espa??ol'),(13,'Lenin Arroyo',1,'uso agr??cola','1845-01-01','mujeres');
/*!40000 ALTER TABLE `personas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `popularidad`
--

DROP TABLE IF EXISTS `popularidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `popularidad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `visitas` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `id_personas` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_personas` (`id_personas`),
  CONSTRAINT `popularidad_ibfk_1` FOREIGN KEY (`id_personas`) REFERENCES `personas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `popularidad`
--

LOCK TABLES `popularidad` WRITE;
/*!40000 ALTER TABLE `popularidad` DISABLE KEYS */;
INSERT INTO `popularidad` VALUES (1,25,'2022-06-01',2),(2,27,'2022-06-02',2),(3,31,'2022-06-03',2),(4,24,'2022-06-04',2),(5,17,'2022-06-05',2),(6,30,'2022-06-06',2),(7,16,'2022-06-07',2),(8,29,'2022-06-08',2),(9,18,'2022-06-09',2),(10,22,'2022-06-10',2),(11,11,'2022-06-11',2),(12,22,'2022-06-12',2),(13,16,'2022-06-13',2),(14,31,'2022-06-14',2),(15,34,'2022-06-15',2),(16,27,'2022-06-16',2),(17,29,'2022-06-17',2),(18,18,'2022-06-18',2),(19,22,'2022-06-19',2),(20,21,'2022-06-20',2),(21,27,'2022-06-21',2),(22,20,'2022-06-22',2),(23,28,'2022-06-23',2),(24,20,'2022-06-24',2),(25,28,'2022-06-25',2),(26,17,'2022-06-26',2),(27,33,'2022-06-27',2),(28,16,'2022-06-28',2),(29,16,'2022-06-29',2),(30,16,'2022-06-30',2),(31,10,'2022-06-01',7),(32,6,'2022-06-02',7),(33,12,'2022-06-03',7),(34,12,'2022-06-04',7),(35,7,'2022-06-05',7),(36,13,'2022-06-06',7),(37,11,'2022-06-07',7),(38,17,'2022-06-08',7),(39,12,'2022-06-09',7),(40,28,'2022-06-10',7),(41,6,'2022-06-11',7),(42,7,'2022-06-12',7),(43,6,'2022-06-13',7),(44,64,'2022-06-14',7),(45,10,'2022-06-15',7),(46,12,'2022-06-16',7),(47,15,'2022-06-17',7),(48,14,'2022-06-18',7),(49,13,'2022-06-19',7),(50,3,'2022-06-20',7),(51,3,'2022-06-21',7),(52,15,'2022-06-22',7),(53,14,'2022-06-23',7),(54,5,'2022-06-24',7),(55,8,'2022-06-25',7),(56,4,'2022-06-26',7),(57,7,'2022-06-27',7),(58,21,'2022-06-28',7),(59,11,'2022-06-29',7),(60,18,'2022-06-30',7),(61,10,'2022-06-01',8),(62,6,'2022-06-02',8),(63,12,'2022-06-03',8),(64,12,'2022-06-04',8),(65,7,'2022-06-05',8),(66,13,'2022-06-06',8),(67,11,'2022-06-07',8),(68,17,'2022-06-08',8),(69,12,'2022-06-09',8),(70,28,'2022-06-10',8),(71,6,'2022-06-11',8),(72,7,'2022-06-12',8),(73,6,'2022-06-13',8),(74,64,'2022-06-14',8),(75,10,'2022-06-15',8),(76,12,'2022-06-16',8),(77,15,'2022-06-17',8),(78,14,'2022-06-18',8),(79,13,'2022-06-19',8),(80,3,'2022-06-20',8),(81,3,'2022-06-21',8),(82,15,'2022-06-22',8),(83,14,'2022-06-23',8),(84,5,'2022-06-24',8),(85,8,'2022-06-25',8),(86,4,'2022-06-26',8),(87,7,'2022-06-27',8),(88,21,'2022-06-28',8),(89,11,'2022-06-29',8),(90,18,'2022-06-30',8),(91,24,'2022-06-01',10),(92,33,'2022-06-02',10),(93,27,'2022-06-03',10),(94,33,'2022-06-04',10),(95,48,'2022-06-05',10),(96,39,'2022-06-06',10),(97,18,'2022-06-07',10),(98,24,'2022-06-08',10),(99,37,'2022-06-09',10),(100,28,'2022-06-10',10),(101,39,'2022-06-11',10),(102,32,'2022-06-12',10),(103,30,'2022-06-13',10),(104,14,'2022-06-14',10),(105,38,'2022-06-15',10),(106,102,'2022-06-16',10),(107,36,'2022-06-17',10),(108,28,'2022-06-18',10),(109,47,'2022-06-19',10),(110,21,'2022-06-20',10),(111,27,'2022-06-21',10),(112,20,'2022-06-22',10),(113,35,'2022-06-23',10),(114,16,'2022-06-24',10),(115,26,'2022-06-25',10),(116,382,'2022-06-26',10),(117,33,'2022-06-27',10),(118,39,'2022-06-28',10),(119,43,'2022-06-29',10),(120,32,'2022-06-30',10);
/*!40000 ALTER TABLE `popularidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poseer`
--

DROP TABLE IF EXISTS `poseer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `poseer` (
  `fecha` date DEFAULT NULL,
  `id_medios` int(11) NOT NULL,
  `id_propietario` int(11) NOT NULL,
  PRIMARY KEY (`id_medios`,`id_propietario`),
  KEY `id_propietario` (`id_propietario`),
  CONSTRAINT `poseer_ibfk_1` FOREIGN KEY (`id_medios`) REFERENCES `medios` (`id`),
  CONSTRAINT `poseer_ibfk_2` FOREIGN KEY (`id_propietario`) REFERENCES `propietario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poseer`
--

LOCK TABLES `poseer` WRITE;
/*!40000 ALTER TABLE `poseer` DISABLE KEYS */;
INSERT INTO `poseer` VALUES ('1915-08-15',2,1),('1955-08-15',2,2),('2005-08-15',2,3);
/*!40000 ALTER TABLE `poseer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `propietario`
--

DROP TABLE IF EXISTS `propietario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `propietario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `persona` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `propietario`
--

LOCK TABLES `propietario` WRITE;
/*!40000 ALTER TABLE `propietario` DISABLE KEYS */;
INSERT INTO `propietario` VALUES (1,'Miguel Gonz??lez Navarro','Natural'),(2,'H??ctor Gonz??lez Valenzuela ','Natural'),(3,'Alejandro Gonz??lez Pino','Natural');
/*!40000 ALTER TABLE `propietario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-07-12 21:56:41
