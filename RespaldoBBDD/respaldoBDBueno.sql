-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: aventurabd
-- ------------------------------------------------------
-- Server version	13.0.2-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add perfil',7,'add_perfil'),(26,'Can change perfil',7,'change_perfil'),(27,'Can delete perfil',7,'delete_perfil'),(28,'Can view perfil',7,'view_perfil'),(29,'Can add categoria',8,'add_categoria'),(30,'Can change categoria',8,'change_categoria'),(31,'Can delete categoria',8,'delete_categoria'),(32,'Can view categoria',8,'view_categoria'),(33,'Can add experiencia',9,'add_experiencia'),(34,'Can change experiencia',9,'change_experiencia'),(35,'Can delete experiencia',9,'delete_experiencia'),(36,'Can view experiencia',9,'view_experiencia'),(37,'Can add inscripcion',10,'add_inscripcion'),(38,'Can change inscripcion',10,'change_inscripcion'),(39,'Can delete inscripcion',10,'delete_inscripcion'),(40,'Can view inscripcion',10,'view_inscripcion'),(41,'Can add reserva',11,'add_reserva'),(42,'Can change reserva',11,'change_reserva'),(43,'Can delete reserva',11,'delete_reserva'),(44,'Can view reserva',11,'view_reserva');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$1000000$EHc6bCns6eveeC4xPeknoZ$6SRfXI+L/3ibTe7mGJ78LvQke63Ol1asz17pqUdTDj8=','2026-11-11 03:11:56.766021',0,'Nacho','','','',0,1,'2026-11-11 03:11:46.451848'),(2,'pbkdf2_sha256$1000000$SF3gyuMUb0hUBlstx3lhXk$NT4toW0aZ9bEof5Gkw0Ogb9HHHcpSjdulK9rwaAnTLU=','2026-11-14 19:54:10.866032',1,'Cristobal','','','ar0026162@gmail.com',1,1,'2026-11-11 03:16:25.100260'),(6,'pbkdf2_sha256$1000000$zwvuoJfDaSbGF4guk2t0IG$ZrMqMMwhjU6muwEzCIC10Fk/kQ9+q79Vjg5T4BCFBUY=','2026-11-11 03:57:57.700970',0,'diego','','','ar0026162@gmail.com',0,1,'2026-11-11 03:56:44.672465'),(14,'pbkdf2_sha256$1000000$5OGallgZCqtOJHfjmZZWhP$ZHweq5kKICC8Utyn4izTkkzM4246gQ31DS9wtYhQp14=','2026-11-14 19:52:48.049930',0,'guia1','Carlos','','guia1@ecoparque.cl',0,1,'2026-11-11 14:49:36.643850'),(15,'pbkdf2_sha256$1000000$q25V60vZ0f6P1WCOlscScC$UpqSGNkIIMqPN7XW8SkvpCaLkEJFRVWTLkYeLXjLVvE=','2026-11-12 00:39:52.440630',0,'guia2','Sofía','','guia2@ecoparque.cl',0,1,'2026-11-11 14:49:37.469342'),(16,'pbkdf2_sha256$1000000$JJlfhQdtjckc2BUnlEk9wp$JiubJVu9/hySLnfidqPkfDNJ2aq+ErJB4R621gsVlyE=','2026-11-14 17:53:09.690646',0,'turista1','Mateo','','turista1@gmail.com',0,1,'2026-11-11 14:49:38.325473'),(17,'pbkdf2_sha256$1000000$UIT4rfe3FrcRyGffIw1770$jpMnt7WT8kiG5pj1tbSoLPN3KbH21IHi8LjZ346ziOY=','2026-11-14 17:50:56.618325',0,'turista2','Valentina','','turista2@gmail.com',0,1,'2026-11-11 14:49:39.148086');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuentas_perfil`
--

DROP TABLE IF EXISTS `cuentas_perfil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuentas_perfil` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `rol` varchar(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `cuentas_perfil_user_id_38159a56_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuentas_perfil`
--

LOCK TABLES `cuentas_perfil` WRITE;
/*!40000 ALTER TABLE `cuentas_perfil` DISABLE KEYS */;
INSERT INTO `cuentas_perfil` VALUES (6,'GUIA',14),(7,'GUIA',15),(8,'Cliente',16),(9,'Cliente',17),(14,'ADMIN',2);
/*!40000 ALTER TABLE `cuentas_perfil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2026-11-11 03:22:58.198019','1','Cristobal - Administrador',1,'[{\"added\": {}}]',7,2),(2,'2026-11-11 15:13:40.453127','14','Cristobal - ADMIN',1,'[{\"added\": {}}]',7,2);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(7,'cuentas','perfil'),(8,'experiencias','categoria'),(9,'experiencias','experiencia'),(10,'experiencias','inscripcion'),(11,'experiencias','reserva'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2026-11-11 02:45:22.857836'),(2,'auth','0001_initial','2026-11-11 02:45:23.172869'),(3,'admin','0001_initial','2026-11-11 02:45:23.256837'),(4,'admin','0002_logentry_remove_auto_add','2026-11-11 02:45:23.271842'),(5,'admin','0003_logentry_add_action_flag_choices','2026-11-11 02:45:23.288848'),(6,'contenttypes','0002_remove_content_type_name','2026-11-11 02:45:23.359850'),(7,'auth','0002_alter_permission_name_max_length','2026-11-11 02:45:23.398837'),(8,'auth','0003_alter_user_email_max_length','2026-11-11 02:45:23.419841'),(9,'auth','0004_alter_user_username_opts','2026-11-11 02:45:23.431854'),(10,'auth','0005_alter_user_last_login_null','2026-11-11 02:45:23.464841'),(11,'auth','0006_require_contenttypes_0002','2026-11-11 02:45:23.467849'),(12,'auth','0007_alter_validators_add_error_messages','2026-11-11 02:45:23.480848'),(13,'auth','0008_alter_user_username_max_length','2026-11-11 02:45:23.511842'),(14,'auth','0009_alter_user_last_name_max_length','2026-11-11 02:45:23.543834'),(15,'auth','0010_alter_group_name_max_length','2026-11-11 02:45:23.575846'),(16,'auth','0011_update_proxy_permissions','2026-11-11 02:45:23.595847'),(17,'auth','0012_alter_user_first_name_max_length','2026-11-11 02:45:23.629840'),(18,'cuentas','0001_initial','2026-11-11 02:45:23.681839'),(19,'experiencias','0001_initial','2026-11-11 02:45:23.824835'),(20,'sessions','0001_initial','2026-11-11 02:45:23.849834'),(21,'cuentas','0002_remove_perfil_telefono_alter_perfil_rol_and_more','2026-11-11 14:27:48.883715'),(22,'experiencias','0002_remove_categoria_descripcion_experiencia_activo_and_more','2026-11-11 14:27:49.242780');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('fmsb4rouevjf4r1mp2fivsnfrkudu5e9','.eJxVjDkOwjAURO_iGlneF0r6nMH6tr9xANlSnFSIu5NIKaCZYt6beZMA21rDNnAJcyZXIsjlt4uQntgOkB_Q7p2m3tZljvRQ6EkHnXrG1-10_w4qjLqvowXlnQQJJRnvEvIYOU9Ks5yUtVIUa5D7Yh16x7TVWXCmcQ_jhFaKfL7hojbt:1xSJpC:79UmC-RZ_YvzHSOZSNPC8SxPIzFY7pPPSW5XYDJ_HCo','2026-11-28 19:54:10.870036');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `experiencias_categoria`
--

DROP TABLE IF EXISTS `experiencias_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `experiencias_categoria` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `activo` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `experiencias_categoria`
--

LOCK TABLES `experiencias_categoria` WRITE;
/*!40000 ALTER TABLE `experiencias_categoria` DISABLE KEYS */;
INSERT INTO `experiencias_categoria` VALUES (3,'Aventura Extrema',1),(4,'Naturaleza y Trekking',1);
/*!40000 ALTER TABLE `experiencias_categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `experiencias_experiencia`
--

DROP TABLE IF EXISTS `experiencias_experiencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `experiencias_experiencia` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(200) NOT NULL,
  `descripcion` longtext NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `cupo_maximo` int(10) unsigned NOT NULL CHECK (`cupo_maximo` >= 0),
  `fecha_hora` datetime(6) DEFAULT NULL,
  `categoria_id` bigint(20) NOT NULL,
  `creador_id` int(11) DEFAULT NULL,
  `activo` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `experiencias_experie_categoria_id_b03f452f_fk_experienc` (`categoria_id`),
  KEY `experiencias_experiencia_creador_id_70b19025_fk_auth_user_id` (`creador_id`),
  CONSTRAINT `experiencias_experie_categoria_id_b03f452f_fk_experienc` FOREIGN KEY (`categoria_id`) REFERENCES `experiencias_categoria` (`id`),
  CONSTRAINT `experiencias_experiencia_creador_id_70b19025_fk_auth_user_id` FOREIGN KEY (`creador_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `experiencias_experiencia`
--

LOCK TABLES `experiencias_experiencia` WRITE;
/*!40000 ALTER TABLE `experiencias_experiencia` DISABLE KEYS */;
INSERT INTO `experiencias_experiencia` VALUES (9,'Exp Guía 1 - #1','Descripción de prueba',16000.00,1,'2026-11-14 19:52:00.000000',3,14,0),(10,'Exp Guía 1 - #2','Descripción de prueba',17000.00,10,'2026-11-13 14:49:37.458337',3,14,1),(11,'Exp Guía 1 - #3','Descripción de prueba',18000.00,10,'2026-11-14 14:49:37.459340',3,14,1),(12,'Exp Guía 1 - #4','Descripción de prueba',19000.00,10,'2026-11-15 14:49:37.463340',3,14,1),(13,'Exp Guía 2 - #1','Descripción de prueba',19000.00,10,'2026-11-12 14:49:38.314475',4,15,1),(14,'Exp Guía 2 - #2','Descripción de prueba',20000.00,10,'2026-11-13 14:49:38.316474',4,15,1),(15,'Exp Guía 2 - #3','Descripción de prueba',21000.00,10,'2026-11-14 14:49:38.318474',4,15,1),(16,'Exp Guía 2 - #4','Descripción de prueba',22000.00,10,'2026-11-15 14:49:38.319481',4,15,1),(18,'Prueba experiencia','dsdwd',122222.00,1,'2026-11-12 01:58:00.000000',3,2,1);
/*!40000 ALTER TABLE `experiencias_experiencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `experiencias_reserva`
--

DROP TABLE IF EXISTS `experiencias_reserva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `experiencias_reserva` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `fecha_reserva` datetime(6) NOT NULL,
  `experiencia_id` bigint(20) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `experiencias_reserva_experiencia_id_ca702f09_fk_experienc` (`experiencia_id`),
  KEY `experiencias_reserva_usuario_id_8724df18_fk_auth_user_id` (`usuario_id`),
  CONSTRAINT `experiencias_reserva_experiencia_id_ca702f09_fk_experienc` FOREIGN KEY (`experiencia_id`) REFERENCES `experiencias_experiencia` (`id`),
  CONSTRAINT `experiencias_reserva_usuario_id_8724df18_fk_auth_user_id` FOREIGN KEY (`usuario_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `experiencias_reserva`
--

LOCK TABLES `experiencias_reserva` WRITE;
/*!40000 ALTER TABLE `experiencias_reserva` DISABLE KEYS */;
INSERT INTO `experiencias_reserva` VALUES (1,'2026-11-11 14:49:39.137086',9,16),(2,'2026-11-11 14:49:39.139083',10,16),(3,'2026-11-11 14:49:39.142085',11,16),(4,'2026-11-11 14:49:39.973590',12,17),(5,'2026-11-11 14:49:39.975589',13,17),(6,'2026-11-11 14:49:39.977592',14,17),(7,'2026-11-11 14:53:34.060785',13,16),(8,'2026-11-11 15:01:05.064230',9,14),(9,'2026-11-11 15:12:40.125414',16,16),(13,'2026-11-12 01:58:27.164693',18,16);
/*!40000 ALTER TABLE `experiencias_reserva` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'aventurabd'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-11-14 17:01:49
