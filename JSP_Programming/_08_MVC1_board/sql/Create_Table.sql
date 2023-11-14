USE jsp_board;

-- DROP TABLE IF EXIST `board`
CREATE TABLE `member` (
  `id` varchar(10) NOT NULL,
  `pass` varchar(10) NOT NULL,
  `name` varchar(30) NOT NULL,
  `register` date NOT NULL DEFAULT curdate(),
  PRIMARY KEY (`id`)
);

-- DROP TABLE IF EXIST `board`
CREATE TABLE `board` (
  `num` int NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `content` varchar(2000) NOT NULL,
  `id` varchar(10) NOT NULL,
  `postdate` date NOT NULL DEFAULT curdate(),
  `visitcount` int DEFAULT 0,
  PRIMARY KEY (`num`),
  KEY `board_mem_fk` (`id`),
  CONSTRAINT `board_mem_fk` FOREIGN KEY (`id`) REFERENCES `member` (`id`)
);

