CREATE DATABASE IF NOT EXISTS exchange_analyzer;
USE exchange_analyzer;
-- MySQL dump 10.13  Distrib 8.0.30, for Linux (x86_64)
--
-- Host: localhost    Database: exchange_analyzer
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `base_currency`
--

DROP TABLE IF EXISTS `base_currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `base_currency` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `iso_4217_code` varchar(3) NOT NULL,
  `area` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `base_currency`
--

LOCK TABLES `base_currency` WRITE;
/*!40000 ALTER TABLE `base_currency` DISABLE KEYS */;
INSERT INTO `base_currency` VALUES (1,'Real','BRL','Brasil'),(2,'Dólar americano','USD','Estados Unidos da América');
/*!40000 ALTER TABLE `base_currency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quotas`
--

DROP TABLE IF EXISTS `quotas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quotas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `datetime` datetime NOT NULL,
  `timezone` varchar(50) NOT NULL,
  `base_currency_id` int NOT NULL,
  `quoted_currency` varchar(50) NOT NULL,
  `iso_4217_code` varchar(3) NOT NULL,
  `quota` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `iso_4217_code_UNIQUE` (`iso_4217_code`),
  KEY `fk_base_currency_id_idx` (`base_currency_id`),
  CONSTRAINT `fk_base_currency_id` FOREIGN KEY (`base_currency_id`) REFERENCES `base_currency` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1280 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quotas`
--

LOCK TABLES `quotas` WRITE;
/*!40000 ALTER TABLE `quotas` DISABLE KEYS */;
INSERT INTO `quotas` VALUES (287,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Real','BRL',1.00),(288,'2022-07-19 22:12:33','America/Sao_Paulo',1,'UAE Dirham','AED',0.68),(289,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Afghani','AFN',16.30),(290,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Lek','ALL',21.51),(291,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Dram armênio','AMD',76.45),(292,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Guilder das Antilhas Holandesas','ANG',0.33),(293,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Kwanza','AOA',79.83),(294,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Peso argentino','ARS',23.80),(295,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Dólar australiano','AUD',0.27),(296,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Florim de Aruba','AWG',0.33),(297,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Manat do Azerbaijão','AZN',0.31),(298,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Marco conversível','BAM',0.35),(299,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Dólar de Barbados','BBD',0.37),(300,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Taka','BDT',17.36),(301,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Lev búlgaro','BGN',0.35),(302,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Dinar do Bahrein','BHD',0.07),(303,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Franco do Burundi','BIF',373.21),(304,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Dólar das Bermudas','BMD',0.18),(305,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Dólares de Brunei','BND',0.26),(306,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Boliviano','BOB',1.27),(307,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Dólar das Bahamas','BSD',0.18),(308,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Ngultrum','BTN',14.76),(309,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Pula','BWP',2.36),(310,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Rublo bielorrusso','BYN',0.49),(311,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Dólar de Belize','BZD',0.37),(312,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Dólar canadense','CAD',0.24),(313,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Fran congolesac','CDF',368.40),(314,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Franco suíço','CHF',0.18),(315,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Peso chileno','CLP',174.13),(316,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Yuan Renminbi','CNY',1.25),(317,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Peso colombiano','COP',794.75),(351,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Colon da Costa Rica','CRC',126.33),(352,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Peso cubano','CUP',4.43),(353,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Cabo Verde Escudo','CVE',19.88),(354,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Coroa Tcheca','CZK',4.42),(355,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Franco do Djibouti','DJF',32.83),(356,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Coroa dinamarquesa','DKK',1.35),(357,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Peso dominicano','DOP',10.08),(358,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Dinar argelino','DZD',26.97),(359,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Libra egípcia','EGP',3.49),(360,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Nakfa','ERN',2.77),(361,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Birr etíope','ETB',9.61),(362,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Euro','EUR',0.18),(363,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Dólar de Fiji','FJD',0.41),(364,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Libra das Ilhas Falkland','FKP',0.15),(365,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Coroa feroesa','FOK',1.35),(366,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Libra esterlina','GGP',0.15),(367,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Lari','GEL',0.52),(368,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Ghana Cedi','GHS',1.57),(369,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Libra De Gibraltar','GIP',0.15),(370,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Dalasi','GMD',9.96),(371,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Franco da Guiné','GNF',1596.50),(372,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Quetzal','GTQ',1.43),(373,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Dólar da Guiana','GYD',38.50),(374,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Dólar de Hong Kong','HKD',1.45),(375,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Lempira','HNL',4.54),(376,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Kuna','HRK',1.36),(377,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Gourde','HTG',21.59),(378,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Forint','HUF',71.72),(379,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Rupia','IDR',2770.09),(380,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Novo Sheqel israelense','ILS',0.64),(381,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Libra Manesa','IMP',0.15),(382,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Rupia indiana','INR',14.76),(383,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Dinar iraquiano','IQD',268.58),(384,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Rial iraniano','IRR',7720.57),(385,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Coroa da Islândia','ISK',24.98),(386,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Libra de Jersey','JEP',0.15),(387,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Dólar jamaicano','JMD',28.01),(388,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Dinar jordaniano','JOD',0.13),(389,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Iene','JPY',25.43),(390,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Xelim do Quênia','KES',22.16),(391,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Som','KGS',14.84),(392,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Riel','KHR',750.98),(393,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Dólar de Kiribati','KID',0.27),(394,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Franco Comor','KMF',88.70),(395,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Won','KRW',241.77),(396,'2022-07-19 22:12:33','America/Sao_Paulo',1,'O Dinar do Kuwait','KWD',0.06),(397,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Dólar das Ilhas Caimã','KYD',0.15),(398,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Tenge','KZT',88.34),(399,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Kip','LAK',2786.24),(400,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Libra libanesa','LBP',278.45),(401,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Rupia do Sri Lanka','LKR',66.63),(402,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Dólar liberiano','LRD',28.17),(403,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Loti','LSL',3.15),(404,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Dinar da Líbia','LYD',0.90),(405,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Moroccan Dirham','MAD',1.74),(406,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Leão da Moldávia','MDL',3.56),(407,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Ariary malgaxe','MGA',755.37),(408,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Denar','MKD',11.21),(409,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Kyat','MMK',342.42),(410,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Tugrik','MNT',578.28),(411,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Pataca','MOP',1.49),(412,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Ouguiya mauritana','MRU',6.79),(413,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Rupia das Maurícias','MUR',8.48),(414,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Rufiyaa','MVR',2.85),(415,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Kwacha','MWK',192.39),(416,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Peso mexicano','MXN',3.77),(417,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Ringgit da Malásia','MYR',0.82),(418,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Moçambique Metical','MZN',11.86),(419,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Dólares da Namíbia','NAD',3.15),(420,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Naira','NGN',76.73),(421,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Cordoba Oro','NIO',6.63),(422,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Coroa norueguesa','NOK',1.83),(423,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Rupia nepalesa','NPR',23.62),(424,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Dólar da Nova Zelândia','NZD',0.30),(425,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Rial Omani','OMR',0.07),(426,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Balboa','PAB',0.18),(427,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Nuevo Sol','PEN',0.72),(428,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Kina','PGK',0.65),(429,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Peso filipino','PHP',10.37),(430,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Rupia do Paquistão','PKR',40.66),(431,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Zloty','PLN',0.86),(432,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Guarani','PYG',1270.29),(433,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Qatari Rial','QAR',0.67),(434,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Leu romeno','RON',0.89),(435,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Dinar sérvio','RSD',21.10),(436,'2022-07-19 22:12:33','America/Sao_Paulo',1,'rublo russo','RUB',10.37),(437,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Rwanda Franc','RWF',198.40),(438,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Rial saudita','SAR',0.69),(439,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Dólar das Ilhas Salomão','SBD',1.50),(440,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Rúpia das Seychelles','SCR',2.45),(441,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Libra sudanesa','SDG',82.50),(442,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Swedish Krona','SEK',1.89),(443,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Dólar de Singapura','SGD',0.26),(444,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Saint Helena Pound','SHP',0.15),(445,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Leone','SLL',2518.85),(446,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Shilling Somali','SOS',106.45),(447,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Dólar do Suriname','SRD',4.14),(448,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Libra Sudanesa do Sul','SSP',102.17),(449,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Dobra são-tomense','STN',4.42),(450,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Libra síria','SYP',463.95),(451,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Lilangeni','SZL',3.15),(452,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Baht','THB',6.76),(453,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Somoni','TJS',1.93),(454,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Turcomenistão New Manat','TMT',0.64),(455,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Dinar tunisino','TND',0.53),(456,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Pa’anga','TOP',0.44),(457,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Lira turca','TRY',3.25),(458,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Dólar de Trinidad e Tobago','TTD',1.25),(459,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Dólar de Tuvalu','TVD',0.27),(460,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Novo dólar de Taiwan','TWD',5.53),(461,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Xelim da Tanzânia','TZS',433.01),(462,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Hryvnia','UAH',5.58),(463,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Xelim de Uganda','UGX',706.13),(464,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Dólar americano','USD',0.18),(465,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Peso Uruguaio','UYU',7.75),(466,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Soma do Uzbequistão','UZS',2012.10),(467,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Bolívar venezuelano','VES',1.05),(468,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Dong','VND',4324.51),(469,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Vatu','VUV',21.96),(470,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Tala','WST',0.50),(471,'2022-07-19 22:12:33','America/Sao_Paulo',1,'CFA Franc BEAC','XAF',118.26),(472,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Dólar do Caribe Oriental','XCD',0.50),(473,'2022-07-19 22:12:33','America/Sao_Paulo',1,'SDR (Special Drawing Right)','XDR',0.14),(474,'2022-07-19 22:12:33','America/Sao_Paulo',1,'CFA Franco BCEAO','XOF',118.26),(475,'2022-07-19 22:12:33','America/Sao_Paulo',1,'CFP Franc','XPF',21.51),(476,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Rial Iemenita','YER',46.23),(477,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Rand','ZAR',3.15),(478,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Zambian Kwacha','ZMW',3.07),(479,'2022-07-19 22:12:33','America/Sao_Paulo',1,'Dólar zimbabuano','ZWL',74.42);
/*!40000 ALTER TABLE `quotas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-07-29  1:02:44
