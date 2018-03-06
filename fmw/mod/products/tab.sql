CREATE TABLE `product` (
  `id` smallint(3) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(250) NOT NULL,
  `price` varchar(50) NULL DEFAULT NULL COMMENT 'Informational price.',
  `f_content` text DEFAULT NULL,
  `img` varchar(250) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `cat_id` int(10) UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY ( `cat_id` ) REFERENCES `_st` ( `id` ) ON DELETE CASCADE,
  UNIQUE INDEX `title` ( `title`),
  INDEX `active` (`active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
