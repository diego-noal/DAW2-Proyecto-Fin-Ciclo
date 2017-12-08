-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.2.10-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para dnr_proyecto_daw
DROP DATABASE IF EXISTS `dnr_proyecto_daw`;
CREATE DATABASE IF NOT EXISTS `dnr_proyecto_daw` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `dnr_proyecto_daw`;

-- Volcando estructura para función dnr_proyecto_daw.func_dias_laborales_totales
DROP FUNCTION IF EXISTS `func_dias_laborales_totales`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `func_dias_laborales_totales`(date1 DATE, date2 DATE) RETURNS int(11)
RETURN ABS(DATEDIFF(date2, date1)) + 1.0
     - ABS(DATEDIFF(ADDDATE(date2, INTERVAL 1 - DAYOFWEEK(date2) DAY),
                    ADDDATE(date1, INTERVAL 1 - DAYOFWEEK(date1) DAY))) / 7 * 2
     - (DAYOFWEEK(IF(date1 < date2, date1, date2)) = 1)
     - (DAYOFWEEK(IF(date1 > date2, date1, date2)) = 7)//
DELIMITER ;

-- Volcando estructura para tabla dnr_proyecto_daw.imputations
DROP TABLE IF EXISTS `imputations`;
CREATE TABLE IF NOT EXISTS `imputations` (
  `id_imputacion` int(11) NOT NULL AUTO_INCREMENT,
  `ref_id_proyecto` int(11) NOT NULL,
  `ref_nom_proyecto` varchar(60) NOT NULL,
  `ref_username` varchar(45) NOT NULL,
  `ref_tarea` varchar(50) NOT NULL,
  `comentarios` varchar(500) DEFAULT '',
  `fecha` varchar(11) DEFAULT '',
  `horas` varchar(5) DEFAULT '',
  PRIMARY KEY (`id_imputacion`),
  KEY `ref_id_proyecto` (`ref_id_proyecto`),
  KEY `ref_nom_proyecto` (`ref_nom_proyecto`),
  KEY `ref_username` (`ref_username`),
  KEY `ref_tarea` (`ref_tarea`),
  CONSTRAINT `imputations_ibfk_1` FOREIGN KEY (`ref_id_proyecto`) REFERENCES `projects` (`id_proyecto`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `imputations_ibfk_2` FOREIGN KEY (`ref_nom_proyecto`) REFERENCES `projects` (`nom_proyecto`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `imputations_ibfk_3` FOREIGN KEY (`ref_username`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `imputations_ibfk_4` FOREIGN KEY (`ref_tarea`) REFERENCES `tasks` (`tarea`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla dnr_proyecto_daw.imputations: ~12 rows (aproximadamente)
/*!40000 ALTER TABLE `imputations` DISABLE KEYS */;
INSERT INTO `imputations` (`id_imputacion`, `ref_id_proyecto`, `ref_nom_proyecto`, `ref_username`, `ref_tarea`, `comentarios`, `fecha`, `horas`) VALUES
	(1, 1, 'SIVSA 2018', 'master', 'Control Interno', 'Arreglando los problemas', '2017-11-08', '8'),
	(2, 2, 'PROYECTO DAW', 'master', 'Control Interno', 'Arreglando los problemas', '2017-11-09', '8'),
	(3, 3, 'PRUEBA', 'master', 'Control Interno', 'Arreglando los problemas', '2017-11-11', '8'),
	(4, 1, 'SIVSA 2018', 'admin', 'Control Interno', 'Arreglando los problemas', '2017-11-08', '8'),
	(5, 2, 'PROYECTO DAW', 'admin', 'Control Interno', 'Arreglando los problemas', '2017-11-09', '8'),
	(6, 3, 'PRUEBA', 'admin', 'Control Interno', 'Arreglando los problemas', '2017-11-11', '8'),
	(7, 1, 'SIVSA 2018', 'diego', 'Control Interno', 'Arreglando los problemas', '2017-11-08', '8'),
	(8, 2, 'PROYECTO DAW', 'diego', 'Control Interno', 'Arreglando los problemas', '2017-11-09', '8'),
	(9, 3, 'PRUEBA', 'diego', 'Control Interno', 'Arreglando los problemas', '2017-11-11', '8'),
	(10, 1, 'SIVSA 2018', 'prueba', 'Control Interno', 'Arreglando los problemas', '2017-11-08', '8'),
	(11, 2, 'PROYECTO DAW', 'prueba', 'Control Interno', 'Arreglando los problemas', '2017-11-09', '8'),
	(12, 3, 'PRUEBA', 'prueba', 'Control Interno', 'Arreglando los problemas', '2017-11-11', '8');
/*!40000 ALTER TABLE `imputations` ENABLE KEYS */;

-- Volcando estructura para tabla dnr_proyecto_daw.projects
DROP TABLE IF EXISTS `projects`;
CREATE TABLE IF NOT EXISTS `projects` (
  `id_proyecto` int(11) NOT NULL AUTO_INCREMENT,
  `nom_proyecto` varchar(60) NOT NULL,
  `ref_fase_pro` varchar(60) NOT NULL,
  `descripcion` varchar(250) DEFAULT '',
  PRIMARY KEY (`id_proyecto`),
  KEY `nom_proyecto` (`nom_proyecto`),
  KEY `ref_fase_pro` (`ref_fase_pro`),
  CONSTRAINT `projects_ibfk_1` FOREIGN KEY (`ref_fase_pro`) REFERENCES `project_phases` (`fase_pro`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla dnr_proyecto_daw.projects: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
INSERT INTO `projects` (`id_proyecto`, `nom_proyecto`, `ref_fase_pro`, `descripcion`) VALUES
	(1, 'SIVSA 2018', 'Nueva', 'Practicas en centro de trabajo'),
	(2, 'XUNTA DE GALICIA', 'En proceso', 'Proyecto asignado en SIVSA'),
	(3, 'PROYECTO DAW', 'En proceso', 'Proyecto de fin de ciclo de DAW'),
	(4, 'PRUEBA', 'En estudio', 'Proyecto de prueba');
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;

-- Volcando estructura para tabla dnr_proyecto_daw.project_phases
DROP TABLE IF EXISTS `project_phases`;
CREATE TABLE IF NOT EXISTS `project_phases` (
  `id_fase_pro` int(11) NOT NULL AUTO_INCREMENT,
  `fase_pro` varchar(60) NOT NULL,
  `des_fase_pro` varchar(250) DEFAULT '',
  PRIMARY KEY (`id_fase_pro`),
  KEY `fase_pro` (`fase_pro`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla dnr_proyecto_daw.project_phases: ~7 rows (aproximadamente)
/*!40000 ALTER TABLE `project_phases` DISABLE KEYS */;
INSERT INTO `project_phases` (`id_fase_pro`, `fase_pro`, `des_fase_pro`) VALUES
	(1, 'Nueva', 'Paso 1'),
	(2, 'En estudio', 'Paso 2'),
	(3, 'En progreso', 'Paso 3'),
	(4, 'En valiación', 'Paso 4'),
	(5, 'Completar informaciíon', 'Paso 5'),
	(6, 'Validada', 'Paso 6'),
	(7, 'Cerrada', 'Paso 7');
/*!40000 ALTER TABLE `project_phases` ENABLE KEYS */;

-- Volcando estructura para tabla dnr_proyecto_daw.tasks
DROP TABLE IF EXISTS `tasks`;
CREATE TABLE IF NOT EXISTS `tasks` (
  `id_tarea` int(11) NOT NULL AUTO_INCREMENT,
  `cod_tarea` varchar(3) NOT NULL,
  `tarea` varchar(70) NOT NULL,
  PRIMARY KEY (`id_tarea`),
  KEY `tarea` (`tarea`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla dnr_proyecto_daw.tasks: ~25 rows (aproximadamente)
/*!40000 ALTER TABLE `tasks` DISABLE KEYS */;
INSERT INTO `tasks` (`id_tarea`, `cod_tarea`, `tarea`) VALUES
	(1, 'AN', 'Análisis'),
	(2, 'CB', 'Cableado'),
	(3, 'CD', 'Carga de datos'),
	(4, 'CI', 'Control Interno'),
	(5, 'DC', 'Documentación'),
	(6, 'DI', 'Diseño'),
	(7, 'DM', 'Demostración'),
	(8, 'DS', 'Desarrollo'),
	(9, 'FE', 'Formación Externa (/hora)'),
	(10, 'FI', 'Formación Interna (/hora)'),
	(11, 'GD', 'Grabación de datos'),
	(12, 'GL', 'Guardia Localizable'),
	(13, 'GP', 'Gestión de proyecto'),
	(14, 'HE', 'Horas Extras'),
	(15, 'INS', 'Instalación de Aplicaciones'),
	(16, 'INT', 'Integración'),
	(17, 'MA', 'Maquetación'),
	(18, 'PL', 'Planificación'),
	(19, 'PP', 'Plan de pruebas'),
	(20, 'PR', 'Programación'),
	(21, 'PU', 'Pruebas unitarias'),
	(22, 'RE', 'Reunión'),
	(23, 'ST', 'Soporte Técnico'),
	(24, 'TST', 'Testeo'),
	(25, 'VJ', 'VIAJE');
/*!40000 ALTER TABLE `tasks` ENABLE KEYS */;

-- Volcando estructura para tabla dnr_proyecto_daw.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `iduser` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `PASSWORD` varchar(60) NOT NULL,
  `enabled` tinyint(4) DEFAULT 1,
  `ref_role` varchar(45) DEFAULT 'ROLE_USER',
  PRIMARY KEY (`iduser`),
  UNIQUE KEY `uni_username_user` (`username`),
  KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla dnr_proyecto_daw.users: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`iduser`, `username`, `PASSWORD`, `enabled`, `ref_role`) VALUES
	(1, 'master', 'master', 1, 'ROLE_MASTER'),
	(2, 'admin', 'admin', 1, 'ROLE_ADMIN'),
	(3, 'diego', 'diego', 1, 'ROLE_USER'),
	(4, 'prueba', 'prueba', 1, 'ROLE_USER'),
	(5, 'test', 'test', 0, 'ROLE_USER');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Volcando estructura para tabla dnr_proyecto_daw.user_data
DROP TABLE IF EXISTS `user_data`;
CREATE TABLE IF NOT EXISTS `user_data` (
  `ref_username` varchar(45) NOT NULL,
  `nombre` varchar(45) DEFAULT '',
  `apellido1` varchar(45) DEFAULT '',
  `apellido2` varchar(45) DEFAULT '',
  `telefono` varchar(45) DEFAULT '',
  `email` varchar(45) DEFAULT '',
  `direccion` varchar(150) DEFAULT '',
  `cod_postal` varchar(10) DEFAULT '',
  PRIMARY KEY (`ref_username`),
  KEY `ref_username` (`ref_username`),
  CONSTRAINT `user_data_ibfk_1` FOREIGN KEY (`ref_username`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla dnr_proyecto_daw.user_data: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `user_data` DISABLE KEYS */;
INSERT INTO `user_data` (`ref_username`, `nombre`, `apellido1`, `apellido2`, `telefono`, `email`, `direccion`, `cod_postal`) VALUES
	('admin', 'Administrador', 'Administrador', 'Administrador', '12346789', 'admin@sivsa.com', 'Admin dir', '13580'),
	('diego', 'Diego', 'Noal', 'Rodríguez', '630066382', 'diego@sivsa.com', 'Diego dir', '15948'),
	('master', 'Master', 'Master', 'Master', '987654321', 'master@sivsa.com', 'Master dir', '17594'),
	('prueba', 'Prueba', 'Prueba', 'Prueba', '987777777', 'prueba@sivsa.com', 'Prueba dir', '18300'),
	('test', 'Test', 'Test', 'Test', '987456123', 'test@sivsa.com', 'Test dir', '25790');
/*!40000 ALTER TABLE `user_data` ENABLE KEYS */;

-- Volcando estructura para tabla dnr_proyecto_daw.user_projects
DROP TABLE IF EXISTS `user_projects`;
CREATE TABLE IF NOT EXISTS `user_projects` (
  `id_usuario_proyecto` int(11) NOT NULL AUTO_INCREMENT,
  `ref_id_proyecto` int(11) NOT NULL,
  `ref_nom_proyecto` varchar(60) NOT NULL,
  `ref_username` varchar(45) NOT NULL,
  PRIMARY KEY (`id_usuario_proyecto`),
  UNIQUE KEY `uni_user_projects` (`ref_id_proyecto`,`ref_username`),
  KEY `ref_nom_proyecto` (`ref_nom_proyecto`),
  KEY `ref_username` (`ref_username`),
  CONSTRAINT `user_projects_ibfk_1` FOREIGN KEY (`ref_id_proyecto`) REFERENCES `projects` (`id_proyecto`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_projects_ibfk_2` FOREIGN KEY (`ref_nom_proyecto`) REFERENCES `projects` (`nom_proyecto`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_projects_ibfk_3` FOREIGN KEY (`ref_username`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla dnr_proyecto_daw.user_projects: ~11 rows (aproximadamente)
/*!40000 ALTER TABLE `user_projects` DISABLE KEYS */;
INSERT INTO `user_projects` (`id_usuario_proyecto`, `ref_id_proyecto`, `ref_nom_proyecto`, `ref_username`) VALUES
	(1, 1, 'SIVSA 2018', 'master'),
	(2, 1, 'SIVSA 2018', 'admin'),
	(3, 1, 'SIVSA 2018', 'diego'),
	(4, 1, 'SIVSA 2018', 'prueba'),
	(5, 1, 'SIVSA 2018', 'test'),
	(6, 2, 'XUNTA DE GALICIA', 'admin'),
	(7, 2, 'XUNTA DE GALICIA', 'diego'),
	(8, 3, 'PROYECTO DAW', 'admin'),
	(9, 3, 'PROYECTO DAW', 'diego'),
	(10, 4, 'PRUEBA', 'admin'),
	(11, 4, 'PRUEBA', 'diego');
/*!40000 ALTER TABLE `user_projects` ENABLE KEYS */;

-- Volcando estructura para tabla dnr_proyecto_daw.user_roles
DROP TABLE IF EXISTS `user_roles`;
CREATE TABLE IF NOT EXISTS `user_roles` (
  `user_role_id` int(11) NOT NULL AUTO_INCREMENT,
  `ref_iduser` int(11) NOT NULL,
  `role` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`user_role_id`),
  KEY `ref_iduser` (`ref_iduser`),
  KEY `role` (`role`),
  CONSTRAINT `user_roles_ibfk_1` FOREIGN KEY (`ref_iduser`) REFERENCES `users` (`iduser`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla dnr_proyecto_daw.user_roles: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
INSERT INTO `user_roles` (`user_role_id`, `ref_iduser`, `role`) VALUES
	(1, 1, 'ROLE_MASTER'),
	(2, 2, 'ROLE_ADMIN'),
	(3, 3, 'ROLE_USER'),
	(4, 4, 'ROLE_USER'),
	(5, 5, 'ROLE_USER');
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;

-- Volcando estructura para tabla dnr_proyecto_daw.user_starts
DROP TABLE IF EXISTS `user_starts`;
CREATE TABLE IF NOT EXISTS `user_starts` (
  `ref_username` varchar(45) NOT NULL,
  `fecha_alta` date NOT NULL,
  PRIMARY KEY (`ref_username`),
  KEY `ref_username` (`ref_username`),
  CONSTRAINT `user_starts_ibfk_1` FOREIGN KEY (`ref_username`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla dnr_proyecto_daw.user_starts: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `user_starts` DISABLE KEYS */;
INSERT INTO `user_starts` (`ref_username`, `fecha_alta`) VALUES
	('admin', '2017-11-27'),
	('diego', '2017-10-01'),
	('master', '2017-11-27'),
	('prueba', '2017-10-01'),
	('test', '2017-10-01');
/*!40000 ALTER TABLE `user_starts` ENABLE KEYS */;

-- Volcando estructura para disparador dnr_proyecto_daw.trig_crear_alta_usuario
DROP TRIGGER IF EXISTS `trig_crear_alta_usuario`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `trig_crear_alta_usuario` AFTER INSERT ON `users` FOR EACH ROW INSERT INTO `user_starts` (`ref_username`, `fecha_alta`) VALUES
	(NEW.username, CURDATE())//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Volcando estructura para disparador dnr_proyecto_daw.trig_crear_datos_usuario
DROP TRIGGER IF EXISTS `trig_crear_datos_usuario`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';
DELIMITER //
CREATE TRIGGER `trig_crear_datos_usuario` AFTER INSERT ON `users` FOR EACH ROW INSERT INTO `user_data` (`ref_username`, `nombre`, `apellido1`, `apellido2`, `telefono`, `email`, `direccion`, `cod_postal`) VALUES
	(NEW.username, '', '', '', '', CONCAT(NEW.username, '@sivsa.com'), '', '')//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
