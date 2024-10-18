-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: teste_wk
-- ------------------------------------------------------
-- Server version	8.0.40

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `Codigo` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(200) NOT NULL,
  `Cidade` varchar(100) NOT NULL,
  `UF` char(2) NOT NULL,
  PRIMARY KEY (`Codigo`),
  KEY `idx_nome` (`Nome`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Ana Clara Silva','São Paulo','SP'),(2,'Pedro Henrique Costa','Rio de Janeiro','RJ'),(3,'Maria Eduarda Santos','Salvador','BA'),(4,'João Victor Almeida','Fortaleza','CE'),(5,'Laura Beatriz Oliveira','Belo Horizonte','MG'),(6,'Lucas Guilherme Ferreira','Curitiba','PR'),(7,'Sofia Isabel Souza','Manaus','AM'),(8,'Gabriel Rafael Rodrigues','Recife','PE'),(9,'Alice Fernanda Pereira','Porto Alegre','RS'),(10,'Matheus Antônio Martins','Brasília','DF'),(11,'Anya Celeste Gomes','Belém','PA'),(12,'Kai Ethan Carvalho','Goiânia','GO'),(13,'Nova Isabella Nunes','Vitória','ES'),(14,'Jax Gabriel Lima','Campo Grande','MS'),(15,'Indie Sophia Moraes','Macapá','AP'),(16,'Atlas Benjamin Ribeiro','Boa Vista','RR'),(17,'Sky Camila Barros','Palmas','TO'),(18,'River Larissa Vicente','Maceió','AL'),(19,'Nexus Amanda Santos','João Pessoa','PB'),(20,'Zayn Miguel Costa','Natal','RN'),(21,'Aeron Stark','Florianópolis','SC'),(22,'Nyx Malfoy','Aracaju','SE'),(23,'Oberon Targaryen','Teresina','PI'),(24,'Elara Snow','São Luís','MA'),(25,'Kael Greyjoy','Macapá','AP'),(26,'Lyra Lannister','Boa Vista','RR'),(27,'Orion Martell','Palmas','TO'),(28,'Seraphina Baratheon','Maceió','AL'),(29,'Silas Tyrell','João Pessoa','PB'),(30,'Thalia Boltons','Natal','RN'),(31,'Sol Silva','Florianópolis','SC'),(32,'Lua Oliveira','Aracaju','SE'),(33,'Mar Santos','Teresina','PI'),(34,'Céu Campos','São Luís','MA'),(35,'Água Ferreira','Macapá','AP'),(36,'Terra Teixeira','Boa Vista','RR'),(37,'Floresta Almeida','Palmas','TO'),(38,'Aurora Soares','Maceió','AL'),(39,'Nívea Gomes','João Pessoa','PB'),(40,'Zephyr Carvalho','Natal','RN'),(41,'Akira Tanaka','São Paulo','SP'),(42,'Leila Al-Rashid','Rio de Janeiro','RJ'),(43,'Nikos Papadopoulos','Salvador','BA'),(44,'Anya Petrova','Fortaleza','CE'),(45,'Kai Lee','Belo Horizonte','MG'),(46,'Zara Hernandez','Curitiba','PR'),(47,'Noah Cohen','Manaus','AM'),(48,'Marcos Roberto','Recife','PE'),(49,'Luca Rossi','Porto Alegre','RS'),(50,'Maya Patel','Brasília','DF');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido` (
  `Numero_Pedido` int NOT NULL AUTO_INCREMENT,
  `Data_Emissao` date NOT NULL,
  `Codigo_Cliente` int NOT NULL,
  `Valor_Total` decimal(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`Numero_Pedido`),
  KEY `idx_pedido_data_emissao` (`Data_Emissao`),
  KEY `idx_pedido_cliente` (`Codigo_Cliente`),
  CONSTRAINT `fk_pedido_cliente` FOREIGN KEY (`Codigo_Cliente`) REFERENCES `clientes` (`Codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` VALUES (1,'2024-10-18',1,31.66),(2,'2024-10-18',10,59.82);
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido_produto`
--

DROP TABLE IF EXISTS `pedido_produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido_produto` (
  `Autoincrem` int NOT NULL AUTO_INCREMENT,
  `Numero_Pedido` int NOT NULL,
  `Codigo_Produto` int NOT NULL,
  `Quantidade` decimal(10,2) NOT NULL,
  `Valor_Unitario` decimal(10,2) NOT NULL DEFAULT '0.00',
  `Valor_Total` decimal(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`Autoincrem`),
  KEY `idx_pedido_produto_numero_pedido` (`Numero_Pedido`),
  KEY `idx_pedido_produto_codigo_produto` (`Codigo_Produto`),
  CONSTRAINT `fk_Pedido_Produto_Codigo_Produto` FOREIGN KEY (`Codigo_Produto`) REFERENCES `produtos` (`Codigo`),
  CONSTRAINT `fk_Pedido_Produto_Numero_Pedido` FOREIGN KEY (`Numero_Pedido`) REFERENCES `pedido` (`Numero_Pedido`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido_produto`
--

LOCK TABLES `pedido_produto` WRITE;
/*!40000 ALTER TABLE `pedido_produto` DISABLE KEYS */;
INSERT INTO `pedido_produto` VALUES (1,1,1,1.00,12.99,12.99),(2,1,2,2.00,3.50,7.00),(3,1,5,3.00,3.89,11.67),(4,2,8,5.00,2.99,14.95),(5,2,24,1.00,14.90,14.90),(6,2,3,2.00,4.99,9.98),(7,2,18,1.00,19.99,19.99);
/*!40000 ALTER TABLE `pedido_produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produtos`
--

DROP TABLE IF EXISTS `produtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produtos` (
  `Codigo` int NOT NULL AUTO_INCREMENT,
  `Descricao` varchar(255) NOT NULL,
  `Preco_Venda` decimal(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`Codigo`),
  KEY `idx_descricao` (`Descricao`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtos`
--

LOCK TABLES `produtos` WRITE;
/*!40000 ALTER TABLE `produtos` DISABLE KEYS */;
INSERT INTO `produtos` VALUES (1,'Nescafé - Clássico',12.99),(2,'Dolly - Guaraná',3.50),(3,'Coca-Cola - Original',4.99),(4,'Danone - Activia',4.20),(5,'Parmalat - Leite Integral',3.89),(6,'Sachet - Café',0.50),(7,'Toddy - Achocolatado',8.90),(8,'Nissin - Lámen',2.99),(9,'Arisco - Molho de Tomate',3.25),(10,'Ajinomoto - Temperos',5.99),(11,'Yoki - Arroz',4.50),(12,'Quero - Feijão',5.20),(13,'Mãe Terra - Óleo de Soja',9.99),(14,'Bombril - Esponja',1.99),(15,'BomBril - Sabão em Pó',14.99),(16,'Omo - Detergente',12.50),(17,'Downy - Amaciante',11.90),(18,'Gillette - Lâminas de Barbear',19.99),(19,'Huggies - Fraldas',39.90),(20,'Sabonete Líquido - Palmolive',18.50),(21,'Colgate - Pasta de Dente',7.99),(22,'Oral-B - Escova de Dente',12.90),(23,'Nivea - Creme',15.99),(24,'Pantene - Shampoo',14.90),(25,'Dove - Sabonete',3.49),(26,'Head & Shoulders - Shampoo Anticaspa',16.50),(27,'Mondelēz - Oreo',5.99),(28,'Nestlé - KitKat',3.99),(29,'Lacta - Bis',2.50),(30,'M&Ms - Chocolate',6.99),(31,'Snickers - Barra de Chocolate',4.50),(32,'Sucrilhos - Nescau',11.90),(33,'Kelloggs - Corn Flakes',10.99),(34,'Yoki - Milho Verde',3.99),(35,'Caramuru - Palmito',8.50),(36,'Liza - Sardinha',4.20),(37,'Real - Atum',5.99),(38,'Cerveja - Brahma',4.99),(39,'Cerveja - Skol',4.50),(40,'Cerveja - Budweiser',5.20),(41,'Vinho - Salton',29.90),(42,'Vinho - Chandon',49.90),(43,'Vinho - Garibaldi',35.00),(44,'Suco - Del Valle',4.99),(45,'Suco - Capricho',3.99),(46,'Suco - Clight',5.50),(47,'Água - Bonafont',2.99),(48,'Água - Crystal',3.50),(49,'Água - San Pellegrino',5.99),(50,'Água - Leão',3.20);
/*!40000 ALTER TABLE `produtos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-18 14:39:15
