CREATE DATABASE  IF NOT EXISTS `tacos` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `tacos`;
-- MariaDB dump 10.19  Distrib 10.4.24-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: tacos
-- ------------------------------------------------------
-- Server version	10.4.24-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorias` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'Pastor','pastor','2022-05-13 04:53:07','2022-05-13 04:53:07'),(2,'Suadero','suadero','2022-05-13 04:53:07','2022-05-13 04:53:07'),(3,'Bistec','bistec','2022-05-13 04:53:07','2022-05-13 04:53:07'),(4,'Cabeza','cabeza','2022-05-13 04:53:07','2022-05-13 04:53:07'),(5,'Carnitas','carnitas','2022-05-13 04:53:07','2022-05-13 04:53:07'),(6,'Lengua','lengua','2022-05-13 04:53:07','2022-05-13 04:53:07'),(7,'Arrachera','arrachera','2022-05-13 04:53:07','2022-05-13 04:53:07');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `establecimientos`
--

DROP TABLE IF EXISTS `establecimientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `establecimientos` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `categoria_id` bigint(20) unsigned NOT NULL,
  `imagen_principal` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `direccion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `colonia` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lng` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefono` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `apertura` time NOT NULL,
  `cierre` time NOT NULL,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `establecimientos_categoria_id_foreign` (`categoria_id`),
  KEY `establecimientos_user_id_foreign` (`user_id`),
  CONSTRAINT `establecimientos_categoria_id_foreign` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`) ON DELETE CASCADE,
  CONSTRAINT `establecimientos_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `establecimientos`
--

LOCK TABLES `establecimientos` WRITE;
/*!40000 ALTER TABLE `establecimientos` DISABLE KEYS */;
INSERT INTO `establecimientos` VALUES (1,'Taqueria Mi lupita',1,'principales/DTAVUq4IP9kfy0VVeA1pc5tpA6X6xuVTSekNXf6s.jpg','Avenida Cofradía San Miguel 29D','Fracc Cofradía de San Miguel','19.68720999531783','-99.23430999705303','5524917408','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas diam lacus, auctor id velit sit amet, convallis congue urna. Vestibulum commodo, velit sit amet blandit tincidunt, quam est tempor purus, ut condimentum purus urna quis nisi. Vestibulum vestibulum non purus et auctor. Cras elit elit, commodo consequat pretium sit amet, blandit ut purus. Nunc venenatis lacus facilisis tincidunt pretium. Curabitur ac maximus tellus. Aliquam tempus nulla justo, malesuada placerat purus molestie sed. Mauris malesuada tempor faucibus. Phasellus elementum lacinia orci, ac consequat nisl vulputate sit amet. Vestibulum massa tellus, iaculis sit amet neque in, suscipit aliquam elit. Cras commodo congue quam, imperdiet fringilla massa tempor vitae. Proin egestas cursus tempus.\r\n\r\nDuis eget felis cursus, egestas magna quis, lobortis lectus. Duis at commodo ex. Aenean nec nisl condimentum, fringilla nisi eget, finibus orci. Duis facilisis neque vulputate urna rhoncus, non malesuada nisi volutpat. Cras blandit id nunc sit amet ullamcorper. Curabitur eget rutrum neque, non gravida tortor. Nulla molestie tempus hendrerit. Curabitur malesuada neque a vehicula lacinia. Nunc ut arcu sagittis, facilisis mauris ac, finibus purus. Vivamus posuere ante ut justo scelerisque dignissim. Integer consectetur libero vel enim malesuada malesuada.','06:59:00','18:59:00','8d9d96b7-c253-43a3-b48f-1d8b7f6d1bd0',5,'2022-05-13 05:00:14','2022-05-13 05:00:14'),(2,'Taqueria Don Juan',1,'principales/6QPxZ1CdxsSSXCrTjDq4YmUXbpiCeFoWQHggmiS8.jpg','Avenida Huehuetoca','Axotlán','19.688238332396942','-99.22506365308593','525588718060','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas diam lacus, auctor id velit sit amet, convallis congue urna. Vestibulum commodo, velit sit amet blandit tincidunt, quam est tempor purus, ut condimentum purus urna quis nisi. Vestibulum vestibulum non purus et auctor. Cras elit elit, commodo consequat pretium sit amet, blandit ut purus. Nunc venenatis lacus facilisis tincidunt pretium. Curabitur ac maximus tellus. Aliquam tempus nulla justo, malesuada placerat purus molestie sed. Mauris malesuada tempor faucibus. Phasellus elementum lacinia orci, ac consequat nisl vulputate sit amet. Vestibulum massa tellus, iaculis sit amet neque in, suscipit aliquam elit. Cras commodo congue quam, imperdiet fringilla massa tempor vitae. Proin egestas cursus tempus.\r\n\r\nDuis eget felis cursus, egestas magna quis, lobortis lectus. Duis at commodo ex. Aenean nec nisl condimentum, fringilla nisi eget, finibus orci. Duis facilisis neque vulputate urna rhoncus, non malesuada nisi volutpat. Cras blandit id nunc sit amet ullamcorper. Curabitur eget rutrum neque, non gravida tortor. Nulla molestie tempus hendrerit. Curabitur malesuada neque a vehicula lacinia. Nunc ut arcu sagittis, facilisis mauris ac, finibus purus. Vivamus posuere ante ut justo scelerisque dignissim. Integer consectetur libero vel enim malesuada malesuada.','07:01:00','19:01:00','09e49733-92ec-42aa-909d-9f77e61de9ad',6,'2022-05-13 05:01:31','2022-05-13 05:01:31'),(3,'Taqueria el Fogon 2',2,'principales/Wb1Vp8rwFyfrpnzlgvHAeD023bkm24o4fAeH4AsZ.jpg','Autopista México-Querétaro','Fracc Jardines de la Hacienda Sur','19.68259745743457','-99.20228462199373','525588718060','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas diam lacus, auctor id velit sit amet, convallis congue urna. Vestibulum commodo, velit sit amet blandit tincidunt, quam est tempor purus, ut condimentum purus urna quis nisi. Vestibulum vestibulum non purus et auctor. Cras elit elit, commodo consequat pretium sit amet, blandit ut purus. Nunc venenatis lacus facilisis tincidunt pretium. Curabitur ac maximus tellus. Aliquam tempus nulla justo, malesuada placerat purus molestie sed. Mauris malesuada tempor faucibus. Phasellus elementum lacinia orci, ac consequat nisl vulputate sit amet. Vestibulum massa tellus, iaculis sit amet neque in, suscipit aliquam elit. Cras commodo congue quam, imperdiet fringilla massa tempor vitae. Proin egestas cursus tempus.\r\n\r\nDuis eget felis cursus, egestas magna quis, lobortis lectus. Duis at commodo ex. Aenean nec nisl condimentum, fringilla nisi eget, finibus orci. Duis facilisis neque vulputate urna rhoncus, non malesuada nisi volutpat. Cras blandit id nunc sit amet ullamcorper. Curabitur eget rutrum neque, non gravida tortor. Nulla molestie tempus hendrerit. Curabitur malesuada neque a vehicula lacinia. Nunc ut arcu sagittis, facilisis mauris ac, finibus purus. Vivamus posuere ante ut justo scelerisque dignissim. Integer consectetur libero vel enim malesuada malesuada.','07:05:00','19:05:00','6b5c22eb-4088-4b61-8e19-7909b0905087',7,'2022-05-13 05:05:13','2022-05-13 05:28:04'),(4,'Taqueria Don Remi',2,'principales/MMI86JtWYPBFeMobnIkWz2NayGbKNpoLfIkt9rZO.jpg','Circuito Rinconada San Miguel','Fracc Rinconada San Miguel','19.664013424807067','-99.22648417249536','525588718060','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas diam lacus, auctor id velit sit amet, convallis congue urna. Vestibulum commodo, velit sit amet blandit tincidunt, quam est tempor purus, ut condimentum purus urna quis nisi. Vestibulum vestibulum non purus et auctor. Cras elit elit, commodo consequat pretium sit amet, blandit ut purus. Nunc venenatis lacus facilisis tincidunt pretium. Curabitur ac maximus tellus. Aliquam tempus nulla justo, malesuada placerat purus molestie sed. Mauris malesuada tempor faucibus. Phasellus elementum lacinia orci, ac consequat nisl vulputate sit amet. Vestibulum massa tellus, iaculis sit amet neque in, suscipit aliquam elit. Cras commodo congue quam, imperdiet fringilla massa tempor vitae. Proin egestas cursus tempus.\r\n\r\nDuis eget felis cursus, egestas magna quis, lobortis lectus. Duis at commodo ex. Aenean nec nisl condimentum, fringilla nisi eget, finibus orci. Duis facilisis neque vulputate urna rhoncus, non malesuada nisi volutpat. Cras blandit id nunc sit amet ullamcorper. Curabitur eget rutrum neque, non gravida tortor. Nulla molestie tempus hendrerit. Curabitur malesuada neque a vehicula lacinia. Nunc ut arcu sagittis, facilisis mauris ac, finibus purus. Vivamus posuere ante ut justo scelerisque dignissim. Integer consectetur libero vel enim malesuada malesuada.','07:34:00','19:34:00','ccc6afc2-1b71-43e5-9a9e-96832c02324a',8,'2022-05-13 05:35:49','2022-05-13 05:36:47'),(5,'Don Adolfo tacos',3,'principales/QLey3JEmfH4zsIGBehdQq3TPo9I7mEp15TvO92CT.jpg','Calle Pelícanos','Fraccionamiento Lago de Guadalupe','19.628959965959446','-99.24690521917188','525588718060','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas diam lacus, auctor id velit sit amet, convallis congue urna. Vestibulum commodo, velit sit amet blandit tincidunt, quam est tempor purus, ut condimentum purus urna quis nisi. Vestibulum vestibulum non purus et auctor. Cras elit elit, commodo consequat pretium sit amet, blandit ut purus. Nunc venenatis lacus facilisis tincidunt pretium. Curabitur ac maximus tellus. Aliquam tempus nulla justo, malesuada placerat purus molestie sed. Mauris malesuada tempor faucibus. Phasellus elementum lacinia orci, ac consequat nisl vulputate sit amet. Vestibulum massa tellus, iaculis sit amet neque in, suscipit aliquam elit. Cras commodo congue quam, imperdiet fringilla massa tempor vitae. Proin egestas cursus tempus.\r\n\r\nDuis eget felis cursus, egestas magna quis, lobortis lectus. Duis at commodo ex. Aenean nec nisl condimentum, fringilla nisi eget, finibus orci. Duis facilisis neque vulputate urna rhoncus, non malesuada nisi volutpat. Cras blandit id nunc sit amet ullamcorper. Curabitur eget rutrum neque, non gravida tortor. Nulla molestie tempus hendrerit. Curabitur malesuada neque a vehicula lacinia. Nunc ut arcu sagittis, facilisis mauris ac, finibus purus. Vivamus posuere ante ut justo scelerisque dignissim. Integer consectetur libero vel enim malesuada malesuada.','07:44:00','19:44:00','96dd3ab5-3a09-40a4-b8d5-89cbb9766ec8',9,'2022-05-13 05:44:41','2022-05-13 05:44:41'),(6,'Taqueria el arca',3,'principales/GvMZolRChUBLwWKlRr6Pob2xahI6YmH8F6OuIP11.jpg','Centenario 4','San Antonio','19.693010020858154','-99.14493996610163','+525588718060','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas diam lacus, auctor id velit sit amet, convallis congue urna. Vestibulum commodo, velit sit amet blandit tincidunt, quam est tempor purus, ut condimentum purus urna quis nisi. Vestibulum vestibulum non purus et auctor. Cras elit elit, commodo consequat pretium sit amet, blandit ut purus. Nunc venenatis lacus facilisis tincidunt pretium. Curabitur ac maximus tellus. Aliquam tempus nulla justo, malesuada placerat purus molestie sed. Mauris malesuada tempor faucibus. Phasellus elementum lacinia orci, ac consequat nisl vulputate sit amet. Vestibulum massa tellus, iaculis sit amet neque in, suscipit aliquam elit. Cras commodo congue quam, imperdiet fringilla massa tempor vitae. Proin egestas cursus tempus.\r\n\r\nDuis eget felis cursus, egestas magna quis, lobortis lectus. Duis at commodo ex. Aenean nec nisl condimentum, fringilla nisi eget, finibus orci. Duis facilisis neque vulputate urna rhoncus, non malesuada nisi volutpat. Cras blandit id nunc sit amet ullamcorper. Curabitur eget rutrum neque, non gravida tortor. Nulla molestie tempus hendrerit. Curabitur malesuada neque a vehicula lacinia. Nunc ut arcu sagittis, facilisis mauris ac, finibus purus. Vivamus posuere ante ut justo scelerisque dignissim. Integer consectetur libero vel enim malesuada malesuada.','07:53:00','19:53:00','43d06c55-964b-4696-97f4-1d8ebea09291',10,'2022-05-13 05:53:12','2022-05-13 05:53:12'),(7,'Tacos el Méxicano',4,'principales/UG8E0FzuG7WyBqpW9rwRmEqFUFWHoqGiPcfj1Zny.jpg','Calle El Milagro 45','San Mateo Xoloc','19.701209994825163','-99.2591900002487','525588718060','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas diam lacus, auctor id velit sit amet, convallis congue urna. Vestibulum commodo, velit sit amet blandit tincidunt, quam est tempor purus, ut condimentum purus urna quis nisi. Vestibulum vestibulum non purus et auctor. Cras elit elit, commodo consequat pretium sit amet, blandit ut purus. Nunc venenatis lacus facilisis tincidunt pretium. Curabitur ac maximus tellus. Aliquam tempus nulla justo, malesuada placerat purus molestie sed. Mauris malesuada tempor faucibus. Phasellus elementum lacinia orci, ac consequat nisl vulputate sit amet. Vestibulum massa tellus, iaculis sit amet neque in, suscipit aliquam elit. Cras commodo congue quam, imperdiet fringilla massa tempor vitae. Proin egestas cursus tempus.\r\n\r\nDuis eget felis cursus, egestas magna quis, lobortis lectus. Duis at commodo ex. Aenean nec nisl condimentum, fringilla nisi eget, finibus orci. Duis facilisis neque vulputate urna rhoncus, non malesuada nisi volutpat. Cras blandit id nunc sit amet ullamcorper. Curabitur eget rutrum neque, non gravida tortor. Nulla molestie tempus hendrerit. Curabitur malesuada neque a vehicula lacinia. Nunc ut arcu sagittis, facilisis mauris ac, finibus purus. Vivamus posuere ante ut justo scelerisque dignissim. Integer consectetur libero vel enim malesuada malesuada.','08:02:00','20:02:00','78248aad-aa41-4d98-acd2-bc25a9d66d4d',11,'2022-05-13 06:02:54','2022-05-13 06:02:54'),(8,'Taqueria el paso',4,'principales/ocNFCrHrcqwiTR9zC7BxrqfsHFHNlhWqFpIsa40P.jpg','Avenida del Pedregal','Fracc Cofradía San Miguel II','19.684200000000033','-99.22849999999994','525588718060','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas diam lacus, auctor id velit sit amet, convallis congue urna. Vestibulum commodo, velit sit amet blandit tincidunt, quam est tempor purus, ut condimentum purus urna quis nisi. Vestibulum vestibulum non purus et auctor. Cras elit elit, commodo consequat pretium sit amet, blandit ut purus. Nunc venenatis lacus facilisis tincidunt pretium. Curabitur ac maximus tellus. Aliquam tempus nulla justo, malesuada placerat purus molestie sed. Mauris malesuada tempor faucibus. Phasellus elementum lacinia orci, ac consequat nisl vulputate sit amet. Vestibulum massa tellus, iaculis sit amet neque in, suscipit aliquam elit. Cras commodo congue quam, imperdiet fringilla massa tempor vitae. Proin egestas cursus tempus.\r\n\r\nDuis eget felis cursus, egestas magna quis, lobortis lectus. Duis at commodo ex. Aenean nec nisl condimentum, fringilla nisi eget, finibus orci. Duis facilisis neque vulputate urna rhoncus, non malesuada nisi volutpat. Cras blandit id nunc sit amet ullamcorper. Curabitur eget rutrum neque, non gravida tortor. Nulla molestie tempus hendrerit. Curabitur malesuada neque a vehicula lacinia. Nunc ut arcu sagittis, facilisis mauris ac, finibus purus. Vivamus posuere ante ut justo scelerisque dignissim. Integer consectetur libero vel enim malesuada malesuada.','08:04:00','20:04:00','fa9491dc-f831-4575-9a85-588b9f282bc7',12,'2022-05-13 06:04:45','2022-05-13 06:04:45'),(9,'Taqueria la modelo Bosques',5,'principales/Imi3fZ5cWXBlmth22qXc041ePPWX0QMFaK9Ie9IW.jpg','Privada Residencial Las Palomas','Fraccionamiento Lago de Guadalupe','19.633380030111127','-99.24735994974493','525588718060','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas diam lacus, auctor id velit sit amet, convallis congue urna. Vestibulum commodo, velit sit amet blandit tincidunt, quam est tempor purus, ut condimentum purus urna quis nisi. Vestibulum vestibulum non purus et auctor. Cras elit elit, commodo consequat pretium sit amet, blandit ut purus. Nunc venenatis lacus facilisis tincidunt pretium. Curabitur ac maximus tellus. Aliquam tempus nulla justo, malesuada placerat purus molestie sed. Mauris malesuada tempor faucibus. Phasellus elementum lacinia orci, ac consequat nisl vulputate sit amet. Vestibulum massa tellus, iaculis sit amet neque in, suscipit aliquam elit. Cras commodo congue quam, imperdiet fringilla massa tempor vitae. Proin egestas cursus tempus.\r\n\r\nDuis eget felis cursus, egestas magna quis, lobortis lectus. Duis at commodo ex. Aenean nec nisl condimentum, fringilla nisi eget, finibus orci. Duis facilisis neque vulputate urna rhoncus, non malesuada nisi volutpat. Cras blandit id nunc sit amet ullamcorper. Curabitur eget rutrum neque, non gravida tortor. Nulla molestie tempus hendrerit. Curabitur malesuada neque a vehicula lacinia. Nunc ut arcu sagittis, facilisis mauris ac, finibus purus. Vivamus posuere ante ut justo scelerisque dignissim. Integer consectetur libero vel enim malesuada malesuada.','08:08:00','20:08:00','13bb7494-5bac-48d4-b398-e65949aa6880',13,'2022-05-13 06:08:59','2022-05-13 06:08:59'),(10,'Taqueria Selene',5,'principales/7NRz5RWuffNILu8gMxWjZCsgeN3bdMH6tqjJKQLD.jpg','Avenida Cafetos','Fracc Jardines de San Miguel','19.693375218409475','-99.21352868821715','525588718060','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas diam lacus, auctor id velit sit amet, convallis congue urna. Vestibulum commodo, velit sit amet blandit tincidunt, quam est tempor purus, ut condimentum purus urna quis nisi. Vestibulum vestibulum non purus et auctor. Cras elit elit, commodo consequat pretium sit amet, blandit ut purus. Nunc venenatis lacus facilisis tincidunt pretium. Curabitur ac maximus tellus. Aliquam tempus nulla justo, malesuada placerat purus molestie sed. Mauris malesuada tempor faucibus. Phasellus elementum lacinia orci, ac consequat nisl vulputate sit amet. Vestibulum massa tellus, iaculis sit amet neque in, suscipit aliquam elit. Cras commodo congue quam, imperdiet fringilla massa tempor vitae. Proin egestas cursus tempus.\r\n\r\nDuis eget felis cursus, egestas magna quis, lobortis lectus. Duis at commodo ex. Aenean nec nisl condimentum, fringilla nisi eget, finibus orci. Duis facilisis neque vulputate urna rhoncus, non malesuada nisi volutpat. Cras blandit id nunc sit amet ullamcorper. Curabitur eget rutrum neque, non gravida tortor. Nulla molestie tempus hendrerit. Curabitur malesuada neque a vehicula lacinia. Nunc ut arcu sagittis, facilisis mauris ac, finibus purus. Vivamus posuere ante ut justo scelerisque dignissim. Integer consectetur libero vel enim malesuada malesuada.','08:12:00','20:12:00','96fc8475-43b2-425a-b206-081f868064ee',14,'2022-05-13 06:12:32','2022-05-13 06:12:32'),(11,'El arandas taqueria',6,'principales/eJXVxWOxFHixSgYqlvfOXtixmB1Hga6KCqztT41E.jpg','Calle Río Papaloapan 18','Fraccionamiento Colinas del Lago','19.64059001749409','-99.22702000440425','525588718060','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas diam lacus, auctor id velit sit amet, convallis congue urna. Vestibulum commodo, velit sit amet blandit tincidunt, quam est tempor purus, ut condimentum purus urna quis nisi. Vestibulum vestibulum non purus et auctor. Cras elit elit, commodo consequat pretium sit amet, blandit ut purus. Nunc venenatis lacus facilisis tincidunt pretium. Curabitur ac maximus tellus. Aliquam tempus nulla justo, malesuada placerat purus molestie sed. Mauris malesuada tempor faucibus. Phasellus elementum lacinia orci, ac consequat nisl vulputate sit amet. Vestibulum massa tellus, iaculis sit amet neque in, suscipit aliquam elit. Cras commodo congue quam, imperdiet fringilla massa tempor vitae. Proin egestas cursus tempus.\r\n\r\nDuis eget felis cursus, egestas magna quis, lobortis lectus. Duis at commodo ex. Aenean nec nisl condimentum, fringilla nisi eget, finibus orci. Duis facilisis neque vulputate urna rhoncus, non malesuada nisi volutpat. Cras blandit id nunc sit amet ullamcorper. Curabitur eget rutrum neque, non gravida tortor. Nulla molestie tempus hendrerit. Curabitur malesuada neque a vehicula lacinia. Nunc ut arcu sagittis, facilisis mauris ac, finibus purus. Vivamus posuere ante ut justo scelerisque dignissim. Integer consectetur libero vel enim malesuada malesuada.','08:15:00','20:15:00','6489fb3a-41ed-465b-931d-ac3a87c92a42',15,'2022-05-13 06:15:50','2022-05-13 06:15:50'),(12,'Taqueria Avila',6,'principales/EwsxD8WxUmjR5hHQxWjwlIDRDlTwOXXSMOcnq26t.webp','8VA Avenida José Ma Morelos y Pavón 20','Barrio San Antonio El Cuadro','19.685142627279905','-99.12641716861779','525588718060','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas diam lacus, auctor id velit sit amet, convallis congue urna. Vestibulum commodo, velit sit amet blandit tincidunt, quam est tempor purus, ut condimentum purus urna quis nisi. Vestibulum vestibulum non purus et auctor. Cras elit elit, commodo consequat pretium sit amet, blandit ut purus. Nunc venenatis lacus facilisis tincidunt pretium. Curabitur ac maximus tellus. Aliquam tempus nulla justo, malesuada placerat purus molestie sed. Mauris malesuada tempor faucibus. Phasellus elementum lacinia orci, ac consequat nisl vulputate sit amet. Vestibulum massa tellus, iaculis sit amet neque in, suscipit aliquam elit. Cras commodo congue quam, imperdiet fringilla massa tempor vitae. Proin egestas cursus tempus.\r\n\r\nDuis eget felis cursus, egestas magna quis, lobortis lectus. Duis at commodo ex. Aenean nec nisl condimentum, fringilla nisi eget, finibus orci. Duis facilisis neque vulputate urna rhoncus, non malesuada nisi volutpat. Cras blandit id nunc sit amet ullamcorper. Curabitur eget rutrum neque, non gravida tortor. Nulla molestie tempus hendrerit. Curabitur malesuada neque a vehicula lacinia. Nunc ut arcu sagittis, facilisis mauris ac, finibus purus. Vivamus posuere ante ut justo scelerisque dignissim. Integer consectetur libero vel enim malesuada malesuada.','08:19:00','20:19:00','d46e3dbb-900b-48c3-adfd-04cc322425e0',16,'2022-05-13 06:19:21','2022-05-13 06:19:21'),(13,'Taqueria Barrio Taco',7,'principales/hyyHHpKYj7DFhnBRaF69eIRDViPJTGgztbmbUVfv.jpg','Calle Hacienda La Floresta 89','Fracc Jardines de la Hacienda Sur','19.68400001976825','-99.20830002949029','525588718060','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas diam lacus, auctor id velit sit amet, convallis congue urna. Vestibulum commodo, velit sit amet blandit tincidunt, quam est tempor purus, ut condimentum purus urna quis nisi. Vestibulum vestibulum non purus et auctor. Cras elit elit, commodo consequat pretium sit amet, blandit ut purus. Nunc venenatis lacus facilisis tincidunt pretium. Curabitur ac maximus tellus. Aliquam tempus nulla justo, malesuada placerat purus molestie sed. Mauris malesuada tempor faucibus. Phasellus elementum lacinia orci, ac consequat nisl vulputate sit amet. Vestibulum massa tellus, iaculis sit amet neque in, suscipit aliquam elit. Cras commodo congue quam, imperdiet fringilla massa tempor vitae. Proin egestas cursus tempus.\r\n\r\nDuis eget felis cursus, egestas magna quis, lobortis lectus. Duis at commodo ex. Aenean nec nisl condimentum, fringilla nisi eget, finibus orci. Duis facilisis neque vulputate urna rhoncus, non malesuada nisi volutpat. Cras blandit id nunc sit amet ullamcorper. Curabitur eget rutrum neque, non gravida tortor. Nulla molestie tempus hendrerit. Curabitur malesuada neque a vehicula lacinia. Nunc ut arcu sagittis, facilisis mauris ac, finibus purus. Vivamus posuere ante ut justo scelerisque dignissim. Integer consectetur libero vel enim malesuada malesuada.','08:24:00','20:24:00','2532191e-e6e9-4656-862a-95f970690b07',17,'2022-05-13 06:24:39','2022-05-13 06:24:39'),(14,'Taqueria El jefe',7,'principales/SDbfMeOIkt9ZrfismbGbge8KeaiUkmqcE72BhTBg.jpg','Calle Caoba 128','Fracc Ex-Hacienda de San Miguel','19.691334399122333','-99.20909147756365','525588718060','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas diam lacus, auctor id velit sit amet, convallis congue urna. Vestibulum commodo, velit sit amet blandit tincidunt, quam est tempor purus, ut condimentum purus urna quis nisi. Vestibulum vestibulum non purus et auctor. Cras elit elit, commodo consequat pretium sit amet, blandit ut purus. Nunc venenatis lacus facilisis tincidunt pretium. Curabitur ac maximus tellus. Aliquam tempus nulla justo, malesuada placerat purus molestie sed. Mauris malesuada tempor faucibus. Phasellus elementum lacinia orci, ac consequat nisl vulputate sit amet. Vestibulum massa tellus, iaculis sit amet neque in, suscipit aliquam elit. Cras commodo congue quam, imperdiet fringilla massa tempor vitae. Proin egestas cursus tempus.\r\n\r\nDuis eget felis cursus, egestas magna quis, lobortis lectus. Duis at commodo ex. Aenean nec nisl condimentum, fringilla nisi eget, finibus orci. Duis facilisis neque vulputate urna rhoncus, non malesuada nisi volutpat. Cras blandit id nunc sit amet ullamcorper. Curabitur eget rutrum neque, non gravida tortor. Nulla molestie tempus hendrerit. Curabitur malesuada neque a vehicula lacinia. Nunc ut arcu sagittis, facilisis mauris ac, finibus purus. Vivamus posuere ante ut justo scelerisque dignissim. Integer consectetur libero vel enim malesuada malesuada.','08:25:00','20:25:00','507d1e56-c9ef-461c-b750-0b86ac1705b1',18,'2022-05-13 06:25:37','2022-05-13 06:25:37');
/*!40000 ALTER TABLE `establecimientos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imagens`
--

DROP TABLE IF EXISTS `imagens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imagens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_establecimiento` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ruta_imagen` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imagens`
--

LOCK TABLES `imagens` WRITE;
/*!40000 ALTER TABLE `imagens` DISABLE KEYS */;
INSERT INTO `imagens` VALUES (1,'75b99dec-fdfa-4c48-9750-0cebe0242bbf','puestos/DGzE5wr7snpj86tUVt9LzIlEreQub5OGIRBeVgGw.jpg','2022-05-13 04:59:09','2022-05-13 04:59:09'),(2,'75b99dec-fdfa-4c48-9750-0cebe0242bbf','puestos/iXLvuSGPflDJQdYblqgi8fNkMDe374l490qcu2uO.jpg','2022-05-13 04:59:10','2022-05-13 04:59:10'),(3,'75b99dec-fdfa-4c48-9750-0cebe0242bbf','puestos/MUfv6aglOKYffmuYvYC8TMFvHkFd7Eg3Ex7hUgY7.jpg','2022-05-13 04:59:12','2022-05-13 04:59:12'),(4,'80268e16-db4c-447d-b475-ceada64ca7b5','puestos/EKQCWPsimBBj7ycMOHStPMXdEkQbTK0E9ZtglLP6.jpg','2022-05-13 04:59:44','2022-05-13 04:59:44'),(5,'80268e16-db4c-447d-b475-ceada64ca7b5','puestos/KnFzmyTAYE8SNzvz1tUwIjgvhhYh9kL04bHMQZvZ.jpg','2022-05-13 04:59:45','2022-05-13 04:59:45'),(6,'80268e16-db4c-447d-b475-ceada64ca7b5','puestos/kuSkEvNHaoKUllWnMzcPXcN6BUqI9Jzn2YaOzejg.jpg','2022-05-13 04:59:46','2022-05-13 04:59:46'),(7,'8d9d96b7-c253-43a3-b48f-1d8b7f6d1bd0','puestos/7bOXNs46808tJWrSWfiaMq6WilJlQcs8BnTKo44a.jpg','2022-05-13 05:00:08','2022-05-13 05:00:08'),(8,'8d9d96b7-c253-43a3-b48f-1d8b7f6d1bd0','puestos/fE3yNwRGO6Rbzci81dMy8eLLjlfwkjKMU7S3OO1z.jpg','2022-05-13 05:00:09','2022-05-13 05:00:09'),(9,'8d9d96b7-c253-43a3-b48f-1d8b7f6d1bd0','puestos/Fe34KYBu6r3y317IodfRUqnRTBuFeJaPBesadq2N.jpg','2022-05-13 05:00:12','2022-05-13 05:00:12'),(10,'09e49733-92ec-42aa-909d-9f77e61de9ad','puestos/n0KCFSEkXFvcSTNrikDzKZhVDWhTqvMwWRCQfRzF.jpg','2022-05-13 05:01:28','2022-05-13 05:01:28'),(18,'6b5c22eb-4088-4b61-8e19-7909b0905087','puestos/qDNltPEn1uCqJFKWSVGOdr1hPgJIXzE6vxKqLK55.jpg','2022-05-13 05:25:22','2022-05-13 05:25:22'),(24,'ccc6afc2-1b71-43e5-9a9e-96832c02324a','puestos/bGcEq9MFNfX9mBcssx2oYBq9BfJF5KWDPZVODUDd.jpg','2022-05-13 05:35:02','2022-05-13 05:35:02'),(25,'ccc6afc2-1b71-43e5-9a9e-96832c02324a','puestos/ehzoAULKkPkZSpsadWLQKX4kw45B1sdCNNHCCFRc.jpg','2022-05-13 05:35:33','2022-05-13 05:35:33'),(26,'ccc6afc2-1b71-43e5-9a9e-96832c02324a','puestos/Asqs4E4glcGrK9lTmd9oFFWrbQ4AUIOFoSlqFQPK.jpg','2022-05-13 05:35:35','2022-05-13 05:35:35'),(27,'96dd3ab5-3a09-40a4-b8d5-89cbb9766ec8','puestos/zKEZlulLZEnYV1G3P1um7e5Vyb7w7wo4wJ3b5TQo.jpg','2022-05-13 05:44:37','2022-05-13 05:44:37'),(28,'96dd3ab5-3a09-40a4-b8d5-89cbb9766ec8','puestos/6S86oBrTjOrFmVExzGM7Mh9empECFQJaKoULnSYo.jpg','2022-05-13 05:44:38','2022-05-13 05:44:38'),(29,'96dd3ab5-3a09-40a4-b8d5-89cbb9766ec8','puestos/25B5agdTvFDDagUiXm1znAD84Dn3SOEpIFejQUVH.jpg','2022-05-13 05:44:39','2022-05-13 05:44:39'),(30,'43d06c55-964b-4696-97f4-1d8ebea09291','puestos/J8EeFDvHASILYXlVU6zHtStXzyPPoUDVQAwRjloJ.jpg','2022-05-13 05:53:10','2022-05-13 05:53:10'),(31,'78248aad-aa41-4d98-acd2-bc25a9d66d4d','puestos/V0nc75Thbk7QFkFRwzctByrd46UXVWGNdtynNBxP.jpg','2022-05-13 06:02:50','2022-05-13 06:02:50'),(32,'78248aad-aa41-4d98-acd2-bc25a9d66d4d','puestos/WYd4GeDTQVgbFuYwTCw7iLqdTzPn4jbJUj5hdtji.jpg','2022-05-13 06:02:51','2022-05-13 06:02:51'),(33,'78248aad-aa41-4d98-acd2-bc25a9d66d4d','puestos/b48DbcXtXWIkjrnX3HyF4pu9YpgXEP1wMzR6bHix.jpg','2022-05-13 06:02:53','2022-05-13 06:02:53'),(34,'e3e9fa4b-4dc8-4922-aa8a-6615dbc71a98','puestos/Bi0TdkAovN0w4GiJhW6mGovjCtCHNPwiiwYqjX0N.jpg','2022-05-13 06:04:23','2022-05-13 06:04:23'),(35,'fa9491dc-f831-4575-9a85-588b9f282bc7','puestos/jXAYworroFzVcNEJtrryeu82O0nDWiHTzAtYzSq0.jpg','2022-05-13 06:04:43','2022-05-13 06:04:43'),(36,'13bb7494-5bac-48d4-b398-e65949aa6880','puestos/UPVc00aKOayc1TmeNqMNGhw0N9Lq8uxwHc1V7F6t.jpg','2022-05-13 06:08:53','2022-05-13 06:08:53'),(37,'13bb7494-5bac-48d4-b398-e65949aa6880','puestos/6r5nZ0RyS2L7nQjrSQMPcrUYR3xkpE9BuxAonoXZ.jpg','2022-05-13 06:08:55','2022-05-13 06:08:55'),(38,'13bb7494-5bac-48d4-b398-e65949aa6880','puestos/bUvOkiFx5Q1ykCdEKoQRJfUBIsMAmjbu3ob0IMFI.jpg','2022-05-13 06:08:58','2022-05-13 06:08:58'),(39,'96fc8475-43b2-425a-b206-081f868064ee','puestos/jw5PBvtbSDYcU4yO1RGDsUeDz3zionUyA0OTPwAO.jpg','2022-05-13 06:12:29','2022-05-13 06:12:29'),(40,'96fc8475-43b2-425a-b206-081f868064ee','puestos/xr3Zci2xXuzWOh79GSfo5xXlYD7zCpp1ZTbTl1mk.jpg','2022-05-13 06:12:30','2022-05-13 06:12:30'),(41,'6489fb3a-41ed-465b-931d-ac3a87c92a42','puestos/GMtbGFAlZBtY8F8sPuycQR4Wm8EKjQvLliokb8Hc.jpg','2022-05-13 06:15:42','2022-05-13 06:15:42'),(42,'6489fb3a-41ed-465b-931d-ac3a87c92a42','puestos/q2M6LUO1AflWOKOr0DI38JGAVQVRugzmybxVuZkZ.jpg','2022-05-13 06:15:44','2022-05-13 06:15:44'),(43,'6489fb3a-41ed-465b-931d-ac3a87c92a42','puestos/RTmxA0QIQGijvtTac7zrX1WiT1nQaFRtezY77HKv.jpg','2022-05-13 06:15:46','2022-05-13 06:15:46'),(44,'6489fb3a-41ed-465b-931d-ac3a87c92a42','puestos/cweKWyqQVYL4ykvLRCEebd0pQTfwOLHJhDS0L5gv.jpg','2022-05-13 06:15:48','2022-05-13 06:15:48'),(45,'2532191e-e6e9-4656-862a-95f970690b07','puestos/vYl6UMQaabY7wbKrUodgSdr2Q8EKJl35ZH5oPT4B.jpg','2022-05-13 06:24:36','2022-05-13 06:24:36'),(46,'2532191e-e6e9-4656-862a-95f970690b07','puestos/aqt0vkYkOIKv5nz2gWVjYhGixRuArAg9Q7fJ7euJ.jpg','2022-05-13 06:24:37','2022-05-13 06:24:37'),(47,'2532191e-e6e9-4656-862a-95f970690b07','puestos/Lotc4KImRXxviW1kqfaGCPe6l9y3ZtoXOlkE4DoQ.jpg','2022-05-13 06:24:38','2022-05-13 06:24:38');
/*!40000 ALTER TABLE `imagens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (7,'2014_10_12_000000_create_users_table',1),(8,'2014_10_12_100000_create_password_resets_table',1),(9,'2019_08_19_000000_create_failed_jobs_table',1),(10,'2019_12_14_000001_create_personal_access_tokens_table',1),(11,'2022_05_10_201510_create_establecimientos_table',1),(12,'2022_05_11_004507_create_imagens_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (5,'Victor','correo@correo.com','2022-05-13 04:53:04','$2y$10$uuVUHStD80CiP3ggmxNN4uSqBKrlEy8bwKw0bJY8DF2ElHfxczC3S',NULL,'2022-05-13 04:53:05','2022-05-13 04:53:05'),(6,'Juan','correo1@correo.com','2022-05-13 04:53:05','$2y$10$tm48y4hSPOSY3IJ61SXj9./qfLemrbYLraqD3rfn4fqFpCwwAAk0y',NULL,'2022-05-13 04:53:05','2022-05-13 04:53:05'),(7,'Juan','correo2@correo.com','2022-05-13 04:53:05','$2y$10$ktJYMRXQvTkqIixNFeKMj.wHvyUhVpI.cSWfLrohYuIWa4H1nM6/q',NULL,'2022-05-13 04:53:05','2022-05-13 04:53:05'),(8,'Ramon','correo3@correo.com','2022-05-13 04:53:05','$2y$10$u21K6Pobo4FRMamNhvwAUuOonkMHR7MivPh0RyPtdELQkN0SBWDBy',NULL,'2022-05-13 04:53:05','2022-05-13 04:53:05'),(9,'Zaira','correo4@correo.com','2022-05-13 04:53:05','$2y$10$pEMJxLhvXtWbL.OM0Fuycejvalm/N3MgHNjtRfQhWNZVT4bZ0axYq',NULL,'2022-05-13 04:53:05','2022-05-13 04:53:05'),(10,'Penny','correo5@correo.com','2022-05-13 04:53:05','$2y$10$IsL33WYeVUCkrejt.SYzxeCw0l1/hX2AyrgjjttGsibInN8Tbqn5a',NULL,'2022-05-13 04:53:05','2022-05-13 04:53:05'),(11,'Ramon','correo6@correo.com','2022-05-13 04:53:05','$2y$10$048b/EyQyIRZY8r5c/8ia.Z7EGWEEIMxmZGeZfyi8QsgYZPyDM1LK',NULL,'2022-05-13 04:53:06','2022-05-13 04:53:06'),(12,'Veronica','correo7@correo.com','2022-05-13 04:53:06','$2y$10$CMIVeOXVRMdfk4RlmlfdEOQcXpcYVHWtuMgAbNnqFyZP8JnbtRRKC',NULL,'2022-05-13 04:53:06','2022-05-13 04:53:06'),(13,'Alfredo','correo8@correo.com','2022-05-13 04:53:06','$2y$10$mjmxE6yMVBctwUx8qj0iK.ZdHF1vhIdSiCGApTATbi3oYNuzveHiC',NULL,'2022-05-13 04:53:06','2022-05-13 04:53:06'),(14,'Manuel','correo9@correo.com','2022-05-13 04:53:06','$2y$10$uagj.a8Apo9/FFgLA1fyj.97qkw91XVTFjFygbnYwmhF2ckbLLXfi',NULL,'2022-05-13 04:53:06','2022-05-13 04:53:06'),(15,'Victor','correo10@correo.com','2022-05-13 04:53:06','$2y$10$mKfUQQcXz3rSzFdvecUiRuzrU7bOFZY7i69fiPHOXGb9X6Ah.teHi',NULL,'2022-05-13 04:53:06','2022-05-13 04:53:06'),(16,'Juan','correo11@correo.com','2022-05-13 04:53:06','$2y$10$XqdnJDEQlIDvK0Iyt.WDKOrZwdt8yb6fkGYsfAj74JyYisRmfjsqq',NULL,'2022-05-13 04:53:06','2022-05-13 04:53:06'),(17,'Fernando','correo12@correo.com','2022-05-13 04:53:06','$2y$10$h1VSZw63dhz1FJRzdRCF1utPmiYLnSePaf9ciBjVu1tRcHAbHo5Z.',NULL,'2022-05-13 04:53:06','2022-05-13 04:53:06'),(18,'Paloma','correo13@correo.com','2022-05-13 04:53:06','$2y$10$Vu0lUK1nSaYe8VXTD.l3/.GKMgWdtUg/mPeK.6VRZP76GZINEjis.',NULL,'2022-05-13 04:53:07','2022-05-13 04:53:07'),(19,'Alicia','correo14@correo.com','2022-05-13 04:53:07','$2y$10$EQWuLc7cHrryxFd9jion2.VnTKK1M5ecx9IybBKg5JPiouEL..Fw.',NULL,'2022-05-13 04:53:07','2022-05-13 04:53:07');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-18 15:54:19
