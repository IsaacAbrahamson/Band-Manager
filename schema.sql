DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `orderid` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `desc` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`orderid`)
);

INSERT INTO `orders` VALUES (1,'McChicken','A chicken sandwich'),(2,'McDouble','A burger'),(3,'McFish','A fish sandwich'),(4,'McNuggets','10 Chicken nuggets');