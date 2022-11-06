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
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla ori.auth_permission: ~100 rows (aproximadamente)
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
	(21, 'Can add participante', 6, 'add_participante'),
	(22, 'Can change participante', 6, 'change_participante'),
	(23, 'Can delete participante', 6, 'delete_participante'),
	(24, 'Can view participante', 6, 'view_participante'),
	(25, 'Can add convocatoria', 7, 'add_convocatoria'),
	(26, 'Can change convocatoria', 7, 'change_convocatoria'),
	(27, 'Can delete convocatoria', 7, 'delete_convocatoria'),
	(28, 'Can view convocatoria', 7, 'view_convocatoria'),
	(29, 'Can add departamento', 8, 'add_departamento'),
	(30, 'Can change departamento', 8, 'change_departamento'),
	(31, 'Can delete departamento', 8, 'delete_departamento'),
	(32, 'Can view departamento', 8, 'view_departamento'),
	(33, 'Can add institucion', 9, 'add_institucion'),
	(34, 'Can change institucion', 9, 'change_institucion'),
	(35, 'Can delete institucion', 9, 'delete_institucion'),
	(36, 'Can view institucion', 9, 'view_institucion'),
	(37, 'Can add partnership agreement', 10, 'add_partnershipagreement'),
	(38, 'Can change partnership agreement', 10, 'change_partnershipagreement'),
	(39, 'Can delete partnership agreement', 10, 'delete_partnershipagreement'),
	(40, 'Can view partnership agreement', 10, 'view_partnershipagreement'),
	(41, 'Can add periodicidad', 11, 'add_periodicidad'),
	(42, 'Can change periodicidad', 11, 'change_periodicidad'),
	(43, 'Can delete periodicidad', 11, 'delete_periodicidad'),
	(44, 'Can view periodicidad', 11, 'view_periodicidad'),
	(45, 'Can add periodo', 12, 'add_periodo'),
	(46, 'Can change periodo', 12, 'change_periodo'),
	(47, 'Can delete periodo', 12, 'delete_periodo'),
	(48, 'Can view periodo', 12, 'view_periodo'),
	(49, 'Can add programa', 13, 'add_programa'),
	(50, 'Can change programa', 13, 'change_programa'),
	(51, 'Can delete programa', 13, 'delete_programa'),
	(52, 'Can view programa', 13, 'view_programa'),
	(53, 'Can add proyecto', 14, 'add_proyecto'),
	(54, 'Can change proyecto', 14, 'change_proyecto'),
	(55, 'Can delete proyecto', 14, 'delete_proyecto'),
	(56, 'Can view proyecto', 14, 'view_proyecto'),
	(57, 'Can add rol', 15, 'add_rol'),
	(58, 'Can change rol', 15, 'change_rol'),
	(59, 'Can delete rol', 15, 'delete_rol'),
	(60, 'Can view rol', 15, 'view_rol'),
	(61, 'Can add timesheet', 16, 'add_timesheet'),
	(62, 'Can change timesheet', 16, 'change_timesheet'),
	(63, 'Can delete timesheet', 16, 'delete_timesheet'),
	(64, 'Can view timesheet', 16, 'view_timesheet'),
	(65, 'Can add subprograma', 17, 'add_subprograma'),
	(66, 'Can change subprograma', 17, 'change_subprograma'),
	(67, 'Can delete subprograma', 17, 'delete_subprograma'),
	(68, 'Can view subprograma', 17, 'view_subprograma'),
	(69, 'Can add presupuesto', 18, 'add_presupuesto'),
	(70, 'Can change presupuesto', 18, 'change_presupuesto'),
	(71, 'Can delete presupuesto', 18, 'delete_presupuesto'),
	(72, 'Can view presupuesto', 18, 'view_presupuesto'),
	(73, 'Can add participante proyectos', 19, 'add_participanteproyectos'),
	(74, 'Can change participante proyectos', 19, 'change_participanteproyectos'),
	(75, 'Can delete participante proyectos', 19, 'delete_participanteproyectos'),
	(76, 'Can view participante proyectos', 19, 'view_participanteproyectos'),
	(77, 'Can add file', 20, 'add_file'),
	(78, 'Can change file', 20, 'change_file'),
	(79, 'Can delete file', 20, 'delete_file'),
	(80, 'Can view file', 20, 'view_file'),
	(81, 'Can add convocatoria convocatorias subprogramas', 21, 'add_convocatoriaconvocatoriassubprogramas'),
	(82, 'Can change convocatoria convocatorias subprogramas', 21, 'change_convocatoriaconvocatoriassubprogramas'),
	(83, 'Can delete convocatoria convocatorias subprogramas', 21, 'delete_convocatoriaconvocatoriassubprogramas'),
	(84, 'Can view convocatoria convocatorias subprogramas', 21, 'view_convocatoriaconvocatoriassubprogramas'),
	(85, 'Can add sepresenta', 22, 'add_sepresenta'),
	(86, 'Can change sepresenta', 22, 'change_sepresenta'),
	(87, 'Can delete sepresenta', 22, 'delete_sepresenta'),
	(88, 'Can view sepresenta', 22, 'view_sepresenta'),
	(89, 'Can add proyecto participa institucion', 23, 'add_proyectoparticipainstitucion'),
	(90, 'Can change proyecto participa institucion', 23, 'change_proyectoparticipainstitucion'),
	(91, 'Can delete proyecto participa institucion', 23, 'delete_proyectoparticipainstitucion'),
	(92, 'Can view proyecto participa institucion', 23, 'view_proyectoparticipainstitucion'),
	(93, 'Can add posee', 24, 'add_posee'),
	(94, 'Can change posee', 24, 'change_posee'),
	(95, 'Can delete posee', 24, 'delete_posee'),
	(96, 'Can view posee', 24, 'view_posee'),
	(97, 'Can add tarea', 25, 'add_tarea'),
	(98, 'Can change tarea', 25, 'change_tarea'),
	(99, 'Can delete tarea', 25, 'delete_tarea'),
	(100, 'Can view tarea', 25, 'view_tarea');

-- Volcando estructura para tabla ori.convocatoria
CREATE TABLE IF NOT EXISTS `convocatoria` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `fecha_creacion` date DEFAULT NULL,
  `anio` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla ori.convocatoria: ~1 rows (aproximadamente)
DELETE FROM `convocatoria`;
INSERT INTO `convocatoria` (`id`, `fecha_creacion`, `anio`) VALUES
	(2, '2022-11-04', 2023);

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla ori.convocatoria_convocatorias_subprogramas: ~1 rows (aproximadamente)
DELETE FROM `convocatoria_convocatorias_subprogramas`;
INSERT INTO `convocatoria_convocatorias_subprogramas` (`id`, `convocatoria_id`, `subprograma_id`, `fecha_creacion`) VALUES
	(7, 2, 5, '2022-11-04');

-- Volcando estructura para tabla ori.departamento
CREATE TABLE IF NOT EXISTS `departamento` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombredepartamento` varchar(200) NOT NULL,
  `correo` varchar(200) DEFAULT NULL,
  `fecha_creacion` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla ori.departamento: ~1 rows (aproximadamente)
DELETE FROM `departamento`;
INSERT INTO `departamento` (`id`, `nombredepartamento`, `correo`, `fecha_creacion`) VALUES
	(1, 'Ciencias', 'ciencias@si.com', '2022-11-04');

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
  KEY `django_admin_log_user_id_c564eba6_fk_participante_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_participante_id` FOREIGN KEY (`user_id`) REFERENCES `participante` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla ori.django_admin_log: ~5 rows (aproximadamente)
DELETE FROM `django_admin_log`;
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
	(1, '2022-11-04 12:10:46.663469', '1', 'Ciencias', 1, '[{"added": {}}]', 8, 1),
	(2, '2022-11-04 12:11:17.791608', '1', 'UGR', 1, '[{"added": {}}]', 9, 1),
	(3, '2022-11-04 12:11:26.483445', '1', 'Finish', 1, '[{"added": {}}]', 10, 1),
	(4, '2022-11-04 12:11:44.973904', '1', 'Mensual', 1, '[{"added": {}}]', 11, 1),
	(5, '2022-11-04 12:11:53.627101', '1', 'Gerente', 1, '[{"added": {}}]', 15, 1);

-- Volcando estructura para tabla ori.django_content_type
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla ori.django_content_type: ~25 rows (aproximadamente)
DELETE FROM `django_content_type`;
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
	(1, 'admin', 'logentry'),
	(3, 'auth', 'group'),
	(2, 'auth', 'permission'),
	(4, 'contenttypes', 'contenttype'),
	(7, 'ori', 'convocatoria'),
	(21, 'ori', 'convocatoriaconvocatoriassubprogramas'),
	(8, 'ori', 'departamento'),
	(20, 'ori', 'file'),
	(9, 'ori', 'institucion'),
	(6, 'ori', 'participante'),
	(19, 'ori', 'participanteproyectos'),
	(10, 'ori', 'partnershipagreement'),
	(11, 'ori', 'periodicidad'),
	(12, 'ori', 'periodo'),
	(24, 'ori', 'posee'),
	(18, 'ori', 'presupuesto'),
	(13, 'ori', 'programa'),
	(14, 'ori', 'proyecto'),
	(23, 'ori', 'proyectoparticipainstitucion'),
	(15, 'ori', 'rol'),
	(22, 'ori', 'sepresenta'),
	(17, 'ori', 'subprograma'),
	(25, 'ori', 'tarea'),
	(16, 'ori', 'timesheet'),
	(5, 'sessions', 'session');

-- Volcando estructura para tabla ori.django_migrations
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla ori.django_migrations: ~36 rows (aproximadamente)
DELETE FROM `django_migrations`;
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
	(1, 'contenttypes', '0001_initial', '2022-10-29 10:51:41.646022'),
	(2, 'contenttypes', '0002_remove_content_type_name', '2022-10-29 10:51:41.742140'),
	(3, 'auth', '0001_initial', '2022-10-29 10:51:42.151662'),
	(4, 'auth', '0002_alter_permission_name_max_length', '2022-10-29 10:51:42.245507'),
	(5, 'auth', '0003_alter_user_email_max_length', '2022-10-29 10:51:42.252043'),
	(6, 'auth', '0004_alter_user_username_opts', '2022-10-29 10:51:42.258545'),
	(7, 'auth', '0005_alter_user_last_login_null', '2022-10-29 10:51:42.264862'),
	(8, 'auth', '0006_require_contenttypes_0002', '2022-10-29 10:51:42.269338'),
	(9, 'auth', '0007_alter_validators_add_error_messages', '2022-10-29 10:51:42.276338'),
	(10, 'auth', '0008_alter_user_username_max_length', '2022-10-29 10:51:42.283163'),
	(11, 'auth', '0009_alter_user_last_name_max_length', '2022-10-29 10:51:42.290687'),
	(12, 'auth', '0010_alter_group_name_max_length', '2022-10-29 10:51:42.305818'),
	(13, 'auth', '0011_update_proxy_permissions', '2022-10-29 10:51:42.312818'),
	(14, 'auth', '0012_alter_user_first_name_max_length', '2022-10-29 10:51:42.319818'),
	(19, 'sessions', '0001_initial', '2022-10-29 10:51:44.824345'),
	(42, 'ori', '0001_initial', '2022-11-04 11:54:53.215385'),
	(43, 'admin', '0001_initial', '2022-11-04 11:54:53.374356'),
	(44, 'admin', '0002_logentry_remove_auto_add', '2022-11-04 11:54:53.383862'),
	(45, 'admin', '0003_logentry_add_action_flag_choices', '2022-11-04 11:54:53.392862'),
	(46, 'ori', '0002_auto_20221031_1103', '2022-11-04 11:54:53.493354'),
	(47, 'ori', '0003_alter_posee_timesheet', '2022-11-04 11:54:53.616854'),
	(48, 'ori', '0004_auto_20221101_0944', '2022-11-04 11:54:54.253386'),
	(49, 'ori', '0005_auto_20221101_1924', '2022-11-04 11:54:54.318386'),
	(50, 'ori', '0006_periodo_num_periodo', '2022-11-04 11:54:54.353364'),
	(51, 'ori', '0007_auto_20221102_1043', '2022-11-04 11:54:54.583864'),
	(52, 'ori', '0008_timesheet_nombretimesheet', '2022-11-04 11:54:54.618392'),
	(53, 'ori', '0009_auto_20221103_1122', '2022-11-04 11:54:55.042355'),
	(54, 'ori', '0010_auto_20221103_1136', '2022-11-04 11:54:55.211855'),
	(55, 'ori', '0011_auto_20221103_1157', '2022-11-04 11:54:55.459855'),
	(56, 'ori', '0012_remove_timesheet_nombretimesheet', '2022-11-04 11:54:55.511369'),
	(57, 'ori', '0013_convocatoria_anio', '2022-11-04 12:35:30.137230'),
	(58, 'ori', '0014_auto_20221104_1359', '2022-11-04 12:59:31.127305'),
	(59, 'ori', '0015_auto_20221104_1415', '2022-11-04 13:15:21.868893'),
	(60, 'ori', '0016_alter_timesheet_unique_together', '2022-11-04 19:20:47.077236'),
	(61, 'ori', '0017_tarea', '2022-11-05 00:18:39.898786'),
	(62, 'ori', '0018_auto_20221105_0120', '2022-11-05 00:21:09.703062'),
	(63, 'ori', '0019_auto_20221105_1807', '2022-11-05 17:07:51.925631');

-- Volcando estructura para tabla ori.django_session
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla ori.django_session: ~2 rows (aproximadamente)
DELETE FROM `django_session`;
INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
	('9c6xcxm0vdj0q4vgw58bkf4k0dzqu8u9', '.eJxVjEEOgjAQRe_StWlaB2aKS_ecgcx0WosaSCisjHdXEha6_e-9_zIDb2sZtpqWYVRzMWdz-t2E4yNNO9A7T7fZxnlal1HsrtiDVtvPmp7Xw_07KFzLt25QGlB0HAIgkMspgpAygBJhF0WzZ0LfsSePDeTsQhuw7dogJA7N-wPSojcn:1orLfc:QgtnmyKSjaSGpKeIl9CPcs8KU7BDrQ0_P-QsNYhbV6g', '2022-11-19 16:05:20.818758'),
	('ha40v4fm7b44ibyu75p440ccc659hefd', '.eJxVjEEOgjAQRe_StWlaB2aKS_ecgcx0WosaSCisjHdXEha6_e-9_zIDb2sZtpqWYVRzMWdz-t2E4yNNO9A7T7fZxnlal1HsrtiDVtvPmp7Xw_07KFzLt25QGlB0HAIgkMspgpAygBJhF0WzZ0LfsSePDeTsQhuw7dogJA7N-wPSojcn:1orLQk:2E1NQ1bCIwM8QN8FF5yZ3CYxlCT89wYh9yDGwW0yKQQ', '2022-11-19 15:49:58.547053');

-- Volcando estructura para tabla ori.file
CREATE TABLE IF NOT EXISTS `file` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `file` varchar(100) NOT NULL,
  `file_proyecto_id_id` int NOT NULL,
  `fecha_creacion` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `file_file_proyecto_id_id_3b6dcb69_fk_proyecto_proyecto_id` (`file_proyecto_id_id`),
  CONSTRAINT `file_file_proyecto_id_id_3b6dcb69_fk_proyecto_proyecto_id` FOREIGN KEY (`file_proyecto_id_id`) REFERENCES `proyecto` (`proyecto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla ori.file: ~1 rows (aproximadamente)
DELETE FROM `file`;

-- Volcando estructura para tabla ori.institucion
CREATE TABLE IF NOT EXISTS `institucion` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombreinstitucion` varchar(200) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `pais` varchar(200) DEFAULT NULL,
  `fecha_creacion` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla ori.institucion: ~1 rows (aproximadamente)
DELETE FROM `institucion`;
INSERT INTO `institucion` (`id`, `nombreinstitucion`, `email`, `pais`, `fecha_creacion`) VALUES
	(1, 'UGR', 'ugr@correo.ugr.es', 'spain', '2022-11-04');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla ori.participante: ~3 rows (aproximadamente)
DELETE FROM `participante`;
INSERT INTO `participante` (`id`, `password`, `last_login`, `is_superuser`, `first_name`, `last_name`, `is_staff`, `is_active`, `date_joined`, `username`, `vinculacion`, `email`, `notas`, `departamento_id`, `fecha_creacion`) VALUES
	(1, 'pbkdf2_sha256$260000$IcR1UqzYwPZBVgChXmB9HL$3sM7QX0wYTU7JghhViZkEMdlRreItesqMX0HmE2WxzU=', '2022-11-05 10:28:52.424834', 1, '', '', 1, 1, '2022-11-04 11:55:56.315539', 'argelion14', NULL, 'argelion14@gmail.com', NULL, NULL, '2022-11-04'),
	(2, 'pbkdf2_sha256$260000$snabxhzDAasJfrc6cE5d5e$asm/z3LQjsEGLBZjJBHYCV+gyZR87rdTRq/KmnDFGSs=', '2022-11-05 16:05:20.815259', 0, '', '', 1, 1, '2022-11-04 16:36:16.759362', 'Prueba', NULL, 'prueba@prueba.com', NULL, NULL, '2022-11-04'),
	(3, 'pbkdf2_sha256$260000$hO3e7Iv2eKsdOo0gm49cVV$cyzWMN8XZZiYKaGURHC1nCNPgElCc/r/PB534l3Hc+k=', '2022-11-05 10:54:49.895208', 0, '', '', 0, 1, '2022-11-05 10:29:24.164099', 'prueba2', NULL, 'prueba2@prueba.com', NULL, NULL, '2022-11-05');

-- Volcando estructura para tabla ori.participante_groups
CREATE TABLE IF NOT EXISTS `participante_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `participante_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `participante_groups_participante_id_group_id_fccf62cd_uniq` (`participante_id`,`group_id`),
  KEY `participante_groups_group_id_5a9fddd6_fk_auth_group_id` (`group_id`),
  CONSTRAINT `participante_groups_group_id_5a9fddd6_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `participante_groups_participante_id_b34b782f_fk_participante_id` FOREIGN KEY (`participante_id`) REFERENCES `participante` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla ori.participante_groups: ~0 rows (aproximadamente)
DELETE FROM `participante_groups`;

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla ori.participante_proyectos: ~2 rows (aproximadamente)
DELETE FROM `participante_proyectos`;
INSERT INTO `participante_proyectos` (`id`, `participante_id`, `proyecto_id`, `fecha_creacion`) VALUES
	(3, 1, 1, '2022-11-04'),
	(8, 3, 2, '2022-11-05');

-- Volcando estructura para tabla ori.participante_user_permissions
CREATE TABLE IF NOT EXISTS `participante_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `participante_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `participante_user_permis_participante_id_permissi_5143e252_uniq` (`participante_id`,`permission_id`),
  KEY `participante_user_pe_permission_id_ada0d0ba_fk_auth_perm` (`permission_id`),
  CONSTRAINT `participante_user_pe_participante_id_9ed7d73c_fk_participa` FOREIGN KEY (`participante_id`) REFERENCES `participante` (`id`),
  CONSTRAINT `participante_user_pe_permission_id_ada0d0ba_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla ori.participante_user_permissions: ~0 rows (aproximadamente)
DELETE FROM `participante_user_permissions`;

-- Volcando estructura para tabla ori.partnership_agreement
CREATE TABLE IF NOT EXISTS `partnership_agreement` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `estado` varchar(40) NOT NULL,
  `fecha_creacion` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla ori.partnership_agreement: ~1 rows (aproximadamente)
DELETE FROM `partnership_agreement`;
INSERT INTO `partnership_agreement` (`id`, `estado`, `fecha_creacion`) VALUES
	(1, 'Finish', '2022-11-04');

-- Volcando estructura para tabla ori.periodicidad
CREATE TABLE IF NOT EXISTS `periodicidad` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `tipo_periodicidad` varchar(40) NOT NULL,
  `periodosanuales` int NOT NULL,
  `fecha_creacion` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla ori.periodicidad: ~1 rows (aproximadamente)
DELETE FROM `periodicidad`;
INSERT INTO `periodicidad` (`id`, `tipo_periodicidad`, `periodosanuales`, `fecha_creacion`) VALUES
	(1, 'Mensual', 12, '2022-11-04');

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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla ori.periodo: ~14 rows (aproximadamente)
DELETE FROM `periodo`;
INSERT INTO `periodo` (`id`, `proyecto_id`, `num_periodo`, `fecha_creacion`) VALUES
	(1, 1, 1, '2022-11-04'),
	(2, 1, 2, '2022-11-04'),
	(3, 1, 3, '2022-11-04'),
	(4, 1, 4, '2022-11-04'),
	(5, 1, 5, '2022-11-04'),
	(6, 1, 6, '2022-11-04'),
	(7, 1, 7, '2022-11-04'),
	(8, 1, 8, '2022-11-04'),
	(9, 1, 9, '2022-11-04'),
	(10, 1, 10, '2022-11-04'),
	(11, 1, 11, '2022-11-04'),
	(12, 1, 12, '2022-11-04'),
	(13, 2, 1, '2022-11-04'),
	(14, 2, 2, '2022-11-04');

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla ori.posee: ~1 rows (aproximadamente)
DELETE FROM `posee`;
INSERT INTO `posee` (`id`, `participanteproyectos_id`, `timesheet_id`, `fecha_creacion`) VALUES
	(10, 3, 10, '2022-11-05');

-- Volcando estructura para tabla ori.presupuesto
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla ori.presupuesto: ~1 rows (aproximadamente)
DELETE FROM `presupuesto`;
INSERT INTO `presupuesto` (`id`, `organismo_financiador`, `total`, `presentacion`, `proyecto_id`, `fecha_creacion`) VALUES
	(1, 'Aleveji', '30.000', NULL, 1, '2022-11-04');

-- Volcando estructura para tabla ori.programa
CREATE TABLE IF NOT EXISTS `programa` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombreprograma` varchar(200) NOT NULL,
  `fecha_creacion` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla ori.programa: ~1 rows (aproximadamente)
DELETE FROM `programa`;
INSERT INTO `programa` (`id`, `nombreprograma`, `fecha_creacion`) VALUES
	(1, 'Erasmus', '2022-11-04');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla ori.proyecto: ~2 rows (aproximadamente)
DELETE FROM `proyecto`;
INSERT INTO `proyecto` (`proyecto_id`, `nombreproyecto`, `sigla`, `id_referencia`, `web`, `notas`, `fecha_fin`, `fecha_inicio`, `fecha_creacion`, `coordina_institucion_id`, `partnership_agreement_id`, `periodicidad_id`) VALUES
	(1, 'Prueba', NULL, NULL, NULL, NULL, '2022-11-12', '2022-11-10', '2022-11-04', 1, 1, 1),
	(2, 'dxfcds', NULL, NULL, NULL, NULL, '2022-12-10', '2022-12-10', '2022-11-04', 1, NULL, 1);

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla ori.proyecto_participa_institucion: ~1 rows (aproximadamente)
DELETE FROM `proyecto_participa_institucion`;
INSERT INTO `proyecto_participa_institucion` (`id`, `institucion_id`, `proyecto_id`, `fecha_creacion`) VALUES
	(2, 1, 1, '2022-11-04');

-- Volcando estructura para tabla ori.rol
CREATE TABLE IF NOT EXISTS `rol` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `rolename` varchar(200) NOT NULL,
  `fecha_creacion` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla ori.rol: ~1 rows (aproximadamente)
DELETE FROM `rol`;
INSERT INTO `rol` (`id`, `rolename`, `fecha_creacion`) VALUES
	(1, 'Gerente', '2022-11-04');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla ori.sepresenta: ~2 rows (aproximadamente)
DELETE FROM `sepresenta`;
INSERT INTO `sepresenta` (`id`, `convocatoriasubprogramas_id`, `proyecto_id`, `fecha_creacion`) VALUES
	(2, 7, 1, '2022-11-04'),
	(3, 7, 2, '2022-11-04');

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla ori.subprograma: ~2 rows (aproximadamente)
DELETE FROM `subprograma`;
INSERT INTO `subprograma` (`id`, `nombresubprograma`, `fecha_creacion`, `padreprograma_id`, `padresubprograma_id`, `programa_id`) VALUES
	(5, 'Erasmusplus', '2022-11-04', NULL, NULL, 1),
	(6, 'Erasmusplusplus', '2022-11-04', 1, 5, 1);

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla ori.tarea: ~0 rows (aproximadamente)
DELETE FROM `tarea`;
INSERT INTO `tarea` (`id`, `nombretarea`, `descripcion`, `fecha_creacion`, `timesheet_id`, `dia`, `lugar`) VALUES
	(1, 'luicas', 'saltas', NULL, 10, '2022-11-05', 'granada');

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla ori.timesheet: ~1 rows (aproximadamente)
DELETE FROM `timesheet`;
INSERT INTO `timesheet` (`id`, `tipo`, `periodo_id`, `rol_id`, `intellectual_output`, `num_working_days`, `fecha_creacion`) VALUES
	(10, 'Probando', 1, 1, NULL, NULL, '2022-11-05');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
