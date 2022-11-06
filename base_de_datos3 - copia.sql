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



/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

