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
CREATE DATABASE IF NOT EXISTS `ori` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `ori`;

-- Volcando estructura para tabla ori.periodicidad
CREATE TABLE IF NOT EXISTS `periodicidad` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `tipo_periodicidad` varchar(40) NOT NULL,
  `periodosanuales` int NOT NULL,
  `fecha_creacion` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla ori.periodicidad: ~0 rows (aproximadamente)
DELETE FROM `periodicidad`;

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
  `fecha_creacion` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla ori.institucion: ~0 rows (aproximadamente)
DELETE FROM `institucion`;

-- Volcando estructura para tabla ori.proyecto
CREATE TABLE IF NOT EXISTS `proyecto` (
  `proyecto_id` int NOT NULL AUTO_INCREMENT,
  `nombreproyecto` varchar(200) NOT NULL,
  `sigla` varchar(10) DEFAULT NULL,
  `id_referencia` int DEFAULT NULL,
  `web` varchar(100) DEFAULT NULL,
  `notas` varchar(500) DEFAULT NULL,
  `fecha_fin` date NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_creacion` date DEFAULT NULL,
  `coordina_institucion_id` bigint NOT NULL,
  `partnership_agreement_id` bigint DEFAULT NULL,
  `periodicidad_id` bigint NOT NULL,
  PRIMARY KEY (`proyecto_id`),
  KEY `proyecto_coordina_institucion_id_73189548_fk_institucion_id` (`coordina_institucion_id`),
  KEY `proyecto_partnership_agreemen_f7e406aa_fk_partnersh` (`partnership_agreement_id`),
  KEY `proyecto_periodicidad_id_7b846f2c_fk_periodicidad_id` (`periodicidad_id`),
  CONSTRAINT `proyecto_coordina_institucion_id_73189548_fk_institucion_id` FOREIGN KEY (`coordina_institucion_id`) REFERENCES `institucion` (`id`),
  CONSTRAINT `proyecto_partnership_agreemen_f7e406aa_fk_partnersh` FOREIGN KEY (`partnership_agreement_id`) REFERENCES `partnership_agreement` (`id`),
  CONSTRAINT `proyecto_periodicidad_id_7b846f2c_fk_periodicidad_id` FOREIGN KEY (`periodicidad_id`) REFERENCES `periodicidad` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla ori.proyecto: ~0 rows (aproximadamente)
DELETE FROM `proyecto`;

-- Volcando estructura para tabla ori.file
CREATE TABLE IF NOT EXISTS `file` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `file` varchar(100) NOT NULL,
  `file_proyecto_id_id` int NOT NULL,
  `fecha_creacion` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `file_file_proyecto_id_id_3b6dcb69_uniq` (`file_proyecto_id_id`),
  CONSTRAINT `file_file_proyecto_id_id_3b6dcb69_fk_proyecto_proyecto_id` FOREIGN KEY (`file_proyecto_id_id`) REFERENCES `proyecto` (`proyecto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla ori.file: ~0 rows (aproximadamente)
DELETE FROM `file`;

-- Volcando estructura para tabla .presupuesto
CREATE TABLE IF NOT EXISTS `presupuesto` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `organismo_financiador` varchar(100) NOT NULL,
  `total` varchar(100) NOT NULL,
  `presentacion` date DEFAULT NULL,
  `proyecto_id` int NOT NULL,
  `fecha_creacion` date DEFAULT NULL,
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
  `fecha_creacion` date DEFAULT NULL,
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
  `fecha_creacion` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `participante_departamento_id_a1f62ac5_fk_departamento_id` (`departamento_id`),
  CONSTRAINT `participante_departamento_id_a1f62ac5_fk_departamento_id` FOREIGN KEY (`departamento_id`) REFERENCES `departamento` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla ori.participante: ~0 rows (aproximadamente)
DELETE FROM `participante`;

-- Volcando estructura para tabla ori.rol
CREATE TABLE IF NOT EXISTS `rol` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `rolename` varchar(200) NOT NULL,
  `fecha_creacion` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla ori.rol: ~0 rows (aproximadamente)
DELETE FROM `rol`;

-- Volcando estructura para tabla ori.periodo
CREATE TABLE IF NOT EXISTS `periodo` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `proyecto_id` int NOT NULL,
  `num_periodo` int NOT NULL,
  `fecha_creacion` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `periodo_id_proyecto_id_165d2c8a_uniq` (`id`,`proyecto_id`),
  KEY `periodo_proyecto_id_c4f2da88_fk_proyecto_proyecto_id` (`proyecto_id`),
  CONSTRAINT `periodo_proyecto_id_c4f2da88_fk_proyecto_proyecto_id` FOREIGN KEY (`proyecto_id`) REFERENCES `proyecto` (`proyecto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla ori.periodo: ~0 rows (aproximadamente)
DELETE FROM `periodo`;

-- Volcando estructura para tabla ori.timesheet
CREATE TABLE IF NOT EXISTS `timesheet` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `tipo` varchar(200) NOT NULL,
  `periodo_id` bigint NOT NULL,
  `rol_id` bigint NOT NULL,
  `intellectual_output` varchar(200) DEFAULT NULL,
  `num_working_days` int DEFAULT NULL,
  `fecha_creacion` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `timesheet_rol_id_periodo_id_c675d66a_uniq` (`rol_id`,`periodo_id`),
  KEY `timesheet_periodo_id_20e804b5_fk_periodo_id` (`periodo_id`),
  CONSTRAINT `timesheet_periodo_id_20e804b5_fk_periodo_id` FOREIGN KEY (`periodo_id`) REFERENCES `periodo` (`id`),
  CONSTRAINT `timesheet_rol_id_f3ede523_fk_rol_id` FOREIGN KEY (`rol_id`) REFERENCES `rol` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla ori.timesheet: ~0 rows (aproximadamente)
DELETE FROM `timesheet`;

-- Volcando estructura para tabla ori.tarea
CREATE TABLE IF NOT EXISTS `tarea` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombretarea` varchar(200) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `fecha_creacion` date DEFAULT NULL,
  `timesheet_id` bigint NOT NULL,
  `dia` date NOT NULL,
  `lugar` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tarea_timesheet_id_d7869490_fk_timesheet_id` (`timesheet_id`),
  CONSTRAINT `tarea_timesheet_id_d7869490_fk_timesheet_id` FOREIGN KEY (`timesheet_id`) REFERENCES `timesheet` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla ori.tarea: ~0 rows (aproximadamente)
DELETE FROM `tarea`;

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
  `padreprograma_id` bigint DEFAULT NULL,
  `padresubprograma_id` bigint DEFAULT NULL,
  `programa_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `subprograma_id_programa_id_4942df86_uniq` (`id`,`programa_id`),
  UNIQUE KEY `subprograma_nombresubprograma_81d7d7cc_uniq` (`nombresubprograma`),
  KEY `subprograma_programa_id_b9358eac_fk_programa_id` (`programa_id`),
  KEY `subprograma_padreprograma_id_fae5c9a4_fk_programa_id` (`padreprograma_id`),
  KEY `subprograma_padresubprograma_id_e595799d_fk_subprograma_id` (`padresubprograma_id`),
  CONSTRAINT `subprograma_padreprograma_id_fae5c9a4_fk_programa_id` FOREIGN KEY (`padreprograma_id`) REFERENCES `programa` (`id`),
  CONSTRAINT `subprograma_padresubprograma_id_e595799d_fk_subprograma_id` FOREIGN KEY (`padresubprograma_id`) REFERENCES `subprograma` (`id`),
  CONSTRAINT `subprograma_programa_id_b9358eac_fk_programa_id` FOREIGN KEY (`programa_id`) REFERENCES `programa` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla ori.subprograma: ~0 rows (aproximadamente)
DELETE FROM `subprograma`;

-- Volcando estructura para tabla ori.convocatoria
CREATE TABLE IF NOT EXISTS `convocatoria` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `fecha_creacion` date DEFAULT NULL,
  `anio` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla ori.convocatoria: ~0 rows (aproximadamente)
DELETE FROM `convocatoria`;

-- Volcando estructura para tabla ori.convocatoria_convocatorias_subprogramas
CREATE TABLE IF NOT EXISTS `convocatoria_convocatorias_subprogramas` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `convocatoria_id` bigint NOT NULL,
  `subprograma_id` bigint NOT NULL,
  `fecha_creacion` date DEFAULT NULL,
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
  `fecha_creacion` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `participante_proyectos_participante_id_proyecto_id_b1fabb42_uniq` (`participante_id`,`proyecto_id`),
  KEY `participante_proyect_proyecto_id_a8f361b6_fk_proyecto_` (`proyecto_id`),
  CONSTRAINT `participante_proyect_participante_id_e9dc32ba_fk_participa` FOREIGN KEY (`participante_id`) REFERENCES `participante` (`id`),
  CONSTRAINT `participante_proyect_proyecto_id_a8f361b6_fk_proyecto_` FOREIGN KEY (`proyecto_id`) REFERENCES `proyecto` (`proyecto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla ori.participante_proyectos: ~0 rows (aproximadamente)
DELETE FROM `participante_proyectos`;

-- Volcando estructura para tabla ori.proyecto_participa_institucion
CREATE TABLE IF NOT EXISTS `proyecto_participa_institucion` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `institucion_id` bigint NOT NULL,
  `proyecto_id` int NOT NULL,
  `fecha_creacion` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `proyecto_participa_insti_proyecto_id_institucion__18bb65e8_uniq` (`proyecto_id`,`institucion_id`),
  KEY `proyecto_participa_i_institucion_id_b7a84cb0_fk_instituci` (`institucion_id`),
  CONSTRAINT `proyecto_participa_i_institucion_id_b7a84cb0_fk_instituci` FOREIGN KEY (`institucion_id`) REFERENCES `institucion` (`id`),
  CONSTRAINT `proyecto_participa_i_proyecto_id_4c1f228d_fk_proyecto_` FOREIGN KEY (`proyecto_id`) REFERENCES `proyecto` (`proyecto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla ori.proyecto_participa_institucion: ~0 rows (aproximadamente)
DELETE FROM `proyecto_participa_institucion`;

-- Volcando estructura para tabla ori.posee
CREATE TABLE IF NOT EXISTS `posee` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `participanteproyectos_id` bigint NOT NULL,
  `timesheet_id` bigint NOT NULL,
  `fecha_creacion` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `posee_participanteproyectos_id_timesheet_id_fe42da2a_uniq` (`participanteproyectos_id`,`timesheet_id`),
  UNIQUE KEY `posee_timesheet_id_d150c86d_uniq` (`timesheet_id`),
  CONSTRAINT `posee_participanteproyecto_16b8cfbf_fk_participa` FOREIGN KEY (`participanteproyectos_id`) REFERENCES `participante_proyectos` (`id`),
  CONSTRAINT `posee_timesheet_id_d150c86d_fk_timesheet_id` FOREIGN KEY (`timesheet_id`) REFERENCES `timesheet` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla ori.posee: ~0 rows (aproximadamente)
DELETE FROM `posee`;

-- Volcando estructura para tabla ori.sepresenta
CREATE TABLE IF NOT EXISTS `sepresenta` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `convocatoriasubprogramas_id` bigint NOT NULL,
  `proyecto_id` int NOT NULL,
  `fecha_creacion` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sepresenta_convocatoriasubprogramas_id_proyecto_id_138dd7d3_uniq` (`convocatoriasubprogramas_id`,`proyecto_id`),
  UNIQUE KEY `sepresenta_proyecto_id_acff89f9_uniq` (`proyecto_id`),
  CONSTRAINT `sepresenta_convocatoriasubprogr_1133e9b9_fk_convocato` FOREIGN KEY (`convocatoriasubprogramas_id`) REFERENCES `convocatoria_convocatorias_subprogramas` (`id`),
  CONSTRAINT `sepresenta_proyecto_id_acff89f9_fk_proyecto_proyecto_id` FOREIGN KEY (`proyecto_id`) REFERENCES `proyecto` (`proyecto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla ori.sepresenta: ~0 rows (aproximadamente)
DELETE FROM `sepresenta`;


/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
