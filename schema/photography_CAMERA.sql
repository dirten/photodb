/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CAMERA` (
  `camera_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Auto-incremented camera ID',
  `manufacturer_id` int(11) DEFAULT NULL COMMENT 'Denotes the manufacturer of the camera.',
  `model` varchar(45) DEFAULT NULL COMMENT 'The model name of the camera',
  `mount_id` int(11) DEFAULT NULL COMMENT 'Denotes the lens mount of the camera if it is an interchangeable-lens camera',
  `format_id` int(11) DEFAULT NULL COMMENT 'Denotes the film format of the camera',
  `focus_type_id` int(11) DEFAULT NULL COMMENT 'Denotes the focus type of the camera',
  `metering` tinyint(1) DEFAULT NULL COMMENT 'Whether the camera has built-in metering',
  `coupled_metering` tinyint(1) DEFAULT NULL COMMENT 'Whether the camera''s meter is coupled automatically',
  `metering_type_id` int(11) DEFAULT NULL COMMENT 'Denotes the technology used in the meter',
  `body_type_id` int(11) DEFAULT NULL COMMENT 'Denotes the style of camera body',
  `weight` int(11) DEFAULT NULL COMMENT 'Weight of the camera body (without lens or batteries) in grammes (g)',
  `acquired` date DEFAULT NULL COMMENT 'Date on which the camera was acquired',
  `cost` decimal(6,2) DEFAULT NULL COMMENT 'Price paid for the camera, in local currency units',
  `introduced` smallint(6) DEFAULT NULL COMMENT 'Year in which the camera model was introduced',
  `discontinued` smallint(6) DEFAULT NULL COMMENT 'Year in which the camera model was discontinued',
  `serial` varchar(45) DEFAULT NULL COMMENT 'Serial number of the camera',
  `datecode` varchar(12) DEFAULT NULL COMMENT 'Date code of the camera, if different from the serial number',
  `manufactured` smallint(6) DEFAULT NULL COMMENT 'Year of manufacture of the camera',
  `own` tinyint(1) DEFAULT NULL COMMENT 'Whether the camera is currently owned',
  `negative_size_id` int(11) DEFAULT NULL COMMENT 'Denotes the size of negative made by the camera',
  `shutter_type_id` int(11) DEFAULT NULL COMMENT 'Denotes type of shutter',
  `shutter_model` varchar(45) DEFAULT NULL COMMENT 'Model of shutter',
  `cable_release` tinyint(1) DEFAULT NULL COMMENT 'Whether the camera has the facility for a remote cable release',
  `viewfinder_coverage` int(11) DEFAULT NULL COMMENT 'Percentage coverage of the viewfinder. Mostly applicable to SLRs.',
  `power_drive` tinyint(1) DEFAULT NULL COMMENT 'Whether the camera has integrated motor drive',
  `continuous_fps` decimal(3,1) DEFAULT NULL COMMENT 'The maximum rate at which the camera can shoot, in frames per second',
  `video` tinyint(1) DEFAULT NULL COMMENT 'Whether the camera can take video/movie',
  `digital` tinyint(1) DEFAULT NULL COMMENT 'Whether this is a digital camera',
  `fixed_mount` tinyint(1) DEFAULT NULL COMMENT 'Whether the camera has a fixed lens',
  `lens_id` int(11) DEFAULT NULL COMMENT 'If fixed_mount is true, specify the lens_id',
  `battery_qty` int(11) DEFAULT NULL COMMENT 'Quantity of batteries needed',
  `battery_type` int(11) DEFAULT NULL COMMENT 'Denotes type of battery needed',
  `notes` text COMMENT 'Freeform text field for extra notes',
  `lost` date DEFAULT NULL COMMENT 'Date on which the camera was lost/sold/etc',
  `lost_price` decimal(6,2) DEFAULT NULL COMMENT 'Price at which the camera was sold',
  `source` varchar(150) DEFAULT NULL COMMENT 'Where the camera was acquired from',
  `min_shutter` varchar(10) CHARACTER SET latin1 DEFAULT NULL COMMENT 'Fastest available shutter speed, expressed like 1/400',
  `max_shutter` varchar(10) CHARACTER SET latin1 DEFAULT NULL COMMENT 'Slowest available shutter speed, expressed like 30 (no ")',
  `bulb` tinyint(1) DEFAULT NULL COMMENT 'Whether the camera supports bulb (B) exposure',
  `time` tinyint(1) DEFAULT NULL COMMENT 'Whether the camera supports time (T) exposure',
  `min_iso` int(11) DEFAULT NULL COMMENT 'Minimum ISO the camera will accept for metering',
  `max_iso` int(11) DEFAULT NULL COMMENT 'Maximum ISO the camera will accept for metering',
  `af_points` tinyint(4) DEFAULT NULL COMMENT 'Number of autofocus points',
  `int_flash` tinyint(1) DEFAULT NULL COMMENT 'Whether the camera has an integrated flash',
  `int_flash_gn` tinyint(4) DEFAULT NULL COMMENT 'Guide number of internal flash',
  `ext_flash` tinyint(1) DEFAULT NULL COMMENT ' Whether the camera supports an external flash',
  `flash_metering` varchar(12) DEFAULT NULL COMMENT 'Flash metering protocol',
  `pc_sync` tinyint(1) DEFAULT NULL COMMENT 'Whether the camera has a PC sync socket for flash',
  `hotshoe` tinyint(1) DEFAULT NULL COMMENT 'Whether the camera has a hotshoe',
  `coldshoe` tinyint(1) DEFAULT NULL COMMENT 'Whether the camera has a coldshoe or accessory shoe',
  `x_sync` varchar(6) DEFAULT NULL COMMENT 'X-sync shutter speed, expressed like 1/125',
  `meter_min_ev` tinyint(4) DEFAULT NULL COMMENT 'Lowest EV/LV the built-in meter supports',
  `meter_max_ev` tinyint(4) DEFAULT NULL COMMENT 'Highest EV/LV the built-in meter supports',
  `condition_id` int(11) DEFAULT NULL COMMENT 'Denotes the cosmetic condition of the camera',
  `dof_preview` tinyint(1) DEFAULT NULL COMMENT 'Whether the camera has depth of field preview',
  `tripod` tinyint(1) DEFAULT NULL COMMENT 'Whether the camera has a tripod bush',
  `display_lens` int(11) DEFAULT NULL COMMENT 'Lens ID of the lens that this camera should normally be displayed with',
  PRIMARY KEY (`camera_id`),
  UNIQUE KEY `display_lens_UNIQUE` (`display_lens`),
  KEY `manufacturer_id` (`manufacturer_id`),
  KEY `body_type_id` (`body_type_id`),
  KEY `fk_body_type` (`body_type_id`),
  KEY `fk_focus_type` (`focus_type_id`),
  KEY `fk_mount` (`mount_id`),
  KEY `fk_format` (`format_id`),
  KEY `fk_manufacturer` (`manufacturer_id`),
  KEY `fk_metering_type` (`metering_type_id`),
  KEY `fk_negative_size_id` (`negative_size_id`),
  KEY `fk_shutter_type_id` (`shutter_type_id`),
  KEY `fk_CAMERA_3_idx` (`condition_id`),
  KEY `fk_CAMERA_1_idx` (`min_shutter`),
  KEY `fk_CAMERA_2_idx` (`max_shutter`),
  KEY `fk_CAMERA_3_idx1` (`display_lens`),
  KEY `fk_CAMERA_4_idx` (`battery_type`),
  CONSTRAINT `fk_CAMERA_1` FOREIGN KEY (`min_shutter`) REFERENCES `SHUTTER_SPEED` (`shutter_speed`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_CAMERA_2` FOREIGN KEY (`max_shutter`) REFERENCES `SHUTTER_SPEED` (`shutter_speed`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_CAMERA_3` FOREIGN KEY (`display_lens`) REFERENCES `LENS` (`lens_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_CAMERA_4` FOREIGN KEY (`battery_type`) REFERENCES `BATTERY` (`battery_type`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_CAMERA_5` FOREIGN KEY (`display_lens`) REFERENCES `LENS` (`lens_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_body_type` FOREIGN KEY (`body_type_id`) REFERENCES `BODY_TYPE` (`body_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_condition` FOREIGN KEY (`condition_id`) REFERENCES `CONDITION` (`condition_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_focus_type` FOREIGN KEY (`focus_type_id`) REFERENCES `FOCUS_TYPE` (`focus_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_format` FOREIGN KEY (`format_id`) REFERENCES `FORMAT` (`format_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_manufacturer` FOREIGN KEY (`manufacturer_id`) REFERENCES `MANUFACTURER` (`manufacturer_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_metering_type` FOREIGN KEY (`metering_type_id`) REFERENCES `METERING_TYPE` (`metering_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_mount` FOREIGN KEY (`mount_id`) REFERENCES `MOUNT` (`mount_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_negative_size` FOREIGN KEY (`negative_size_id`) REFERENCES `NEGATIVE_SIZE` (`negative_size_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_shutter_type` FOREIGN KEY (`shutter_type_id`) REFERENCES `SHUTTER_TYPE` (`shutter_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Table to catalog cameras - both cameras with fixed lenses and cameras with interchangeable lenses';
/*!40101 SET character_set_client = @saved_cs_client */;
