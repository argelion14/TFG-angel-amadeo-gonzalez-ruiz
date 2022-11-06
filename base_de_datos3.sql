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
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla ori.auth_permission: ~68 rows (aproximadamente)
DELETE FROM `auth_permission`;
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
	(58, 'Can add log entry', 1, 'add_logentry'),
	(59, 'Can change log entry', 1, 'change_logentry'),
	(60, 'Can delete log entry', 1, 'delete_logentry'),
	(61, 'Can view log entry', 1, 'view_logentry'),
	(62, 'Can add group', 3, 'add_group'),
	(63, 'Can change group', 3, 'change_group'),
	(64, 'Can delete group', 3, 'delete_group'),
	(65, 'Can view group', 3, 'view_group'),
	(66, 'Can add permission', 2, 'add_permission'),
	(67, 'Can change permission', 2, 'change_permission'),
	(68, 'Can delete permission', 2, 'delete_permission'),
	(69, 'Can view permission', 2, 'view_permission'),
	(70, 'Can add content type', 4, 'add_contenttype'),
	(71, 'Can change content type', 4, 'change_contenttype'),
	(72, 'Can delete content type', 4, 'delete_contenttype'),
	(73, 'Can view content type', 4, 'view_contenttype'),
	(74, 'Can add session', 5, 'add_session'),
	(75, 'Can change session', 5, 'change_session'),
	(76, 'Can delete session', 5, 'delete_session'),
	(77, 'Can view session', 5, 'view_session'),
	(78, 'Can add programa', 9, 'add_programa'),
	(79, 'Can change programa', 9, 'change_programa'),
	(80, 'Can delete programa', 9, 'delete_programa'),
	(81, 'Can view programa', 9, 'view_programa'),
	(82, 'Can add subprograma', 14, 'add_subprograma'),
	(83, 'Can change subprograma', 14, 'change_subprograma'),
	(84, 'Can delete subprograma', 14, 'delete_subprograma'),
	(85, 'Can view subprograma', 14, 'view_subprograma'),
	(86, 'Can add file', 12, 'add_file'),
	(87, 'Can change file', 12, 'change_file'),
	(88, 'Can delete file', 12, 'delete_file'),
	(89, 'Can view file', 12, 'view_file'),
	(90, 'Can add timesheet', 15, 'add_timesheet'),
	(91, 'Can change timesheet', 15, 'change_timesheet'),
	(92, 'Can delete timesheet', 15, 'delete_timesheet'),
	(93, 'Can view timesheet', 15, 'view_timesheet'),
	(94, 'Can add presupuesto', 11, 'add_presupuesto'),
	(95, 'Can change presupuesto', 11, 'change_presupuesto'),
	(96, 'Can delete presupuesto', 11, 'delete_presupuesto'),
	(97, 'Can view presupuesto', 11, 'view_presupuesto'),
	(98, 'Can add institucion', 7, 'add_institucion'),
	(99, 'Can change institucion', 7, 'change_institucion'),
	(100, 'Can delete institucion', 7, 'delete_institucion'),
	(101, 'Can view institucion', 7, 'view_institucion'),
	(102, 'Can add partnership agreement', 8, 'add_partnershipagreement'),
	(103, 'Can change partnership agreement', 8, 'change_partnershipagreement'),
	(104, 'Can delete partnership agreement', 8, 'delete_partnershipagreement'),
	(105, 'Can view partnership agreement', 8, 'view_partnershipagreement'),
	(106, 'Can add departamento', 6, 'add_departamento'),
	(107, 'Can change departamento', 6, 'change_departamento'),
	(108, 'Can delete departamento', 6, 'delete_departamento'),
	(109, 'Can view departamento', 6, 'view_departamento'),
	(110, 'Can add proyecto', 10, 'add_proyecto'),
	(111, 'Can change proyecto', 10, 'change_proyecto'),
	(112, 'Can delete proyecto', 10, 'delete_proyecto'),
	(113, 'Can view proyecto', 10, 'view_proyecto'),
	(114, 'Can add rol', 16, 'add_rol'),
	(115, 'Can change rol', 16, 'change_rol'),
	(116, 'Can delete rol', 16, 'delete_rol'),
	(117, 'Can view rol', 16, 'view_rol'),
	(118, 'Can add participante', 13, 'add_participante'),
	(119, 'Can change participante', 13, 'change_participante'),
	(120, 'Can delete participante', 13, 'delete_participante'),
	(121, 'Can view participante', 13, 'view_participante'),
	(122, 'Can add periodo', 17, 'add_periodo'),
	(123, 'Can change periodo', 17, 'change_periodo'),
	(124, 'Can delete periodo', 17, 'delete_periodo'),
	(125, 'Can view periodo', 17, 'view_periodo');

-- Volcando estructura para tabla ori.departamento
CREATE TABLE IF NOT EXISTS `departamento` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombredepartamento` varchar(200) NOT NULL,
  `correo` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla ori.departamento: ~0 rows (aproximadamente)
DELETE FROM `departamento`;

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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla ori.django_content_type: ~17 rows (aproximadamente)
DELETE FROM `django_content_type`;
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
	(1, 'admin', 'logentry'),
	(3, 'auth', 'group'),
	(2, 'auth', 'permission'),
	(4, 'contenttypes', 'contenttype'),
	(6, 'ori', 'departamento'),
	(12, 'ori', 'file'),
	(7, 'ori', 'institucion'),
	(13, 'ori', 'participante'),
	(8, 'ori', 'partnershipagreement'),
	(17, 'ori', 'periodo'),
	(11, 'ori', 'presupuesto'),
	(9, 'ori', 'programa'),
	(10, 'ori', 'proyecto'),
	(16, 'ori', 'rol'),
	(14, 'ori', 'subprograma'),
	(15, 'ori', 'timesheet'),
	(5, 'sessions', 'session');

-- Volcando estructura para tabla ori.django_migrations
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla ori.django_migrations: ~19 rows (aproximadamente)
DELETE FROM `django_migrations`;
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
	(1, 'contenttypes', '0001_initial', '2022-10-18 11:41:21.172753'),
	(2, 'contenttypes', '0002_remove_content_type_name', '2022-10-18 11:41:21.235751'),
	(3, 'auth', '0001_initial', '2022-10-18 11:41:21.570251'),
	(4, 'auth', '0002_alter_permission_name_max_length', '2022-10-18 11:41:21.968291'),
	(5, 'auth', '0003_alter_user_email_max_length', '2022-10-18 11:41:21.975258'),
	(6, 'auth', '0004_alter_user_username_opts', '2022-10-18 11:41:21.981787'),
	(7, 'auth', '0005_alter_user_last_login_null', '2022-10-18 11:41:21.988787'),
	(8, 'auth', '0006_require_contenttypes_0002', '2022-10-18 11:41:21.992787'),
	(9, 'auth', '0007_alter_validators_add_error_messages', '2022-10-18 11:41:22.002263'),
	(10, 'auth', '0008_alter_user_username_max_length', '2022-10-18 11:41:22.009285'),
	(11, 'auth', '0009_alter_user_last_name_max_length', '2022-10-18 11:41:22.016284'),
	(12, 'auth', '0010_alter_group_name_max_length', '2022-10-18 11:41:22.148751'),
	(13, 'auth', '0011_update_proxy_permissions', '2022-10-18 11:41:22.156751'),
	(14, 'auth', '0012_alter_user_first_name_max_length', '2022-10-18 11:41:22.164252'),
	(15, 'ori', '0001_initial', '2022-10-18 11:41:24.335886'),
	(16, 'admin', '0001_initial', '2022-10-18 11:41:24.756351'),
	(17, 'admin', '0002_logentry_remove_auto_add', '2022-10-18 11:41:24.766886'),
	(18, 'admin', '0003_logentry_add_action_flag_choices', '2022-10-18 11:41:24.777386'),
	(19, 'sessions', '0001_initial', '2022-10-18 11:41:24.909879'),
	(20, 'ori', '0002_periodo_rol_timesheet', '2022-10-18 12:07:15.132587'),
	(21, 'ori', '0003_alter_participante_username', '2022-10-18 14:26:28.184223'),
	(22, 'ori', '0004_alter_proyecto_nombreproyecto', '2022-10-18 14:37:07.135861'),
	(23, 'ori', '0005_auto_20221022_1229', '2022-10-22 10:29:19.762276');

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
	('hljisel9b5b30z2rfxdprdqcrt4rikol', '.eJxVjEEOwiAQRe_C2pChhQIu3XsGMjCDVA0kpV0Z765NutDtf-_9lwi4rSVsnZcwkzgLBeL0O0ZMD647oTvWW5Op1XWZo9wVedAur434eTncv4OCvXxr59To2SZIwKQ9kSMGStYzMqCZotNgJz9mNsADa1TZjYYwkbd5sFq8PxxBOKc:1oknG9:lSFtSdfnLmFSY5D9TG5y-Ms_x2qnuxsRMd1lm3acLoE', '2022-11-01 14:07:57.755330');

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

-- Volcando datos para la tabla ori.institucion: ~2 rows (aproximadamente)
DELETE FROM `institucion`;
INSERT INTO `institucion` (`id`, `nombreinstitucion`, `email`, `pais`) VALUES
	(1, 'UGR', 'ugr@correo.ugr.es', 'spain'),
	(2, 'Guadix', NULL, NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla ori.participante_proyectos: ~0 rows (aproximadamente)
DELETE FROM `participante_proyectos`;
INSERT INTO `participante_proyectos` (`id`, `participante_id`, `proyecto_id`) VALUES
	(2, 10, 1);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla ori.partnership_agreement: ~0 rows (aproximadamente)
DELETE FROM `partnership_agreement`;

-- Volcando estructura para tabla ori.periodo
CREATE TABLE IF NOT EXISTS `periodo` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `tiempo` varchar(200) NOT NULL,
  `proyecto_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Periodo_id_proyecto_id_e47cb448_uniq` (`id`,`proyecto_id`),
  KEY `Periodo_proyecto_id_3d61fca2_fk_proyecto_proyecto_id` (`proyecto_id`),
  CONSTRAINT `Periodo_proyecto_id_3d61fca2_fk_proyecto_proyecto_id` FOREIGN KEY (`proyecto_id`) REFERENCES `proyecto` (`proyecto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla ori.periodo: ~0 rows (aproximadamente)
DELETE FROM `periodo`;

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

-- Volcando estructura para tabla ori.programa
CREATE TABLE IF NOT EXISTS `programa` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombreprograma` varchar(200) DEFAULT NULL,
  `fecha_creacion` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla ori.programa: ~0 rows (aproximadamente)
DELETE FROM `programa`;

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
  PRIMARY KEY (`proyecto_id`),
  KEY `proyecto_coordina_institucion_id_73189548_fk_Institucion_id` (`coordina_institucion_id`),
  KEY `proyecto_partnership_agreemen_f7e406aa_fk_partnersh` (`partnership_agreement_id`),
  CONSTRAINT `proyecto_coordina_institucion_id_73189548_fk_Institucion_id` FOREIGN KEY (`coordina_institucion_id`) REFERENCES `institucion` (`id`),
  CONSTRAINT `proyecto_partnership_agreemen_f7e406aa_fk_partnersh` FOREIGN KEY (`partnership_agreement_id`) REFERENCES `partnership_agreement` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla ori.proyecto: ~2 rows (aproximadamente)
DELETE FROM `proyecto`;
INSERT INTO `proyecto` (`proyecto_id`, `nombreproyecto`, `sigla`, `id_referencia`, `web`, `notas`, `fecha_creacion`, `coordina_institucion_id`, `partnership_agreement_id`) VALUES
	(1, 'Guadix power', NULL, NULL, NULL, NULL, '2022-10-18', 1, NULL),
	(2, 'Proyecto2', NULL, NULL, NULL, NULL, '2022-10-18', 2, NULL),
	(3, 'UGRSOLO', NULL, NULL, NULL, NULL, '2022-10-18', 1, NULL);

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

-- Volcando estructura para tabla ori.rol
CREATE TABLE IF NOT EXISTS `rol` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `rolename` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla ori.rol: ~0 rows (aproximadamente)
DELETE FROM `rol`;

-- Volcando estructura para tabla ori.subprograma
CREATE TABLE IF NOT EXISTS `subprograma` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombreprograma` varchar(200) DEFAULT NULL,
  `fecha_creacion` date DEFAULT NULL,
  `programa_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `subprograma_id_programa_id_4942df86_uniq` (`id`,`programa_id`),
  KEY `subprograma_programa_id_b9358eac_fk_programa_id` (`programa_id`),
  CONSTRAINT `subprograma_programa_id_b9358eac_fk_programa_id` FOREIGN KEY (`programa_id`) REFERENCES `programa` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla ori.subprograma: ~0 rows (aproximadamente)
DELETE FROM `subprograma`;

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

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
