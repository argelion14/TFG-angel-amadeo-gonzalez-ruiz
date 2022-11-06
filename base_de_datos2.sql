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

-- Volcando estructura para tabla ori.auth_group
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla ori.auth_group: ~0 rows (aproximadamente)
DELETE FROM `auth_group`;

-- Volcando estructura para tabla ori.auth_group_permissions
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla ori.auth_group_permissions: ~0 rows (aproximadamente)
DELETE FROM `auth_group_permissions`;

-- Volcando estructura para tabla ori.auth_permission
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla ori.auth_permission: ~60 rows (aproximadamente)
DELETE FROM `auth_permission`;
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
	(1, 'Can add log entry', 1, 'add_logentry'),
	(2, 'Can change log entry', 1, 'change_logentry'),
	(3, 'Can delete log entry', 1, 'delete_logentry'),
	(4, 'Can view log entry', 1, 'view_logentry'),
	(5, 'Can add permission', 2, 'add_permission'),
	(6, 'Can change permission', 2, 'change_permission'),
	(7, 'Can delete permission', 2, 'delete_permission'),
	(8, 'Can view permission', 2, 'view_permission'),
	(9, 'Can add group', 3, 'add_group'),
	(10, 'Can change group', 3, 'change_group'),
	(11, 'Can delete group', 3, 'delete_group'),
	(12, 'Can view group', 3, 'view_group'),
	(13, 'Can add content type', 4, 'add_contenttype'),
	(14, 'Can change content type', 4, 'change_contenttype'),
	(15, 'Can delete content type', 4, 'delete_contenttype'),
	(16, 'Can view content type', 4, 'view_contenttype'),
	(17, 'Can add session', 5, 'add_session'),
	(18, 'Can change session', 5, 'change_session'),
	(19, 'Can delete session', 5, 'delete_session'),
	(20, 'Can view session', 5, 'view_session'),
	(21, 'Can add departamento', 6, 'add_departamento'),
	(22, 'Can change departamento', 6, 'change_departamento'),
	(23, 'Can delete departamento', 6, 'delete_departamento'),
	(24, 'Can view departamento', 6, 'view_departamento'),
	(25, 'Can add institucion', 7, 'add_institucion'),
	(26, 'Can change institucion', 7, 'change_institucion'),
	(27, 'Can delete institucion', 7, 'delete_institucion'),
	(28, 'Can view institucion', 7, 'view_institucion'),
	(29, 'Can add partnership agreement', 8, 'add_partnershipagreement'),
	(30, 'Can change partnership agreement', 8, 'change_partnershipagreement'),
	(31, 'Can delete partnership agreement', 8, 'delete_partnershipagreement'),
	(32, 'Can view partnership agreement', 8, 'view_partnershipagreement'),
	(33, 'Can add programa', 9, 'add_programa'),
	(34, 'Can change programa', 9, 'change_programa'),
	(35, 'Can delete programa', 9, 'delete_programa'),
	(36, 'Can view programa', 9, 'view_programa'),
	(37, 'Can add tipo gestion tiempo', 10, 'add_tipogestiontiempo'),
	(38, 'Can change tipo gestion tiempo', 10, 'change_tipogestiontiempo'),
	(39, 'Can delete tipo gestion tiempo', 10, 'delete_tipogestiontiempo'),
	(40, 'Can view tipo gestion tiempo', 10, 'view_tipogestiontiempo'),
	(41, 'Can add subprograma', 11, 'add_subprograma'),
	(42, 'Can change subprograma', 11, 'change_subprograma'),
	(43, 'Can delete subprograma', 11, 'delete_subprograma'),
	(44, 'Can view subprograma', 11, 'view_subprograma'),
	(45, 'Can add proyecto', 12, 'add_proyecto'),
	(46, 'Can change proyecto', 12, 'change_proyecto'),
	(47, 'Can delete proyecto', 12, 'delete_proyecto'),
	(48, 'Can view proyecto', 12, 'view_proyecto'),
	(49, 'Can add presupuesto', 13, 'add_presupuesto'),
	(50, 'Can change presupuesto', 13, 'change_presupuesto'),
	(51, 'Can delete presupuesto', 13, 'delete_presupuesto'),
	(52, 'Can view presupuesto', 13, 'view_presupuesto'),
	(53, 'Can add file', 14, 'add_file'),
	(54, 'Can change file', 14, 'change_file'),
	(55, 'Can delete file', 14, 'delete_file'),
	(56, 'Can view file', 14, 'view_file'),
	(57, 'Can add participante', 15, 'add_participante'),
	(58, 'Can change participante', 15, 'change_participante'),
	(59, 'Can delete participante', 15, 'delete_participante'),
	(60, 'Can view participante', 15, 'view_participante');

-- Volcando estructura para tabla ori.departamento
CREATE TABLE IF NOT EXISTS `departamento` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombredepartamento` varchar(200) DEFAULT NULL,
  `correo` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla ori.departamento: ~0 rows (aproximadamente)
DELETE FROM `departamento`;
INSERT INTO `departamento` (`id`, `nombredepartamento`, `correo`) VALUES
	(1, 'Departamento de Ciencias de la computación', NULL);

-- Volcando estructura para tabla ori.django_admin_log
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_Participante_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_Participante_id` FOREIGN KEY (`user_id`) REFERENCES `participante` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla ori.django_admin_log: ~0 rows (aproximadamente)
DELETE FROM `django_admin_log`;

-- Volcando estructura para tabla ori.django_content_type
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla ori.django_content_type: ~15 rows (aproximadamente)
DELETE FROM `django_content_type`;
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
	(1, 'admin', 'logentry'),
	(3, 'auth', 'group'),
	(2, 'auth', 'permission'),
	(4, 'contenttypes', 'contenttype'),
	(6, 'ori', 'departamento'),
	(14, 'ori', 'file'),
	(7, 'ori', 'institucion'),
	(15, 'ori', 'participante'),
	(8, 'ori', 'partnershipagreement'),
	(13, 'ori', 'presupuesto'),
	(9, 'ori', 'programa'),
	(12, 'ori', 'proyecto'),
	(11, 'ori', 'subprograma'),
	(10, 'ori', 'tipogestiontiempo'),
	(5, 'sessions', 'session');

-- Volcando estructura para tabla ori.django_migrations
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla ori.django_migrations: ~19 rows (aproximadamente)
DELETE FROM `django_migrations`;
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
	(1, 'contenttypes', '0001_initial', '2022-10-03 16:15:26.080666'),
	(2, 'contenttypes', '0002_remove_content_type_name', '2022-10-03 16:15:26.197665'),
	(3, 'auth', '0001_initial', '2022-10-03 16:15:26.466165'),
	(4, 'auth', '0002_alter_permission_name_max_length', '2022-10-03 16:15:26.524165'),
	(5, 'auth', '0003_alter_user_email_max_length', '2022-10-03 16:15:26.532165'),
	(6, 'auth', '0004_alter_user_username_opts', '2022-10-03 16:15:26.538665'),
	(7, 'auth', '0005_alter_user_last_login_null', '2022-10-03 16:15:26.545165'),
	(8, 'auth', '0006_require_contenttypes_0002', '2022-10-03 16:15:26.549190'),
	(9, 'auth', '0007_alter_validators_add_error_messages', '2022-10-03 16:15:26.556165'),
	(10, 'auth', '0008_alter_user_username_max_length', '2022-10-03 16:15:26.563165'),
	(11, 'auth', '0009_alter_user_last_name_max_length', '2022-10-03 16:15:26.569665'),
	(12, 'auth', '0010_alter_group_name_max_length', '2022-10-03 16:15:26.584165'),
	(13, 'auth', '0011_update_proxy_permissions', '2022-10-03 16:15:26.591165'),
	(14, 'auth', '0012_alter_user_first_name_max_length', '2022-10-03 16:15:26.598165'),
	(15, 'ori', '0001_initial', '2022-10-03 16:15:27.538165'),
	(16, 'admin', '0001_initial', '2022-10-03 16:15:27.674166'),
	(17, 'admin', '0002_logentry_remove_auto_add', '2022-10-03 16:15:27.684165'),
	(18, 'admin', '0003_logentry_add_action_flag_choices', '2022-10-03 16:15:27.693666'),
	(19, 'sessions', '0001_initial', '2022-10-03 16:15:27.730665'),
	(20, 'ori', '0002_alter_participante_email', '2022-10-13 14:50:21.194435'),
	(21, 'ori', '0003_alter_participante_email', '2022-10-17 09:13:32.928170'),
	(22, 'ori', '0004_alter_participante_username', '2022-10-17 09:36:58.227666'),
	(23, 'ori', '0005_auto_20221017_1319', '2022-10-17 11:19:33.991468'),
	(24, 'ori', '0006_alter_proyecto_coordina_institucion', '2022-10-17 11:39:27.304784'),
	(25, 'ori', '0007_remove_proyecto_ugr_institucion_asociada', '2022-10-17 11:52:59.634533'),
	(26, 'ori', '0008_alter_proyecto_participa_institucion', '2022-10-17 12:32:04.384332');

-- Volcando estructura para tabla ori.django_session
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla ori.django_session: ~1 rows (aproximadamente)
DELETE FROM `django_session`;
INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
	('jr2ojo157opca74oaje8tpfa4mo55pvr', '.eJxVjEEOwiAQRe_C2hAGBIpL9z0DmWFAqoYmpV0Z765NutDtf-_9l4i4rTVuPS9xYnERgzj9boTpkdsO-I7tNss0t3WZSO6KPGiX48z5eT3cv4OKvX5rJCxZK-ccZ0tQrAHLROiJyQfQxnrnTYIMzOeScACtgidQxjudUhDvDwUwOCU:1okOjS:XkKrVeKDtu0bNybPHnlU9GwIp_ehUWftqnqksv3q6Y4', '2022-10-31 11:56:34.835868');

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

-- Volcando estructura para tabla ori.institucion
CREATE TABLE IF NOT EXISTS `institucion` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombreinstitucion` varchar(200) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `pais` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla ori.institucion: ~0 rows (aproximadamente)
DELETE FROM `institucion`;
INSERT INTO `institucion` (`id`, `nombreinstitucion`, `email`, `pais`) VALUES
	(1, 'UGR', 'correo.ugr.es', 'Spain'),
	(2, 'Guadix', 'guadix.gmail.com', 'Spain');

-- Volcando estructura para tabla ori.participante
CREATE TABLE IF NOT EXISTS `participante` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(200) DEFAULT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `vinculacion` varchar(200) DEFAULT NULL,
  `email` varchar(200) NOT NULL,
  `notas` varchar(200) DEFAULT NULL,
  `departamento_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Participante_email_a428c02f_uniq` (`email`),
  KEY `Participante_departamento_id_19423693_fk_Departamento_id` (`departamento_id`),
  CONSTRAINT `Participante_departamento_id_19423693_fk_Departamento_id` FOREIGN KEY (`departamento_id`) REFERENCES `departamento` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla ori.participante: ~3 rows (aproximadamente)
DELETE FROM `participante`;
INSERT INTO `participante` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `is_staff`, `is_active`, `date_joined`, `vinculacion`, `email`, `notas`, `departamento_id`) VALUES
	(5, 'pbkdf2_sha256$260000$IUBSE7RlXz0VVOgeUFfD1M$9uex+cNhRA1ziW1BHAxDkRs5YvcWYc/DeN6jg58qUrU=', '2022-10-17 09:32:09.947528', 1, 'angel', 'Gonzalez', 'Ruiz', 1, 1, '2022-10-04 00:42:36.000000', NULL, 'argelion14@gmail.com', NULL, NULL),
	(6, 'pbkdf2_sha256$260000$aJNWHuNFjzPR4R46BON0vh$hmuceIOxX21g7oL9vIw97Kw/XbGs3LmeuiY3sYqTtOE=', '2022-10-04 14:26:48.268220', 0, 'DemoStaff', 'Demo', 'Demo', 1, 1, '2022-10-03 22:47:30.403051', NULL, 'Demoemail@gmail.com', NULL, 1),
	(7, 'pbkdf2_sha256$260000$9izH1j6TLpi3AEKAKIQWZy$CkeAyqwkm8uKal7sYoO8woIZhw/QB7Th1mU4HQFFfXA=', NULL, 0, 'Pablo', 'jjee', 'aooao', 0, 1, '2022-10-04 13:39:14.843680', NULL, 'probando@gmail.com', NULL, NULL),
	(8, 'pbkdf2_sha256$260000$ysSTaVDIqZ41r71qydg0fG$yIaLUNR2A0gsHQf/bAXI5Z3fQOjk74wbn/k/qfvlVb0=', '2022-10-17 11:56:34.831867', 0, 'patatita', 'Pata', 'tita', 1, 1, '2022-10-17 09:38:33.806995', 'noise', 'patata@gmail.com', NULL, 1),
	(9, 'pbkdf2_sha256$260000$ZrCiTTGJIq47gb9E8xHVq2$Xs+PL4imvXhneYydci2c/xiLdzvPjD+8wVVGZc8qX1I=', NULL, 0, 'elvergalarga', 'elver', 'galarga', 0, 1, '2022-10-17 23:16:32.842526', NULL, 'lesape@correo.ugr.es', NULL, NULL);

-- Volcando estructura para tabla ori.participante_groups
CREATE TABLE IF NOT EXISTS `participante_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `participante_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Participante_groups_participante_id_group_id_a041e132_uniq` (`participante_id`,`group_id`),
  KEY `Participante_groups_group_id_8528255a_fk_auth_group_id` (`group_id`),
  CONSTRAINT `Participante_groups_group_id_8528255a_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `Participante_groups_participante_id_ea30cff4_fk_Participante_id` FOREIGN KEY (`participante_id`) REFERENCES `participante` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla ori.participante_groups: ~0 rows (aproximadamente)
DELETE FROM `participante_groups`;

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla ori.participante_proyectos: ~2 rows (aproximadamente)
DELETE FROM `participante_proyectos`;
INSERT INTO `participante_proyectos` (`id`, `participante_id`, `proyecto_id`) VALUES
	(5, 5, 1),
	(6, 6, 1),
	(7, 6, 2);

-- Volcando estructura para tabla ori.participante_user_permissions
CREATE TABLE IF NOT EXISTS `participante_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `participante_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Participante_user_permis_participante_id_permissi_1a97357f_uniq` (`participante_id`,`permission_id`),
  KEY `Participante_user_pe_permission_id_46afe635_fk_auth_perm` (`permission_id`),
  CONSTRAINT `Participante_user_pe_participante_id_c65f6534_fk_Participa` FOREIGN KEY (`participante_id`) REFERENCES `participante` (`id`),
  CONSTRAINT `Participante_user_pe_permission_id_46afe635_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla ori.participante_user_permissions: ~0 rows (aproximadamente)
DELETE FROM `participante_user_permissions`;

-- Volcando estructura para tabla ori.partnership_agreement
CREATE TABLE IF NOT EXISTS `partnership_agreement` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `estado` varchar(40) NOT NULL,
  `fecha_creacion` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla ori.partnership_agreement: ~2 rows (aproximadamente)
DELETE FROM `partnership_agreement`;
INSERT INTO `partnership_agreement` (`id`, `estado`, `fecha_creacion`) VALUES
	(1, 'Firmado', '2022-10-03'),
	(2, 'Borrado', '2022-10-03');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla ori.presupuesto: ~0 rows (aproximadamente)
DELETE FROM `presupuesto`;
INSERT INTO `presupuesto` (`id`, `organismo_financiador`, `total`, `presentacion`, `proyecto_id`) VALUES
	(1, 'Alejandro Vega', '10000', '2022-10-09', 1),
	(2, 'Sigam', NULL, NULL, 2);

-- Volcando estructura para tabla ori.programa
CREATE TABLE IF NOT EXISTS `programa` (
  `programa_id` int NOT NULL AUTO_INCREMENT,
  `nombreprograma` varchar(200) DEFAULT NULL,
  `fecha_creacion` date DEFAULT NULL,
  PRIMARY KEY (`programa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla ori.programa: ~0 rows (aproximadamente)
DELETE FROM `programa`;

-- Volcando estructura para tabla ori.proyecto
CREATE TABLE IF NOT EXISTS `proyecto` (
  `proyecto_id` int NOT NULL AUTO_INCREMENT,
  `nombreproyecto` varchar(200) DEFAULT NULL,
  `sigla` varchar(10) DEFAULT NULL,
  `id_referencia` int DEFAULT NULL,
  `web` varchar(100) DEFAULT NULL,
  `notas` varchar(500) DEFAULT NULL,
  `fecha_creacion` date DEFAULT NULL,
  `partnership_agreement_id` bigint DEFAULT NULL,
  `coordina_institucion_id` bigint NOT NULL,
  PRIMARY KEY (`proyecto_id`),
  KEY `proyecto_partnership_agreemen_f7e406aa_fk_partnersh` (`partnership_agreement_id`),
  KEY `proyecto_coordina_institucion_id_73189548_fk_Institucion_id` (`coordina_institucion_id`),
  CONSTRAINT `proyecto_coordina_institucion_id_73189548_fk_Institucion_id` FOREIGN KEY (`coordina_institucion_id`) REFERENCES `institucion` (`id`),
  CONSTRAINT `proyecto_partnership_agreemen_f7e406aa_fk_partnersh` FOREIGN KEY (`partnership_agreement_id`) REFERENCES `partnership_agreement` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla ori.proyecto: ~1 rows (aproximadamente)
DELETE FROM `proyecto`;
INSERT INTO `proyecto` (`proyecto_id`, `nombreproyecto`, `sigla`, `id_referencia`, `web`, `notas`, `fecha_creacion`, `partnership_agreement_id`, `coordina_institucion_id`) VALUES
	(1, 'Prueba', 'Pb', 0, 'primero', 'No hay', '2022-10-03', 1, 1),
	(2, 'Prueba2', 'sec', 1, 'segunda', NULL, '2022-10-03', 2, 1),
	(3, 'Prueba3', NULL, NULL, NULL, NULL, '2022-10-17', 1, 2),
	(4, 'Prueba4', NULL, NULL, NULL, NULL, '2022-10-17', 1, 1);

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

-- Volcando datos para la tabla ori.proyecto_participa_institucion: ~0 rows (aproximadamente)
DELETE FROM `proyecto_participa_institucion`;
INSERT INTO `proyecto_participa_institucion` (`id`, `proyecto_id`, `institucion_id`) VALUES
	(4, 1, 1);

-- Volcando estructura para tabla ori.subprograma
CREATE TABLE IF NOT EXISTS `subprograma` (
  `subprograma_id` int NOT NULL AUTO_INCREMENT,
  `nombreprograma` varchar(200) DEFAULT NULL,
  `fecha_creacion` date DEFAULT NULL,
  `programa_id` int DEFAULT NULL,
  PRIMARY KEY (`subprograma_id`),
  KEY `subprograma_programa_id_b9358eac_fk_programa_programa_id` (`programa_id`),
  CONSTRAINT `subprograma_programa_id_b9358eac_fk_programa_programa_id` FOREIGN KEY (`programa_id`) REFERENCES `programa` (`programa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla ori.subprograma: ~0 rows (aproximadamente)
DELETE FROM `subprograma`;

-- Volcando estructura para tabla ori.tipogestiontiempo
IF NOT EXISTS ;

-- Volcando datos para la tabla ori.tipogestiontiempo: ~0 rows (aproximadamente)
DELETE FROM `tipogestiontiempo`;
/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
