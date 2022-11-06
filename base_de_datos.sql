-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         8.0.29 - MySQL Community Server - GPL
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.0.0.6468
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Volcando estructura de base de datos para ori
CREATE DATABASE IF NOT EXISTS `ori2` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `ori2`;


-- Volcando estructura para tabla ori.periodicidad
CREATE TABLE IF NOT EXISTS `periodicidad` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `tipo_periodicidad` varchar(40) NOT NULL,
  `periodosanuales` int NOT NULL,
  `fecha_creacion` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla ori.periodicidad: ~0 rows (aproximadamente)
DELETE FROM `periodicidad`;
INSERT INTO `periodicidad` (`id`, `tipo_periodicidad`, `periodosanuales`, `fecha_creacion`) VALUES
	(1, 'mensual', 12, NULL);





-- Volcando estructura para tabla ori.partnership_agreement
CREATE TABLE IF NOT EXISTS `partnership_agreement` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `estado` varchar(40) NOT NULL,
  `fecha_creacion` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla ori.partnership_agreement: ~0 rows (aproximadamente)
DELETE FROM `partnership_agreement`;




-- Volcando estructura para tabla ori.institucion
CREATE TABLE IF NOT EXISTS `institucion` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombreinstitucion` varchar(200) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `pais` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla ori.institucion: ~2 rows (aproximadamente)
DELETE FROM `institucion`;
INSERT INTO `institucion` (`id`, `nombreinstitucion`, `email`, `pais`) VALUES
	(1, 'UGR', 'ugr@correo.ugr.es', 'spain'),
	(2, 'Guadix', NULL, NULL);



-- Volcando estructura para tabla ori.proyecto
CREATE TABLE IF NOT EXISTS `proyecto` (
  `proyecto_id` int NOT NULL AUTO_INCREMENT,
  `nombreproyecto` varchar(200) NOT NULL,
  `sigla` varchar(10) DEFAULT NULL,
  `id_referencia` int DEFAULT NULL,
  `web` varchar(100) DEFAULT NULL,
  `notas` varchar(500) DEFAULT NULL,
  `fecha_creacion` date DEFAULT NULL,
  `coordina_institucion_id` bigint NOT NULL,
  `partnership_agreement_id` bigint DEFAULT NULL,
  `periodicidad_id` bigint NOT NULL,
  `fecha_fin` date NOT NULL,
  `fecha_inicio` date NOT NULL,
  PRIMARY KEY (`proyecto_id`),
  KEY `proyecto_coordina_institucion_id_73189548_fk_Institucion_id` (`coordina_institucion_id`),
  KEY `proyecto_partnership_agreemen_f7e406aa_fk_partnersh` (`partnership_agreement_id`),
  KEY `proyecto_periodicidad_id_7b846f2c_fk_Periodicidad_id` (`periodicidad_id`),
  CONSTRAINT `proyecto_coordina_institucion_id_73189548_fk_Institucion_id` FOREIGN KEY (`coordina_institucion_id`) REFERENCES `institucion` (`id`),
  CONSTRAINT `proyecto_partnership_agreemen_f7e406aa_fk_partnersh` FOREIGN KEY (`partnership_agreement_id`) REFERENCES `partnership_agreement` (`id`),
  CONSTRAINT `proyecto_periodicidad_id_7b846f2c_fk_Periodicidad_id` FOREIGN KEY (`periodicidad_id`) REFERENCES `periodicidad` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla ori.proyecto: ~3 rows (aproximadamente)
DELETE FROM `proyecto`;
INSERT INTO `proyecto` (`proyecto_id`, `nombreproyecto`, `sigla`, `id_referencia`, `web`, `notas`, `fecha_creacion`, `coordina_institucion_id`, `partnership_agreement_id`, `periodicidad_id`, `fecha_fin`, `fecha_inicio`) VALUES
	(1, 'Guadix power', NULL, NULL, NULL, NULL, '2022-10-18', 1, NULL, 1, '2022-10-26', '2022-10-26'),
	(2, 'Proyecto2', NULL, NULL, NULL, NULL, '2022-10-18', 2, NULL, 1, '2022-10-26', '2022-10-26'),
	(3, 'UGRSOLO', NULL, NULL, NULL, NULL, '2022-10-18', 1, NULL, 1, '2022-10-26', '2022-10-26');



-- Volcando estructura para tabla ori.convocatoria
CREATE TABLE IF NOT EXISTS `convocatoria` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombreconvocatoria` varchar(200) NOT NULL,
  `tiempo` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla ori.convocatoria: ~0 rows (aproximadamente)
DELETE FROM `convocatoria`;



-- Volcando estructura para tabla ori.programa
CREATE TABLE IF NOT EXISTS `programa` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombreprograma` varchar(200) NOT NULL,
  `fecha_creacion` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla ori.programa: ~0 rows (aproximadamente)
DELETE FROM `programa`;







-- Volcando estructura para tabla ori.subprograma
CREATE TABLE IF NOT EXISTS `subprograma` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombresubprograma` varchar(200) NOT NULL,
  `fecha_creacion` date DEFAULT NULL,
  `programa_id` bigint NOT NULL,
  
  `hijosubprograma_id` bigint DEFAULT NULL,
  `hijoprograma_id` bigint DEFAULT NULL,

  PRIMARY KEY (`id`),
  UNIQUE KEY `subprograma_id_programa_id_4942df86_uniq` (`id`,`programa_id`),
  KEY `subprograma_programa_id_b9358eac_fk_programa_id` (`programa_id`),
  CONSTRAINT `subprograma_programa_id_b9358eac_fk_programa_id` FOREIGN KEY (`programa_id`) REFERENCES `programa` (`id`),
  CONSTRAINT `hijosubprograma_id` FOREIGN KEY (`hijosubprograma_id`) REFERENCES `subprograma` (`id`),
  CONSTRAINT `hijoprograma_id` FOREIGN KEY (`hijoprograma_id`) REFERENCES `programa` (`id`)

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla ori.subprograma: ~0 rows (aproximadamente)
DELETE FROM `subprograma`;














-- Volcando estructura para tabla ori.file
CREATE TABLE IF NOT EXISTS `file` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `file` varchar(100) NOT NULL,
  `file_proyecto_id_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `file_file_proyecto_id_id_3b6dcb69_fk_proyecto_proyecto_id` (`file_proyecto_id_id`),
  CONSTRAINT `file_file_proyecto_id_id_3b6dcb69_fk_proyecto_proyecto_id` FOREIGN KEY (`file_proyecto_id_id`) REFERENCES `proyecto` (`proyecto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla ori.file: ~0 rows (aproximadamente)
DELETE FROM `file`;
INSERT INTO `file` (`id`, `file`, `file_proyecto_id_id`) VALUES
	(1, 'archivos/Ángel_ORLA.png', 1);











-- Volcando estructura para tabla ori.presupuesto
CREATE TABLE IF NOT EXISTS `presupuesto` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `organismo_financiador` varchar(100) DEFAULT NULL,
  `total` varchar(100) DEFAULT NULL,
  `presentacion` date DEFAULT NULL,
  `proyecto_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `proyecto_id` (`proyecto_id`),
  CONSTRAINT `presupuesto_proyecto_id_d028efe2_fk_proyecto_proyecto_id` FOREIGN KEY (`proyecto_id`) REFERENCES `proyecto` (`proyecto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla ori.presupuesto: ~0 rows (aproximadamente)
DELETE FROM `presupuesto`;









-- Volcando estructura para tabla ori.departamento
CREATE TABLE IF NOT EXISTS `departamento` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombredepartamento` varchar(200) NOT NULL,
  `correo` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla ori.departamento: ~0 rows (aproximadamente)
DELETE FROM `departamento`;







-- Volcando estructura para tabla ori.participante
CREATE TABLE IF NOT EXISTS `participante` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `username` varchar(200) NOT NULL,
  `vinculacion` varchar(200) DEFAULT NULL,
  `email` varchar(200) NOT NULL,
  `notas` varchar(200) DEFAULT NULL,
  `departamento_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `Participante_departamento_id_19423693_fk_Departamento_id` (`departamento_id`),
  CONSTRAINT `Participante_departamento_id_19423693_fk_Departamento_id` FOREIGN KEY (`departamento_id`) REFERENCES `departamento` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla ori.participante: ~1 rows (aproximadamente)
DELETE FROM `participante`;
INSERT INTO `participante` (`id`, `password`, `last_login`, `is_superuser`, `first_name`, `last_name`, `is_staff`, `is_active`, `date_joined`, `username`, `vinculacion`, `email`, `notas`, `departamento_id`) VALUES
	(10, 'pbkdf2_sha256$260000$Vaio03S0I7W2eAl3Swpdkd$0t4UXOabBzFH5Gl2shR4+uWgAjfKIsQE0jh1y6678FY=', '2022-10-18 14:07:57.750800', 1, '', '', 1, 1, '2022-10-18 14:07:49.824197', 'argelion14', NULL, 'argelion14@gmail.com', NULL, NULL),
	(11, 'pbkdf2_sha256$260000$H6mPVPFxgMhBzvo0RRiopz$kQrvl1rVJEF8SKvpNV9zjAyrNfvKukQLxXGwQueENSA=', NULL, 0, '', '', 1, 1, '2022-10-18 14:29:27.401486', 'prueba1', NULL, 'prueba1@correo.ugr.es', NULL, NULL);









-- Volcando estructura para tabla ori.rol
CREATE TABLE IF NOT EXISTS `rol` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `rolename` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla ori.rol: ~0 rows (aproximadamente)
DELETE FROM `rol`;





-- Volcando estructura para tabla ori.periodo
CREATE TABLE IF NOT EXISTS `periodo` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `tiempo` varchar(200) NOT NULL,
  `proyecto_id` int NOT NULL,
  PRIMARY KEY (`id`,`proyecto_id`),
  FOREIGN KEY (`proyecto_id`) REFERENCES `proyecto` (`proyecto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla ori.periodo: ~0 rows (aproximadamente)
DELETE FROM `periodo`;








-- Volcando estructura para tabla ori.timesheet
CREATE TABLE IF NOT EXISTS `timesheet` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `tipo` varchar(200) DEFAULT NULL,
  `periodo_id` bigint DEFAULT NULL,
  `rol_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Timesheet_periodo_id_76b35854_fk_Periodo_id` (`periodo_id`),
  KEY `Timesheet_rol_id_54ee1707_fk_Rol_id` (`rol_id`),
  CONSTRAINT `Timesheet_periodo_id_76b35854_fk_Periodo_id` FOREIGN KEY (`periodo_id`) REFERENCES `periodo` (`id`),
  CONSTRAINT `Timesheet_rol_id_54ee1707_fk_Rol_id` FOREIGN KEY (`rol_id`) REFERENCES `rol` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla ori.timesheet: ~0 rows (aproximadamente)
DELETE FROM `timesheet`;









-- ______________________________________________ --
















-- Volcando estructura para tabla ori.convocatoria_convocatorias_subprogramas
CREATE TABLE IF NOT EXISTS `convocatoria_convocatorias_subprogramas` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `convocatoria_id` bigint NOT NULL,
  `subprograma_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `convocatoria_convocatori_convocatoria_id_subprogr_f260c83d_uniq` (`convocatoria_id`,`subprograma_id`),
  KEY `convocatoria_convoca_subprograma_id_9e0519bc_fk_subprogra` (`subprograma_id`),
  CONSTRAINT `convocatoria_convoca_convocatoria_id_9589a30d_fk_convocato` FOREIGN KEY (`convocatoria_id`) REFERENCES `convocatoria` (`id`),
  CONSTRAINT `convocatoria_convoca_subprograma_id_9e0519bc_fk_subprogra` FOREIGN KEY (`subprograma_id`) REFERENCES `subprograma` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla ori.convocatoria_convocatorias_subprogramas: ~0 rows (aproximadamente)
DELETE FROM `convocatoria_convocatorias_subprogramas`;




















-- Volcando estructura para tabla ori.participante_proyectos
CREATE TABLE IF NOT EXISTS `participante_proyectos` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `participante_id` bigint NOT NULL,
  `proyecto_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Participante_proyectos_participante_id_proyecto_id_5ca2e679_uniq` (`participante_id`,`proyecto_id`),
  KEY `Participante_proyect_proyecto_id_d61141be_fk_proyecto_` (`proyecto_id`),
  CONSTRAINT `Participante_proyect_participante_id_8718dafb_fk_Participa` FOREIGN KEY (`participante_id`) REFERENCES `participante` (`id`),
  CONSTRAINT `Participante_proyect_proyecto_id_d61141be_fk_proyecto_` FOREIGN KEY (`proyecto_id`) REFERENCES `proyecto` (`proyecto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla ori.participante_proyectos: ~0 rows (aproximadamente)
DELETE FROM `participante_proyectos`;
INSERT INTO `participante_proyectos` (`id`, `participante_id`, `proyecto_id`) VALUES
	(2, 10, 1);













-- Volcando estructura para tabla ori.proyecto_participa_institucion
CREATE TABLE IF NOT EXISTS `proyecto_participa_institucion` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `proyecto_id` int NOT NULL,
  `institucion_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `proyecto_participa_insti_proyecto_id_institucion__18bb65e8_uniq` (`proyecto_id`,`institucion_id`),
  KEY `proyecto_participa_i_institucion_id_b7a84cb0_fk_Instituci` (`institucion_id`),
  CONSTRAINT `proyecto_participa_i_institucion_id_b7a84cb0_fk_Instituci` FOREIGN KEY (`institucion_id`) REFERENCES `institucion` (`id`),
  CONSTRAINT `proyecto_participa_i_proyecto_id_4c1f228d_fk_proyecto_` FOREIGN KEY (`proyecto_id`) REFERENCES `proyecto` (`proyecto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla ori.proyecto_participa_institucion: ~2 rows (aproximadamente)
DELETE FROM `proyecto_participa_institucion`;
INSERT INTO `proyecto_participa_institucion` (`id`, `proyecto_id`, `institucion_id`) VALUES
	(4, 1, 1),
	(2, 2, 1),
	(3, 3, 1);





CREATE TABLE IF NOT EXISTS `posee` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `participante_id` bigint NOT NULL,
  `proyecto_id` int NOT NULL,
  `timesheet_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY (`participante_id`,`proyecto_id`,`timesheet_id`),
  FOREIGN KEY (`participante_id`, `proyecto_id`) REFERENCES `participante_proyectos` (`participante_id`, `proyecto_id`),
  FOREIGN KEY (`timesheet_id`) REFERENCES `timesheet` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;




CREATE TABLE IF NOT EXISTS `sepresenta` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `convocatoria_id` bigint NOT NULL,
  `subprograma_id` bigint NOT NULL,
  `proyecto_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY (`convocatoria_id`,`subprograma_id`,`proyecto_id`),
  FOREIGN KEY (`convocatoria_id`, `subprograma_id`) REFERENCES `convocatoria_convocatorias_subprogramas` (`convocatoria_id`, `subprograma_id`),
  FOREIGN KEY (`proyecto_id`) REFERENCES `proyecto` (`proyecto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

