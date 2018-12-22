
create database hms;
grant all privileges on hms.* to root@localhost identified by 'root';

CREATE TABLE `cities` (
  `city_id` int(11) NOT NULL,
  `city_name` varchar(45) DEFAULT NULL,
  `state_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`city_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `countries` (
  `country_id` int(11) NOT NULL,
  `country_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`country_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `department` (
  `dept_id` int(11) NOT NULL,
  `department_name` varchar(45) DEFAULT NULL,
  `location_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `doctor` (
  `doct_id` int(11) NOT NULL,
  `doctor_name` varchar(45) DEFAULT NULL,
  `department_name` varchar(45) DEFAULT NULL,
  `qualification` varchar(45) DEFAULT NULL,
  `location` varchar(45) DEFAULT NULL,
  `experience` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`doct_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `enquire` (
  `Eno` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `contactNo` varchar(45) DEFAULT NULL,
  `country` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `speciality` varchar(45) DEFAULT NULL,
  `comment` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`Eno`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

CREATE TABLE `logincredentials` (
  `user_name` varchar(20) NOT NULL,
  `password` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `patientreferrals` (
  `patientRefNo` int(11) NOT NULL AUTO_INCREMENT,
  `referer_type` varchar(45) DEFAULT NULL,
  `patient_name` varchar(45) DEFAULT NULL,
  `patient_dob` varchar(45) DEFAULT NULL,
  `patient_mob` varchar(45) DEFAULT NULL,
  `email_id` varchar(45) DEFAULT NULL,
  `referer_name` varchar(45) DEFAULT NULL,
  `referer_mob` varchar(45) DEFAULT NULL,
  `referer_email` varchar(45) DEFAULT NULL,
  `referer_address` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`patientRefNo`),
  UNIQUE KEY `patientRefNo_UNIQUE` (`patientRefNo`)
) ENGINE=InnoDB AUTO_INCREMENT=10008 DEFAULT CHARSET=latin1;

CREATE TABLE `plocation` (
  `location_id` int(11) NOT NULL,
  `location_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`location_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `speciality` (
  `speciality_id` int(11) NOT NULL,
  `speciality_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`speciality_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `states` (
  `state_id` int(11) NOT NULL,
  `state_name` varchar(45) DEFAULT NULL,
  `country_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`state_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `appointment` (
  `id_appointment` int(5) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `sex` varchar(45) DEFAULT NULL,
  `contact_no` varchar(45) DEFAULT NULL,
  `email_address` varchar(45) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `location` varchar(45) DEFAULT NULL,
  `department` varchar(45) DEFAULT NULL,
  `doctor` varchar(45) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_appointment`),
  UNIQUE KEY `id_appointment_UNIQUE` (`id_appointment`)
) ENGINE=InnoDB AUTO_INCREMENT=10014 DEFAULT CHARSET=latin1;

CREATE TABLE `billinginfo` (
  `sno` int(11) NOT NULL,
  `serviceOffered` varchar(45) DEFAULT NULL,
  `price` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`sno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



INSERT INTO `billinginfo` (`sno`,`serviceOffered`,`price`) VALUES (1,'CONSULTING','80$');
INSERT INTO `billinginfo` (`sno`,`serviceOffered`,`price`) VALUES (2,'XRAY','40$');
INSERT INTO `billinginfo` (`sno`,`serviceOffered`,`price`) VALUES (3,'BLOOD TEST','30$');
INSERT INTO `billinginfo` (`sno`,`serviceOffered`,`price`) VALUES (4,'ENDOSCOPY','70$');
INSERT INTO `billinginfo` (`sno`,`serviceOffered`,`price`) VALUES (5,'ABDOMEN SCANNING','90$');
INSERT INTO `billinginfo` (`sno`,`serviceOffered`,`price`) VALUES (6,'ICU PER DAY','400$');
INSERT INTO `billinginfo` (`sno`,`serviceOffered`,`price`) VALUES (7,'SINGLE ROOM PER DAY','200$');
INSERT INTO `billinginfo` (`sno`,`serviceOffered`,`price`) VALUES (8,'SHARING ROOM PER DAY','150$');



INSERT INTO `department` (`dept_id`,`department_name`,`location_name`) VALUES (1001,'Neurology','warrensburg');
INSERT INTO `department` (`dept_id`,`department_name`,`location_name`) VALUES (1002,'Gastreoenterology','StLouis');
INSERT INTO `department` (`dept_id`,`department_name`,`location_name`) VALUES (1003,'Physiotherapy','LeeSummit');

INSERT INTO `doctor` (`doct_id`,`doctor_name`,`department_name`,`qualification`,`location`,`experience`) VALUES (1,'Lara','Neurology','MD,MBBS','Warrensburg','2Years');
INSERT INTO `doctor` (`doct_id`,`doctor_name`,`department_name`,`qualification`,`location`,`experience`) VALUES (2,'Karl','Gastreoenterology','MD,MBBS','StLouis','2Years');
INSERT INTO `doctor` (`doct_id`,`doctor_name`,`department_name`,`qualification`,`location`,`experience`) VALUES (3,'Joseph','Physiotherapy','MBBS','LeeSummit','3Years');
INSERT INTO `doctor` (`doct_id`,`doctor_name`,`department_name`,`qualification`,`location`,`experience`) VALUES (4,'Williams','Neurology','MD,MBBS','StLouis','4Years');

INSERT INTO `logincredentials` (`user_name`,`password`) VALUES ('praveen','praveen');


INSERT INTO `plocation` (`location_id`,`location_name`) VALUES (101,'Warrensburg');
INSERT INTO `plocation` (`location_id`,`location_name`) VALUES (102,'St. Louis');
INSERT INTO `plocation` (`location_id`,`location_name`) VALUES (103,'Lee Summit');



INSERT INTO `speciality` (`speciality_id`,`speciality_name`) VALUES (1,'Accident');
INSERT INTO `speciality` (`speciality_id`,`speciality_name`) VALUES (2,'Cardiology');
INSERT INTO `speciality` (`speciality_id`,`speciality_name`) VALUES (3,'Gastroenterology');


INSERT INTO `countries` (`country_id`,`country_name`) VALUES (101,'UNITED STATES');


INSERT INTO `states` (`state_id`,`state_name`,`country_name`) VALUES (1,'Alabama','UNITED STATES');
INSERT INTO `states` (`state_id`,`state_name`,`country_name`) VALUES (2,'Alaska ','UNITED STATES');
INSERT INTO `states` (`state_id`,`state_name`,`country_name`) VALUES (3,'Arizona','UNITED STATES');
INSERT INTO `states` (`state_id`,`state_name`,`country_name`) VALUES (4,'Arkansas','UNITED STATES');
INSERT INTO `states` (`state_id`,`state_name`,`country_name`) VALUES (5,'California','UNITED STATES');
INSERT INTO `states` (`state_id`,`state_name`,`country_name`) VALUES (6,'Colorado','UNITED STATES');
INSERT INTO `states` (`state_id`,`state_name`,`country_name`) VALUES (7,'Connecticut','UNITED STATES');
INSERT INTO `states` (`state_id`,`state_name`,`country_name`) VALUES (8,'Delaware','UNITED STATES');
INSERT INTO `states` (`state_id`,`state_name`,`country_name`) VALUES (9,'Florida ','UNITED STATES');
INSERT INTO `states` (`state_id`,`state_name`,`country_name`) VALUES (10,'Georgia ','UNITED STATES');
INSERT INTO `states` (`state_id`,`state_name`,`country_name`) VALUES (11,'Hawaii','UNITED STATES');
INSERT INTO `states` (`state_id`,`state_name`,`country_name`) VALUES (12,'Idaho ','UNITED STATES');
INSERT INTO `states` (`state_id`,`state_name`,`country_name`) VALUES (13,'Illinois','UNITED STATES');
INSERT INTO `states` (`state_id`,`state_name`,`country_name`) VALUES (14,'Indiana','UNITED STATES');
INSERT INTO `states` (`state_id`,`state_name`,`country_name`) VALUES (15,'Iowa','UNITED STATES');
INSERT INTO `states` (`state_id`,`state_name`,`country_name`) VALUES (16,'Kansas','UNITED STATES');
INSERT INTO `states` (`state_id`,`state_name`,`country_name`) VALUES (17,'Kentucky','UNITED STATES');
INSERT INTO `states` (`state_id`,`state_name`,`country_name`) VALUES (18,'Louisiana ','UNITED STATES');
INSERT INTO `states` (`state_id`,`state_name`,`country_name`) VALUES (19,'Maine ','UNITED STATES');
INSERT INTO `states` (`state_id`,`state_name`,`country_name`) VALUES (20,'Maryland','UNITED STATES');
INSERT INTO `states` (`state_id`,`state_name`,`country_name`) VALUES (21,'Massachusetts','UNITED STATES');
INSERT INTO `states` (`state_id`,`state_name`,`country_name`) VALUES (22,'Michigan','UNITED STATES');
INSERT INTO `states` (`state_id`,`state_name`,`country_name`) VALUES (23,'Minnesota ','UNITED STATES');
INSERT INTO `states` (`state_id`,`state_name`,`country_name`) VALUES (24,'Mississippi ','UNITED STATES');
INSERT INTO `states` (`state_id`,`state_name`,`country_name`) VALUES (25,'Missouri ','UNITED STATES');
INSERT INTO `states` (`state_id`,`state_name`,`country_name`) VALUES (26,'Montana','UNITED STATES');
INSERT INTO `states` (`state_id`,`state_name`,`country_name`) VALUES (27,'Nebraska','UNITED STATES');
INSERT INTO `states` (`state_id`,`state_name`,`country_name`) VALUES (28,'Nevada ','UNITED STATES');
INSERT INTO `states` (`state_id`,`state_name`,`country_name`) VALUES (29,'New Hampshire','UNITED STATES');
INSERT INTO `states` (`state_id`,`state_name`,`country_name`) VALUES (30,'New Jersey ','UNITED STATES');
INSERT INTO `states` (`state_id`,`state_name`,`country_name`) VALUES (31,'New Mexico','UNITED STATES');
INSERT INTO `states` (`state_id`,`state_name`,`country_name`) VALUES (32,'New York ','UNITED STATES');
INSERT INTO `states` (`state_id`,`state_name`,`country_name`) VALUES (33,'North Carolina','UNITED STATES');
INSERT INTO `states` (`state_id`,`state_name`,`country_name`) VALUES (34,'North Dakota','UNITED STATES');
INSERT INTO `states` (`state_id`,`state_name`,`country_name`) VALUES (35,'Ohio','UNITED STATES');
INSERT INTO `states` (`state_id`,`state_name`,`country_name`) VALUES (36,'Oklahoma','UNITED STATES');
INSERT INTO `states` (`state_id`,`state_name`,`country_name`) VALUES (37,'Oregon ','UNITED STATES');
INSERT INTO `states` (`state_id`,`state_name`,`country_name`) VALUES (38,'Pennsylvania','UNITED STATES');
INSERT INTO `states` (`state_id`,`state_name`,`country_name`) VALUES (39,'Rhode Island ','UNITED STATES');
INSERT INTO `states` (`state_id`,`state_name`,`country_name`) VALUES (40,'South Carolina','UNITED STATES');
INSERT INTO `states` (`state_id`,`state_name`,`country_name`) VALUES (41,'South Dakota ','UNITED STATES');
INSERT INTO `states` (`state_id`,`state_name`,`country_name`) VALUES (42,'Tennessee','UNITED STATES');
INSERT INTO `states` (`state_id`,`state_name`,`country_name`) VALUES (43,'Texas ','UNITED STATES');
INSERT INTO `states` (`state_id`,`state_name`,`country_name`) VALUES (44,'Utah','UNITED STATES');
INSERT INTO `states` (`state_id`,`state_name`,`country_name`) VALUES (45,'Vermont ','UNITED STATES');
INSERT INTO `states` (`state_id`,`state_name`,`country_name`) VALUES (46,'Virginia','UNITED STATES');
INSERT INTO `states` (`state_id`,`state_name`,`country_name`) VALUES (47,'Washington','UNITED STATES');
INSERT INTO `states` (`state_id`,`state_name`,`country_name`) VALUES (48,'West Virginia','UNITED STATES');
INSERT INTO `states` (`state_id`,`state_name`,`country_name`) VALUES (49,'Wisconsin ','UNITED STATES');
INSERT INTO `states` (`state_id`,`state_name`,`country_name`) VALUES (50,'Wyoming ','UNITED STATES');



INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1001,'Birmingham','Alabama');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1002,'Huntsville','Alabama');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1003,'Auburn','Alabama');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1004,'Anchorage','Alaska ');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1005,'Fairbanks','Alaska ');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1006,'Juneau','Alaska ');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1007,'Phoenix','Arizona ');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1008,'Tucson','Arizona ');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1009,'Scottsdale','Arizona ');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1010,'Little Rock','Arkansas');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1011,'Fayetteville','Arkansas');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1012,'Fort Smith','Arkansas');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1013,'Los Angeles','California');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1014,'San Francisco','California');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1015,'San Diego','California');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1016,'Denver','Colorado');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1017,'Colorado Springs','Colorado');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1018,'Boulder','Colorado');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1019,'New Haven','Connecticut');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1020,'Stamford','Connecticut');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1021,'Bridgeport','Connecticut');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1022,'Wilmington','Delaware');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1023,'Newark','Delaware');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1024,'Dover','Delaware');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1025,'Miami','Florida ');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1026,'Orlando','Florida ');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1027,'Tampa','Florida ');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1028,'Atlanta','Georgia');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1029,'Savannah','Georgia');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1030,'Augusta','Georgia');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1031,'Volcano','Hawaii');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1032,'Hilo','Hawaii');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1033,'Kapolei','Hawaii');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1034,'Boise','Idaho');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1035,'Nampa','Idaho');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1036,'Idaho Falls','Idaho');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1037,'Chicago','Illinois');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1038,'Peoria','Illinois');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1039,'Rockford','Illinois');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1040,'Indianapolis','Indiana');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1041,'Bloomington','Indiana');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1042,'Fort Wayne','Indiana');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1043,'Des Moines','Iowa');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1044,'Cedar Rapids','Iowa');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1045,'Iowa City','Iowa');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1046,'Overland Park','Kansas ');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1047,'Kansas City','Kansas ');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1048,'Wichita ','Kansas ');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1049,'Louisville','Kentucky');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1050,'Lexington','Kentucky');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1051,'Frankfort','Kentucky');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1052,'New Orleans','Louisiana');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1053,'Lafayette','Louisiana');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1054,'Baton Rouge','Louisiana');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1055,'Portland','Maine');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1056,'Bangor','Maine');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1057,'Augusta','Maine');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1058,'Baltimore','Maryland');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1059,'Frederick','Maryland');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1060,'Annapolis','Maryland');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1061,'Boston','Massachusetts');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1062,'Cambridge','Massachusetts');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1063,'Springfield','Massachusetts');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1064,'Detroit','Michigan');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1065,'Grand Rapids','Michigan');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1066,'Ann Arbor','Michigan');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1067,'Minneapolis','Minnesota');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1068,'Saint Paul','Minnesota');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1069,'Eagan','Minnesota');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1070,'Jackson','Mississippi ');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1071,'Hattiesburg','Mississippi ');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1072,'Tupelo','Mississippi ');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1073,'St. Louis','Missouri ');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1074,'Warrensburg','Missouri ');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1075,'Sedalia','Missouri ');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1076,'Billings','Montana ');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1077,'Missoula','Montana ');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1078,'Bozeman','Montana ');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1079,'Omaha','Nebraska ');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1080,'Lincoln','Nebraska ');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1081,'Grand Island','Nebraska ');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1082,'Las Vegas','Nevada');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1083,'Reno','Nevada');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1084,'Henderson','Nevada');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1085,'Manchester','New Hampshire');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1086,'Concord','New Hampshire');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1087,'North Hampton','New Hampshire');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1088,'Jersey City','New Jersey ');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1089,'Trenton','New Jersey ');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1090,'Atlantic City','New Jersey ');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1091,'Santa Fe','New Mexico');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1092,'Las Cruces','New Mexico');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1093,'Roswell','New Mexico');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1094,'New York City','New York ');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1095,'Rochester','New York ');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1096,'Buffalo','New York ');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1097,'Raleigh','North Carolina');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1098,'Durham','North Carolina');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1099,'Concord','North Carolina');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1100,'Fargo','North Dakota');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1101,'Bismarck','North Dakota');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1102,'Dickinson','North Dakota');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1103,'Columbus','Ohio');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1104,'Cleveland','Ohio');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1105,'Cincinnati','Ohio');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1106,'Oklahoma City','Oklahoma');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1107,'Tulsa','Oklahoma');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1108,'Norman','Oklahoma');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1109,'Salem','Oregon ');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1110,'Beaverton','Oregon ');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1111,'Corvallis','Oregon ');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1112,'Philadelphia','Pennsylvania ');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1113,'Pittsburgh','Pennsylvania ');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1114,'Harrisburg','Pennsylvania ');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1115,'Providence','Rhode Island ');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1116,'Newport','Rhode Island ');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1117,'Warwick','Rhode Island ');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1118,'Charleston','South Carolina');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1119,'Greenville','South Carolina');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1120,'Florence','South Carolina');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1121,'Sioux Falls','South Dakota');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1122,'Rapid City','South Dakota');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1123,'Aberdeen','South Dakota');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1124,'Nashville','Tennessee');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1125,'Memphis','Tennessee');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1126,'Knoxville','Tennessee');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1127,'Houston','Texas');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1128,'Dallas','Texas');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1129,'Austin','Texas');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1130,'Salt Lake City','Utah');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1131,'St. George','Utah');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1132,'Park City','Utah');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1133,'Burlington','Vermont ');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1134,'Essex','Vermont ');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1135,'Manchester','Vermont ');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1136,'Richmond','Virginia ');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1137,'Alexandria','Virginia ');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1138,'Charlottesville','Virginia ');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1139,'Seattle','Washington');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1140,'Vancouver','Washington');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1141,'Olympia','Washington');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1142,'Parkersburg','West Virginia');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1143,'Huntington','West Virginia');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1144,'Morgantown','West Virginia');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1145,'Madison','Wisconsin ');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1146,'Green Bay','Wisconsin ');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1147,'Janesville','Wisconsin ');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1148,'Cheyenne','Wyoming');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1149,'Casper','Wyoming');
INSERT INTO `cities` (`city_id`,`city_name`,`state_name`) VALUES (1150,'Jackson','Wyoming');




