/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FORMAT` (
  `format_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Unique ID for this format',
  `format` varchar(45) DEFAULT NULL COMMENT 'The name of this film/sensor format',
  `digital` tinyint(1) DEFAULT NULL COMMENT 'Whether this is a digital format',
  PRIMARY KEY (`format_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;