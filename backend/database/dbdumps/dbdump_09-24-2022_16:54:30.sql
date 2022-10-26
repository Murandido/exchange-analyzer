/* mysqldump: [Warning] Using a password on the command line interface can be insecure.
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
) ENGINE=InnoDB AUTO_INCREMENT=1600 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quotas`
--

LOCK TABLES `quotas` WRITE;
/*!40000 ALTER TABLE `quotas` DISABLE KEYS */;
INSERT INTO `quotas` VALUES (287,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Real','BRL',1.00),(288,'2022-08-26 19:39:54','America/Sao_Paulo',1,'UAE Dirham','AED',0.72),(289,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Afghani','AFN',17.25),(290,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Lek','ALL',23.00),(291,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Dram armênio','AMD',79.17),(292,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Guilder das Antilhas Holandesas','ANG',0.35),(293,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Kwanza','AOA',84.19),(294,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Peso argentino','ARS',26.95),(295,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Dólar australiano','AUD',0.28),(296,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Florim de Aruba','AWG',0.35),(297,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Manat do Azerbaijão','AZN',0.33),(298,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Marco conversível','BAM',0.38),(299,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Dólar de Barbados','BBD',0.39),(300,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Taka','BDT',18.68),(301,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Lev búlgaro','BGN',0.38),(302,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Dinar do Bahrein','BHD',0.07),(303,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Franco do Burundi','BIF',398.96),(304,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Dólar das Bermudas','BMD',0.20),(305,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Dólares de Brunei','BND',0.27),(306,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Boliviano','BOB',1.36),(307,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Dólar das Bahamas','BSD',0.20),(308,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Ngultrum','BTN',15.63),(309,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Pula','BWP',2.50),(310,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Rublo bielorrusso','BYN',0.50),(311,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Dólar de Belize','BZD',0.39),(312,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Dólar canadense','CAD',0.25),(313,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Fran congolesac','CDF',394.96),(314,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Franco suíço','CHF',0.19),(315,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Peso chileno','CLP',180.48),(316,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Yuan Renminbi','CNY',1.34),(317,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Peso colombiano','COP',866.87),(351,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Colon da Costa Rica','CRC',128.86),(352,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Peso cubano','CUP',4.69),(353,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Cabo Verde Escudo','CVE',21.62),(354,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Coroa Tcheca','CZK',4.83),(355,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Franco do Djibouti','DJF',34.76),(356,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Coroa dinamarquesa','DKK',1.46),(357,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Peso dominicano','DOP',10.40),(358,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Dinar argelino','DZD',27.72),(359,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Libra egípcia','EGP',3.75),(360,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Nakfa','ERN',2.93),(361,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Birr etíope','ETB',10.29),(362,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Euro','EUR',0.20),(363,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Dólar de Fiji','FJD',0.43),(364,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Libra das Ilhas Falkland','FKP',0.17),(365,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Coroa feroesa','FOK',1.46),(366,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Libra esterlina','GGP',0.17),(367,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Lari','GEL',0.56),(368,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Ghana Cedi','GHS',2.03),(369,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Libra De Gibraltar','GIP',0.17),(370,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Dalasi','GMD',10.74),(371,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Franco da Guiné','GNF',1685.85),(372,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Quetzal','GTQ',1.52),(373,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Dólar da Guiana','GYD',40.86),(374,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Dólar de Hong Kong','HKD',1.53),(375,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Lempira','HNL',4.81),(376,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Kuna','HRK',1.48),(377,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Gourde','HTG',24.28),(378,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Forint','HUF',80.18),(379,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Rupia','IDR',2901.76),(380,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Novo Sheqel israelense','ILS',0.64),(381,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Libra Manesa','IMP',0.17),(382,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Rupia indiana','INR',15.63),(383,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Dinar iraquiano','IQD',285.08),(384,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Rial iraniano','IRR',8235.51),(385,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Coroa da Islândia','ISK',27.51),(386,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Libra de Jersey','JEP',0.17),(387,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Dólar jamaicano','JMD',29.71),(388,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Dinar jordaniano','JOD',0.14),(389,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Iene','JPY',26.71),(390,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Xelim do Quênia','KES',23.62),(391,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Som','KGS',15.81),(392,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Riel','KHR',801.14),(393,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Dólar de Kiribati','KID',0.28),(394,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Franco Comor','KMF',96.45),(395,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Won','KRW',261.33),(396,'2022-08-26 19:39:54','America/Sao_Paulo',1,'O Dinar do Kuwait','KWD',0.06),(397,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Dólar das Ilhas Caimã','KYD',0.16),(398,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Tenge','KZT',91.42),(399,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Kip','LAK',2995.57),(400,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Libra libanesa','LBP',294.86),(401,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Rupia do Sri Lanka','LKR',70.61),(402,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Dólar liberiano','LRD',30.21),(403,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Loti','LSL',3.29),(404,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Dinar da Líbia','LYD',0.96),(405,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Moroccan Dirham','MAD',2.07),(406,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Leão da Moldávia','MDL',3.79),(407,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Ariary malgaxe','MGA',805.17),(408,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Denar','MKD',12.09),(409,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Kyat','MMK',412.81),(410,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Tugrik','MNT',622.81),(411,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Pataca','MOP',1.58),(412,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Ouguiya mauritana','MRU',7.36),(413,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Rupia das Maurícias','MUR',8.65),(414,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Rufiyaa','MVR',3.03),(415,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Kwacha','MWK',202.11),(416,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Peso mexicano','MXN',3.89),(417,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Ringgit da Malásia','MYR',0.88),(418,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Moçambique Metical','MZN',12.46),(419,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Dólares da Namíbia','NAD',3.29),(420,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Naira','NGN',82.84),(421,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Cordoba Oro','NIO',7.02),(422,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Coroa norueguesa','NOK',1.89),(423,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Rupia nepalesa','NPR',25.00),(424,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Dólar da Nova Zelândia','NZD',0.31),(425,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Rial Omani','OMR',0.08),(426,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Balboa','PAB',0.20),(427,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Nuevo Sol','PEN',0.75),(428,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Kina','PGK',0.69),(429,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Peso filipino','PHP',10.97),(430,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Rupia do Paquistão','PKR',43.13),(431,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Zloty','PLN',0.93),(432,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Guarani','PYG',1350.79),(433,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Qatari Rial','QAR',0.71),(434,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Leu romeno','RON',0.96),(435,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Dinar sérvio','RSD',23.03),(436,'2022-08-26 19:39:54','America/Sao_Paulo',1,'rublo russo','RUB',11.77),(437,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Rwanda Franc','RWF',207.85),(438,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Rial saudita','SAR',0.73),(439,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Dólar das Ilhas Salomão','SBD',1.60),(440,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Rúpia das Seychelles','SCR',2.59),(441,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Libra sudanesa','SDG',110.42),(442,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Swedish Krona','SEK',2.07),(443,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Dólar de Singapura','SGD',0.27),(444,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Saint Helena Pound','SHP',0.17),(445,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Leone','SLL',2793.00),(446,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Shilling Somali','SOS',111.03),(447,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Dólar do Suriname','SRD',4.78),(448,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Libra Sudanesa do Sul','SSP',127.81),(449,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Dobra são-tomense','STN',4.80),(450,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Libra síria','SYP',493.83),(451,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Lilangeni','SZL',3.29),(452,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Baht','THB',7.02),(453,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Somoni','TJS',2.01),(454,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Turcomenistão New Manat','TMT',0.68),(455,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Dinar tunisino','TND',0.57),(456,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Pa’anga','TOP',0.46),(457,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Lira turca','TRY',3.55),(458,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Dólar de Trinidad e Tobago','TTD',1.33),(459,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Dólar de Tuvalu','TVD',0.28),(460,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Novo dólar de Taiwan','TWD',5.91),(461,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Xelim da Tanzânia','TZS',454.94),(462,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Hryvnia','UAH',7.29),(463,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Xelim de Uganda','UGX',739.85),(464,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Dólar americano','USD',0.20),(465,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Peso Uruguaio','UYU',7.90),(466,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Soma do Uzbequistão','UZS',2137.72),(467,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Bolívar venezuelano','VES',1.53),(468,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Dong','VND',4589.09),(469,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Vatu','VUV',23.26),(470,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Tala','WST',0.53),(471,'2022-08-26 19:39:54','America/Sao_Paulo',1,'CFA Franc BEAC','XAF',128.60),(472,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Dólar do Caribe Oriental','XCD',0.53),(473,'2022-08-26 19:39:54','America/Sao_Paulo',1,'SDR (Special Drawing Right)','XDR',0.15),(474,'2022-08-26 19:39:54','America/Sao_Paulo',1,'CFA Franco BCEAO','XOF',128.60),(475,'2022-08-26 19:39:54','America/Sao_Paulo',1,'CFP Franc','XPF',23.40),(476,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Rial Iemenita','YER',49.20),(477,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Rand','ZAR',3.29),(478,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Zambian Kwacha','ZMW',3.14),(479,'2022-08-26 19:39:54','America/Sao_Paulo',1,'Dólar zimbabuano','ZWL',102.79);
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

-- Dump completed on 2022-09-24 19:54:30
