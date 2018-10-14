SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `print_info` (
  `Negative` tinyint NOT NULL,
  `Print` tinyint NOT NULL,
  `Description` tinyint NOT NULL,
  `size` tinyint NOT NULL,
  `Exposure time` tinyint NOT NULL,
  `Aperture` tinyint NOT NULL,
  `Filtration grade` tinyint NOT NULL,
  `Paper` tinyint NOT NULL,
  `Enlarger` tinyint NOT NULL,
  `Enlarger lens` tinyint NOT NULL,
  `First toner` tinyint NOT NULL,
  `Second toner` tinyint NOT NULL,
  `Print date` tinyint NOT NULL,
  `Photo date` tinyint NOT NULL,
  `Photographer` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;
/*!50001 DROP TABLE IF EXISTS `print_info`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`jonathan`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `print_info` AS select concat(`NEGATIVE`.`film_id`,'/',`NEGATIVE`.`frame`) AS `Negative`,`PRINT`.`print_id` AS `Print`,`NEGATIVE`.`description` AS `Description`,concat(`PRINT`.`width`,'x',`PRINT`.`height`,'"') AS `size`,concat(`PRINT`.`exposure_time`,'s') AS `Exposure time`,concat('f/',`PRINT`.`aperture`) AS `Aperture`,`PRINT`.`filtration_grade` AS `Filtration grade`,concat(`PAPER_STOCK_MANUFACTURER`.`manufacturer`,' ',`PAPER_STOCK`.`name`) AS `Paper`,concat(`ENLARGER_MANUFACTURER`.`manufacturer`,' ',`ENLARGER`.`enlarger`) AS `Enlarger`,concat(`LENS_MANUFACTURER`.`manufacturer`,' ',`LENS`.`model`) AS `Enlarger lens`,concat(`FIRSTTONER_MANUFACTURER`.`manufacturer`,' ',`FIRSTTONER`.`toner`,if((`PRINT`.`toner_dilution` is not null),concat(' (',`PRINT`.`toner_dilution`,')'),''),if((`PRINT`.`toner_time` is not null),concat(' for ',`PRINT`.`toner_time`),'')) AS `First toner`,concat(`SECONDTONER_MANUFACTURER`.`manufacturer`,' ',`SECONDTONER`.`toner`,if((`PRINT`.`2nd_toner_dilution` is not null),concat(' (',`PRINT`.`2nd_toner_dilution`,')'),''),if((`PRINT`.`2nd_toner_time` is not null),concat(' for ',`PRINT`.`2nd_toner_time`),'')) AS `Second toner`,date_format(`PRINT`.`date`,'%M %Y') AS `Print date`,date_format(`NEGATIVE`.`date`,'%M %Y') AS `Photo date`,`PERSON`.`name` AS `Photographer` from ((((((((((((`PRINT` join `PAPER_STOCK` on((`PRINT`.`paper_stock_id` = `PAPER_STOCK`.`paper_stock_id`))) join `MANUFACTURER` `PAPER_STOCK_MANUFACTURER` on((`PAPER_STOCK`.`manufacturer_id` = `PAPER_STOCK_MANUFACTURER`.`manufacturer_id`))) left join `ENLARGER` on((`PRINT`.`enlarger_id` = `ENLARGER`.`enlarger_id`))) join `MANUFACTURER` `ENLARGER_MANUFACTURER` on((`ENLARGER`.`manufacturer_id` = `ENLARGER_MANUFACTURER`.`manufacturer_id`))) left join `LENS` on((`PRINT`.`lens_id` = `LENS`.`lens_id`))) join `MANUFACTURER` `LENS_MANUFACTURER` on((`LENS`.`manufacturer_id` = `LENS_MANUFACTURER`.`manufacturer_id`))) left join `TONER` `FIRSTTONER` on((`PRINT`.`toner_id` = `FIRSTTONER`.`toner_id`))) left join `MANUFACTURER` `FIRSTTONER_MANUFACTURER` on((`FIRSTTONER`.`manufacturer_id` = `FIRSTTONER_MANUFACTURER`.`manufacturer_id`))) left join `TONER` `SECONDTONER` on((`PRINT`.`2nd_toner_id` = `SECONDTONER`.`toner_id`))) left join `MANUFACTURER` `SECONDTONER_MANUFACTURER` on((`SECONDTONER`.`manufacturer_id` = `SECONDTONER_MANUFACTURER`.`manufacturer_id`))) left join `NEGATIVE` on((`PRINT`.`negative_id` = `NEGATIVE`.`negative_id`))) left join `PERSON` on((`NEGATIVE`.`photographer_id` = `PERSON`.`person_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
