/*
MySQL Backup
Source Server Version: 5.5.34
Date: 16/12/2013 13:57:23
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
--  Table structure for `ETUDIANT`
-- ----------------------------
DROP TABLE IF EXISTS `ETUDIANT`;
CREATE TABLE `ETUDIANT` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `civ` varchar(4) NOT NULL,
  `nom` varchar(25) NOT NULL,
  `prenom` varchar(25) NOT NULL,
  `adresse` varchar(50) NOT NULL,
  `cp` varchar(5) NOT NULL,
  `ville` varchar(25) NOT NULL,
  `portable` varchar(10) DEFAULT NULL,
  `telephone` varchar(10) DEFAULT NULL,
  `mel` varchar(50) DEFAULT NULL,
  `id_fil` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `FILIERE`
-- ----------------------------
DROP TABLE IF EXISTS `FILIERE`;
CREATE TABLE `FILIERE` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) COLLATE latin1_general_cs NOT NULL,
  `lib_court` varchar(20) COLLATE latin1_general_cs NOT NULL,
  `lib_milong` varchar(70) COLLATE latin1_general_cs NOT NULL,
  `lib_long` varchar(120) COLLATE latin1_general_cs NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;

-- ----------------------------
--  Table structure for `NOTATION`
-- ----------------------------
DROP TABLE IF EXISTS `NOTATION`;
CREATE TABLE `NOTATION` (
  `id_UE` int(11) NOT NULL,
  `id_etud` int(11) NOT NULL,
  `note` decimal(4,2) NOT NULL,
  PRIMARY KEY (`id_UE`,`id_etud`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;

-- ----------------------------
--  Table structure for `UE`
-- ----------------------------
DROP TABLE IF EXISTS `UE`;
CREATE TABLE `UE` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lib_court` varchar(20) COLLATE latin1_general_cs NOT NULL,
  `lib_long` varchar(50) COLLATE latin1_general_cs NOT NULL,
  `ordre` tinyint(4) NOT NULL,
  `coef` decimal(4,2) NOT NULL,
  `id_fil` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;

-- ----------------------------
--  Records 
-- ----------------------------
INSERT INTO `ETUDIANT` VALUES ('1','M','RIBARDIN','Pierre','81 avenue Longchamps','57100','Thionville','0632249767','0329308426','pierre.ribardin@yahoo.fr','1'), ('2','M','NIABRUS','Patrick','5 rue de l\'Abbé Risse','57430','Sarralbe','0688129800','0329300143','patrick.niabrus@gmail.com','1'), ('3','M','COLUT','Julien','33 rue du Beau Site','25170','Pelousey','0607739640','0387371259','julien.colut@gmail.com','1'), ('4','M','PIROEL','Maxime','7 rue du 372ème Régiment d\'Aviation','54000','NANCY','','0383720496','maxime.piroel@gmail.com','1'), ('5','Mme','POICHI','Sophie','1 rue du Crassier','54600','Villers-lès-Nancy','0681754923',NULL,'emilien.poichi@free.fr','1'), ('6','M','KICHASO','Simon','11 route Nationale','57118','Ste Marie-aux-Chênes','0613873252','0382844585','simon.kichaso@free.fr','1'), ('7','M','DAMEDE','Nicolas','37 rue Lecat','57510','St Jean-Rohrbach','0624174330',NULL,'nicolas.damede@univ_lorraine.fr','1'), ('8','M','RYFE','Audric','94 rue Pierre Fourier','57000','METZ','0674548884','0387903555','audric.ryfe@hotmail.fr','1'), ('9','M','GIRODI','Vincent','66 rue Albert Bosch','57070','NOUILLY','0622117171','','vincent.girodi@gmail.com','1'), ('10','Mme','LEVY','Gaétane','51 rue Saint Sixte','57700','Marspich','0678898493','0387941303','gaetane.levy@gmail.com','1'), ('11','M','ROCASI','Julien','12 place du Général Patton','57000','METZ','0685287547','0387885815','julien.rocasi@gmail.com','1'), ('12','M','STRINGER','David','29 rue Napoléon 1er','54530','Pagny-Sur-Moselle','0630613128',NULL,'david.stringer@free.fr','1'), ('13','Mme','PARMAU','Stéphanie','10 rue du Vallon du Bouvreuil','70000','Vesoul','0676425219',NULL,'stephanie.parmau@free.fr','2'), ('14','M','COLLIMASSON','Yohan','61 bld André Maginot','55320','Sommedieue','0689120619','0384765179','yohan.collimasson@gmail.com','2'), ('15','M','EIFFEL','Alexandre','15 impasse de la Bergerie','55000','Naïves Rosières','0608106081','0329857553','alexandre.eiffel@gmail.com','2'), ('16','M','CASTETTE','Romain','6c rue Gisors','88190','Golbey',NULL,'0329771150','romain.castette@gmail.com','2'), ('17','M','LECHANTELOUP','Grégory','13 rue du Pont','51000','Châlons-en-Champagne','0673750152','0329342116','gregory.lechanteloup@gmail.com','2'), ('18','M','PARMENTIER','Jean-Frédéric','63 rue d\'Uriménil','57380','Faulquemont','0661943901',NULL,'jeanfred.parmentie@hotmail.fr','2'), ('19','M','BLANCHARD','Pierre','16, la Sentinelle','57350','Stiring-Wendel','0609600114','0383831815','pierre.blanchard@free.fr','2'), ('20','M','TIMOSELLANI','Michel','15 allée de Roger Marx','57690','Zimming','0670908461','0387303272','michel.timosellani@laposte.net','2'), ('21','M','KIRTZAN','David','24 rue de l\'Ermitage','2100','Saint Quentin','0663878002','0387745009','david.kirtzan@hotmail.fr','2'), ('22','M','BRAUCH','Mickael','10 rue des bouvreuils','57000','Metz','0628227309','0382912076','mickael.brauch@gmail.com','2'), ('23','Mme','CIRME','Guillaumette','15 rue Dupont des Loges','54700','Pont-à-Mousson','0679745695','0381550699','guillaume.cirme@free.fr','1'), ('24','M','TIBOU','Florian','10 rue Médecin Général Brice','57950','Montigny-lès-Metz','0615794265',NULL,'florian.tibou@gmail.com','1'), ('25','M','LUISON','Yoann','3 rue Lafayette','88220','Dounoux','0632404185','0383403489','yoann.luison@gmail.com','2'), ('26','M','CHOLETAIS','Mathieu','4 rue Laude','88340','Le Val d\'Ajol','0603596666','0387618533','mathieu.choletais@free.fr','2'), ('27','M','SPAMAGIRAI','Florian','27 voie des Fusillés','57000','Metz','0676190102',NULL,'florian.spamagirai@gmail.com','2'), ('28','M','BARBUZ','Jérémy','15 rue Pierre Curie','54370','Einville au Jard','0664675097','0383826541','jerem.barbuz@gmail.com','2');
INSERT INTO `FILIERE` VALUES ('1','302-5KTMJ1','LP SIL GL','LP SIL métiers du Génie Logiciel','Licence Professionnelle Systèmes Informatiques et Logiciels métiers du Génie Logiciel'), ('2','302-5KTMI7','LP SIL ASR','LP SIL métiers de l\'Administration des Systèmes et Réseaux','Licence Professionnelle Systèmes Informatiques et Logiciels métiers de l\'Administration des Systèmes et Réseaux');
INSERT INTO `NOTATION` VALUES ('1','1','10.00'), ('1','2','14.00'), ('1','3','10.00'), ('1','4','7.00'), ('1','5','6.00'), ('1','6','10.00'), ('1','7','11.00'), ('1','8','13.00'), ('1','9','7.00'), ('1','10','11.00'), ('1','11','13.00'), ('1','12','10.00'), ('1','23','10.00'), ('1','24','7.00'), ('2','13','13.00'), ('2','14','13.00'), ('2','15','11.00'), ('2','16','9.00'), ('2','17','8.00'), ('2','18','8.00'), ('2','19','9.00'), ('2','20','9.00'), ('2','21','13.00'), ('2','22','9.00'), ('2','25','9.00'), ('2','26','8.00'), ('2','27','13.00'), ('2','28','10.00'), ('3','1','16.00'), ('3','2','18.00'), ('3','3','12.00'), ('3','4','0.00'), ('3','5','0.00'), ('3','6','15.00'), ('3','7','16.00'), ('3','8','15.00'), ('3','9','15.00'), ('3','10','19.00'), ('3','11','14.00'), ('3','12','16.00'), ('3','23','-1.00'), ('3','24','11.00'), ('4','13','16.00'), ('4','14','16.00'), ('4','15','15.00'), ('4','16','12.00'), ('4','17','15.00'), ('4','18','11.00'), ('4','19','16.00'), ('4','20','16.00'), ('4','21','16.00'), ('4','22','17.00'), ('4','25','15.00'), ('4','26','15.00'), ('4','27','15.00'), ('4','28','14.00'), ('5','13','16.00'), ('5','14','14.00'), ('5','15','12.00'), ('5','16','14.00'), ('5','17','14.00'), ('5','18','15.00'), ('5','19','13.00'), ('5','20','15.00'), ('5','21','14.00'), ('5','22','12.00'), ('5','25','15.00'), ('5','26','14.00'), ('5','27','15.00'), ('5','28','14.00'), ('6','13','16.00'), ('6','14','13.00'), ('6','15','10.00'), ('6','16','13.00'), ('6','17','14.00'), ('6','18','13.00'), ('6','19','13.00'), ('6','20','13.00'), ('6','21','14.00'), ('6','22','11.00'), ('6','25','12.00'), ('6','26','12.00'), ('6','27','12.00'), ('6','28','13.00'), ('7','13','12.00'), ('7','14','6.00'), ('7','15','12.00'), ('7','16','5.00'), ('7','17','8.00'), ('7','18','8.00'), ('7','19','7.00'), ('7','20','11.00'), ('7','21','14.00'), ('7','22','11.00'), ('7','25','9.00'), ('7','26','11.00'), ('7','27','10.00'), ('7','28','10.00'), ('8','13','13.00'), ('8','14','12.00');
INSERT INTO `NOTATION` VALUES ('8','15','12.00'), ('8','16','12.00'), ('8','17','10.00'), ('8','18','13.00'), ('8','19','12.00'), ('8','20','11.00'), ('8','21','10.00'), ('8','22','12.00'), ('8','25','10.00'), ('8','26','11.00'), ('8','27','12.00'), ('8','28','12.00'), ('9','13','18.00'), ('9','14','15.00'), ('9','15','16.00'), ('9','16','11.00'), ('9','17','16.00'), ('9','18','11.00'), ('9','19','13.00'), ('9','20','15.00'), ('9','21','15.00'), ('9','22','16.00'), ('9','25','16.00'), ('9','26','16.00'), ('9','27','15.00'), ('9','28','13.00'), ('10','13','9.00'), ('10','14','14.00'), ('10','15','7.00'), ('10','16','14.00'), ('10','17','5.00'), ('10','18','13.00'), ('10','19','11.00'), ('10','20','7.00'), ('10','21','12.00'), ('10','22','10.00'), ('10','25','4.00'), ('10','26','11.00'), ('10','27','16.00'), ('10','28','12.00'), ('11','1','17.00'), ('11','2','14.00'), ('11','3','10.00'), ('11','4','0.00'), ('11','5','0.00'), ('11','6','15.00'), ('11','7','16.00'), ('11','8','14.00'), ('11','9','16.00'), ('11','10','17.00'), ('11','11','15.00'), ('11','12','16.00'), ('11','23','15.00'), ('11','24','12.00'), ('12','1','16.00'), ('12','2','19.00'), ('12','3','13.00'), ('12','4','13.00'), ('12','5','0.00'), ('12','6','8.00'), ('12','7','15.00'), ('12','8','16.00'), ('12','9','7.00'), ('12','10','13.00'), ('12','11','14.00'), ('12','12','10.00'), ('12','23','17.00'), ('12','24','4.00'), ('13','1','11.00'), ('13','2','10.00'), ('13','3','3.00'), ('13','4','1.00'), ('13','5','3.00'), ('13','6','11.00'), ('13','7','12.00'), ('13','8','11.00'), ('13','9','1.00'), ('13','10','8.00'), ('13','11','9.00'), ('13','12','11.00'), ('13','23','11.00'), ('13','24','2.00'), ('14','1','15.00'), ('14','2','-1.00'), ('14','3','8.00'), ('14','4','5.00'), ('14','5','9.00'), ('14','6','17.00'), ('14','7','15.00'), ('14','8','14.00'), ('14','9','9.00'), ('14','10','13.00'), ('14','11','18.00'), ('14','12','12.00'), ('14','23','14.00'), ('14','24','12.00'), ('15','1','15.00'), ('15','2','9.00'), ('15','3','5.00'), ('15','4','4.00');
INSERT INTO `NOTATION` VALUES ('15','5','3.00'), ('15','6','13.00'), ('15','7','12.00'), ('15','8','15.00'), ('15','9','5.00'), ('15','10','13.00'), ('15','11','14.00'), ('15','12','10.00'), ('15','23','10.00'), ('15','24','6.00'), ('16','1','14.00'), ('16','2','18.00'), ('16','3','13.00'), ('16','4','9.00'), ('16','5','13.00'), ('16','6','16.00'), ('16','7','10.00'), ('16','8','14.00'), ('16','9','10.00'), ('16','10','14.00'), ('16','11','10.00'), ('16','12','9.00'), ('16','23','13.00'), ('16','24','7.00');
INSERT INTO `UE` VALUES ('1','UE1','UE1 - Formation générale','1','1.50','1'), ('2','UE1','UE1 - Formation générale','1','1.50','2'), ('3','UE8','UE8 - Mémoire','8','2.00','1'), ('4','UE7','UE7 - Projet industriel','7','1.50','2'), ('5','UE6 - RCA','UE6 - Réseau, Compléments et Applications','6','1.00','2'), ('6','UE5 - SAR','UE5 - Systèmes Applications Réparties','5','1.00','2'), ('7','UE4 - SE','UE4 - Système d\'Exploitation','4','1.00','2'), ('8','UE3 - RI','UE3 - Réseaux Informatiques','3','1.00','2'), ('9','UE8','UE8 - Mémoire','8','2.00','2'), ('10','UE2','UE2 - Adaptation','2','1.00','2'), ('11','UE7','UE7 - Projet industriel','7','1.50','1'), ('12','UE3 - PPO','UE3 - Programmation Par Objets','3','1.00','1'), ('13','UE4 - BD','UE4 - Base de Données','4','1.00','1'), ('14','UE5 - SAR','UE5 - Systèmes Applications Réparties','5','1.00','1'), ('15','UE6 - GL','UE6 - Génie Logiciel','6','1.00','1'), ('16','UE2','UE2 - Adaptation','2','1.00','1');
