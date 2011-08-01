# --------------------------------------------------------
# Host:                         localhost
# Server version:               5.1.41
# Server OS:                    Win32
# HeidiSQL version:             6.0.0.3603
# Date/time:                    2011-05-24 02:56:14
# --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

# Dumping structure for table pkt_scanner.data_categories
CREATE TABLE IF NOT EXISTS `data_categories` (
  `category_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT 'Category name',
  `cities_page_current` int(10) unsigned NOT NULL DEFAULT '1' COMMENT 'Current city in category page',
  `cities_page_total` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Cities pages count in category view',
  `is_complete` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT 'Items count in current city view',
  `working` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table pkt_scanner.data_cities
CREATE TABLE IF NOT EXISTS `data_cities` (
  `city_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`city_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table pkt_scanner.data_objects
CREATE TABLE IF NOT EXISTS `data_objects` (
  `object_id` varchar(50) NOT NULL,
  `category_id` int(10) unsigned NOT NULL,
  `city_id` int(10) unsigned NOT NULL,
  `area` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `website` varchar(255) NOT NULL,
  PRIMARY KEY (`object_id`,`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# Data exporting was unselected.


# Dumping structure for table pkt_scanner.rel_category_city
CREATE TABLE IF NOT EXISTS `rel_category_city` (
  `category_id` int(10) NOT NULL DEFAULT '0',
  `city_id` int(10) NOT NULL DEFAULT '0',
  `total_items` int(10) DEFAULT '0',
  `current_page` int(10) DEFAULT '1',
  `is_complete` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`category_id`,`city_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# Data exporting was unselected.
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
