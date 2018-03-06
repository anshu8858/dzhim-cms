CREATE TABLE `partner` (
  `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(250) NOT NULL,
  `img` varchar(250) DEFAULT NULL,
  `f_content` text DEFAULT NULL,
  `url` varchar(250) DEFAULT NULL,
  `cat_id` int(10) UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY ( `cat_id` ) REFERENCES `_st` ( `id` ) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
