CREATE TABLE `_ip`(
`id` TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
`ip` VARCHAR(20) NOT NULL,
`status` ENUM( 'allowed', 'blocked') NOT NULL DEFAULT 'allowed',
PRIMARY KEY (`id`),
UNIQUE INDEX `ip` ( `ip`),
INDEX `status` (`status`)
) ENGINE = INNODB DEFAULT CHARACTER SET = UTF8;