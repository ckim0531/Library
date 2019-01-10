-- MySQL dump 10.13  Distrib 8.0.12, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: library
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `board_communication`
--

DROP TABLE IF EXISTS `board_communication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `board_communication` (
  `num` int(11) NOT NULL AUTO_INCREMENT,
  `id` varchar(45) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `subject` varchar(50) DEFAULT NULL,
  `content` varchar(2000) DEFAULT NULL,
  `readcount` int(11) DEFAULT NULL,
  `re_ref` int(11) DEFAULT NULL,
  `re_lev` int(11) DEFAULT NULL,
  `re_seq` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board_communication`
--

LOCK TABLES `board_communication` WRITE;
/*!40000 ALTER TABLE `board_communication` DISABLE KEYS */;
INSERT INTO `board_communication` VALUES (1,'admin','관리자','안녕하세요.','잘부탁드려요.',5,1,0,0,'2018-09-10'),(2,'ckim0531','김수정','어렵다.','살려줘',2,2,0,0,'2018-09-10'),(3,'ckim0531','김수정','어떻게하는거야','아무것도모르겠어',2,3,0,0,'2018-09-10'),(4,'ckim0531','김수정','잘하고싶다엉엉','쭈글쭈글',4,4,0,0,'2018-09-10'),(5,'ckim0531','김수정','하나도모르겠네','살려줘',13,5,0,0,'2018-09-10'),(6,'admin','관리자','코딩천재이고싶은','김수정',6,6,0,0,'2018-09-10'),(7,'admin','관리자','발표는','바알표오',6,7,0,0,'2018-09-10'),(10,'admin','관리자','속따가워','살려줘',97,10,0,0,'2018-09-10'),(11,'rlaQhQL','김뽀삐','잠온당','ㅠㅠ',18,11,0,0,'2018-09-11'),(12,'admin','관리자','집에보내줘..','ㅠㅠㅠㅠ',4,11,1,1,'2018-09-11'),(13,'admin','관리자','어떻게하는거야','흑흑',8,7,1,1,'2018-09-11'),(14,'admin','관리자','[답글]dfd','dfdfdf',6,0,1,3,'2018-09-12'),(15,'admin','관리자','안녕하세요.','dfdf',3,0,1,2,'2018-09-12'),(16,'admin','관리자','[답글]너무따갑네','병원가야되나',2,0,1,1,'2018-09-12'),(17,'admin','관리자','[답글] 진정이필요해','으악',3,10,1,1,'2018-09-13'),(18,'admin','관리자','[답글] 나도모르겠어','으앙',2,5,1,1,'2018-09-13'),(19,'admin','관리자','으히히히히히','히히히히히',3,19,0,0,'2018-09-13'),(20,'teset11','홍길동','aaa','aaa',7,20,0,0,'2018-09-13');
/*!40000 ALTER TABLE `board_communication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `board_notice`
--

DROP TABLE IF EXISTS `board_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `board_notice` (
  `num` int(11) NOT NULL AUTO_INCREMENT,
  `id` varchar(45) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `subject` varchar(50) DEFAULT NULL,
  `content` varchar(2000) DEFAULT NULL,
  `readcount` int(11) DEFAULT NULL,
  `re_ref` int(11) DEFAULT NULL,
  `re_lev` int(11) DEFAULT NULL,
  `re_seq` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `file` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board_notice`
--

LOCK TABLES `board_notice` WRITE;
/*!40000 ALTER TABLE `board_notice` DISABLE KEYS */;
INSERT INTO `board_notice` VALUES (1,NULL,'관리자','만14세 미만 회원가입안내','개인정보보호법 (14.08.07) 개정에 따라 \r\n주민번호에 따른 본인인증 금지되어 \r\n만14세미만의 경우에도 \r\n주민번호 본인인증의 대체수단인 \r\n휴대폰 및 아이핀 ( 마이핀)으로 \r\n본인인증이 되셔야 가입이 가능합니다. \r\n(만14세미만 가입자는 보호자 동의 필수)',2,1,0,0,'2018-09-02','bg_notice.png'),(2,NULL,'관리자','독서동아리 등록 안내','<신청대상>\r\n5인 이상이 모여 고양시 내에서 정기적으로 활동하거나 신규활동 예정인 독서 동아리 \r\n※ 종교 또는 상업적 목적으로 활동하는 독서동아리 제외 \r\n※ 특정 학습이나 독서 이외의 활동을 위한 동아리 제외',0,2,0,0,'2018-09-02','bg_notice1.png'),(3,NULL,'관리자','도서관 운영시간 변경안내',' 운영시간이 변경됨을 알려드립니다. \r\n이용에 참고해 주시기 바랍니다.',0,3,0,0,'2018-09-02','btn_next.png'),(4,NULL,'관리자','매월 마지막 주 수요일 문화가 있는 날, 대출권수 두배(1관당 14권)로 확대 안내','매월 마지막 주 수요일 문화가 있는 날, 공공도서관을 방문하시면 도서를 2배로 대출할 수 있습니다.',0,4,0,0,'2018-09-02','ico_save1.gif'),(5,NULL,'관리자','도서관 회원가입! 미리 집에서 해오시면 편리합니다','도서관 회원가입! 미리 집에서 해오시면 편리합니다',1,5,0,0,'2018-09-02','btn_next1.png'),(6,NULL,'관리자','주말(오후) 자원봉사자 모집','주말(오후) 자원봉사자 모집',1,6,0,0,'2018-09-02','notice_head2.gif'),(7,NULL,'관리자','디지털자료실 주말 성인 자원봉사자 모집','디지털자료실 주말 성인 자원봉사자 모집',0,7,0,0,'2018-09-02','notice_head3.gif'),(8,NULL,'관리자',' 한글그림책 읽어주기 자원활동가 모집',' 한글그림책 읽어주기 자원활동가 모집',1,8,0,0,'2018-09-02','notice_head4.gif'),(9,NULL,'관리자','<영어그림책과 함께하는 Play In English>진행시간 안내','<영어그림책과 함께하는 Play In English>진행시간 안내',0,9,0,0,'2018-09-02','btn_next2.png'),(10,NULL,'관리자','매주 목요일 그림책 읽어주는 도서관 휴강 안내','매주 목요일 그림책 읽어주는 도서관 휴강 안내',1,10,0,0,'2018-09-02','ico_save2.gif'),(11,NULL,'관리자','3층 열람실 사물함 설치관련 안내','3층 열람실 사물함 설치관련 안내',12,11,0,0,'2018-09-02','ico_save3.gif'),(12,NULL,'관리자','임시휴관 안내','임시휴관 안내',5,12,0,0,'2018-09-03','2010.jpg'),(13,'admin','관리자','오늘은발표날입니다','프로젝트가망한거같습니다',17,13,0,0,'2018-09-13',''),(14,'admin','관리자','dfdf','dfdf',2,14,0,0,'2018-09-13',''),(15,'admin','관리자','erer','erer',1,15,0,0,'2018-09-13',NULL),(16,'admin','관리자','qq','qq',1,16,0,0,'2018-09-13',NULL),(17,'admin','관리자','qwe','qweq',1,17,0,0,'2018-09-13',NULL),(18,'admin','관리자','df','dfdf',9,18,0,0,'2018-09-13',NULL),(19,'admin','관리자','df','dfdf',6,19,0,0,'2018-09-13',''),(20,'admin','관리자','df','dfdf',27,20,0,0,'2018-09-13',NULL),(21,'admin','관리자','공지사항 테스트','테스트',3,21,0,0,'2018-09-17',NULL);
/*!40000 ALTER TABLE `board_notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `board_press`
--

DROP TABLE IF EXISTS `board_press`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `board_press` (
  `num` int(11) NOT NULL AUTO_INCREMENT,
  `id` varchar(45) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `subject` varchar(50) DEFAULT NULL,
  `content` varchar(2000) DEFAULT NULL,
  `readcount` int(11) DEFAULT NULL,
  `re_ref` int(11) DEFAULT NULL,
  `re_lev` int(11) DEFAULT NULL,
  `re_seq` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `file` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board_press`
--

LOCK TABLES `board_press` WRITE;
/*!40000 ALTER TABLE `board_press` DISABLE KEYS */;
INSERT INTO `board_press` VALUES (1,'admin','관리자','ewew','wewe',12,1,0,0,'2018-09-10',''),(2,'admin','관리자','q','q',8,2,0,0,'2018-09-10','');
/*!40000 ALTER TABLE `board_press` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `book` (
  `book_num` int(11) NOT NULL AUTO_INCREMENT,
  `book_name` varchar(200) DEFAULT NULL,
  `book_author` varchar(45) DEFAULT NULL,
  `book_count` int(11) DEFAULT NULL,
  `book_date` date DEFAULT NULL,
  `book_image` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`book_num`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES (1,'돌이킬 수 없는 약속','야쿠마루 가쿠 저/김성미 역',3,'2018-09-14','돌이킬 수 없는 약속.jpg'),(2,'죽고 싶지만 떡볶이는 먹고 싶어','백세희',10,'2018-09-14','죽고 싶지만 떡볶이는 먹고 싶어.jpg'),(3,'역사의 역사','유시민',5,'2018-09-14','역사의 역사.jpg'),(4,'21세기를 위한 21가지 제언','유발 하라리 저/전병근 역',7,'2018-09-14','21세기를 위한 21가지 제언.jpg'),(5,'열두 발자국','정재승',5,'2018-09-14','열두 발자국.jpg'),(6,'저절로 몸에 새겨지는 몰입 영어','황농문',4,'2018-09-14','저절로 몸에 새겨지는 몰입 영어.jpg'),(7,'곰돌이 푸, 행복한 일은 매일 있어','곰돌이 푸 원작',5,'2018-09-14','곰돌이 푸, 행복한 일은 매일 있어.jpg'),(8,'살인의 문 1','히가시노 게이고 저/이혁재 역',5,'2018-09-14','살인의 문 1.jpg'),(9,'완벽하게 사랑하는 너에게','그림에다',6,'2018-09-14','완벽하게 사랑하는 너에게.jpg'),(10,'나미야 잡화점의 기적','히가시노 게이고 저/양윤옥 역',3,'2018-09-14','나미야 잡화점의 기적 (100만 부 기념 특별 한정판).jpg'),(11,'10년 동안 적금밖에 모르던 39세 김 과장은 어떻게 1년 만에 부동산 천재가 됐을까','김재수(렘군) ',5,'2018-09-14','10년 동안 적금밖에 모르던 39세 김 과장은 어떻게 1년 만에 부동산 천재가 됐을까.jpg'),(12,'방구석 미술관','조원재',5,'2018-09-14','방구석 미술관.jpg'),(13,'초격차','권오현 저/김상근 정리',5,'2018-09-14','초격차.jpg'),(14,'해리 1','공지영',5,'2018-09-14','해리 1.jpg'),(15,'수학이 필요한 순간','김민형',5,'2018-09-14','수학이 필요한 순간.jpg'),(16,'82년생 김지영','조남주',3,'2018-09-14','82년생 김지영.jpg'),(17,'언어의 온도','이기주',2,'2018-09-14','언어의 온도.jpg'),(18,'살인의 문 2','히가시노 게이고 저/이혁재 역 ',5,'2018-09-14','살인의 문 2.jpg'),(19,'결정, 흔들리지 않고 마음먹은 대로','애니 듀크 저/구세희 역',10,'2018-09-14','결정, 흔들리지 않고 마음먹은 대로.jpg'),(20,'2019 전한길 한국사 필기노트+빵꾸노트','전한길',10,'2018-09-14','2019 전한길 한국사 필기노트+빵꾸노트.jpg'),(21,'나는 나로 살기로 했다','김수현',4,'2018-09-14','나는 나로 살기로 했다.jpg'),(22,'나의 문화유산답사기 : 산사 순례','유홍준',7,'2018-09-14','나의 문화유산답사기 - 산사 순례.jpg'),(23,'부의 추월차선','엠제이 드마코 저/신소영 역',2,'2018-09-14','부의 추월차.jpg'),(24,'인생 우화','류시화 저/블라디미르 루바로프 그림',2,'2018-09-14','인생 우화.jpg'),(25,'2019 선재국어 기출실록','이선재',1,'2018-09-14','2019 선재국어 기출실록.jpg'),(26,'해커스 토익 실전 1000제 READING 1 문제집','해커스어학연구소',10,'2018-09-14','해커스 토익 실전 1000제 READING 1 문제집.jpg'),(27,'사피엔스','유발 하라리 저/조현욱 역',8,'2018-09-14','사피엔스.jpg'),(28,'하루 5분 엄마의 말습관','임영주',5,'2018-09-14','하루 5분 엄마의 말습관.jpg'),(29,'나의 가족, 사랑하나요?','전이수',3,'2018-09-14','나의 가족, 사랑하나요.jpg'),(30,'운을 부르는 부자의 말투','미야모토 마유미 저/김지윤 역',3,'2018-09-14','운을 부르는 부자의 말투.jpg'),(31,'서울이 아니어도 오를 곳은 오른다','김학렬(빠숑)',5,'2018-09-14','서울이 아니어도 오를 곳은 오른다.jpg'),(32,'해커스 토익 실전 1000제 LISTENING 1 문제집','해커스 어학연구소',3,'2018-09-14','해커스 토익 실전 1000제 LISTENING 1 문제집.jpg'),(33,'해리 2','공지영',5,'2018-09-14','해리 2.jpg'),(34,'모든 순간이 너였다','하태완',5,'2018-09-14','모든 순간이 너였다.jpg'),(35,'곰돌이 푸, 서두르지 않아도 괜찮아','곰돌이 푸 원작',10,'2018-09-14','곰돌이 푸, 서두르지 않아도 괜찮아.jpg'),(36,'매스커레이드 나이트','히가시노 게이고 저/양윤옥 역',3,'2018-09-14','매스커레이드 나이트.jpg'),(37,'설민석의 한국사 대모험 7','설민석, 스토리박스 글/정현희 그림',5,'2018-09-14','설민석의 한국사 대모험 7.jpg'),(38,'아흔일곱 번의 봄 여름 가을 겨울','이옥남',2,'2018-09-14','아흔일곱 번의 봄 여름 가을 겨울.jpg'),(39,'2019 선재국어 세트','이선재 ',2,'2018-09-14','2019 선재국어 세트.jpg'),(40,'하마터면 열심히 살 뻔했다','하완',3,'2018-09-14','하마터면 열심히 살 뻔했다.jpg'),(41,'놓지 마 과학! 8','신태훈 글/나승훈 그림',3,'2018-09-14','놓지 마 과학! 8.jpg'),(42,'해커스 토익 기출 보카','David Cho',4,'2018-09-14','해커스 토익 기출 보카.jpg'),(43,'2019 이동기 4주완성 핵심문법 700제 단원별 정리+실전문제','이동기',5,'2018-09-14','2019 이동기 4주완성 핵심문법 700제 단원별 정리+실전문제.jpg'),(44,'ETS TOEIC 토익 정기시험 기출문제집 RC 리딩','ETS',7,'2018-09-14','ETS TOEIC 토익 정기시험 기출문제집 RC 리딩.jpg'),(45,'나는 오늘도 경제적 자유를 꿈꾼다','청울림(유대열)',2,'2018-09-14','나는 오늘도 경제적 자유를 꿈꾼다.jpg'),(46,'2018 위포트 NCS 직업기초능력평가+직무수행능력평가','위포트 연구소',5,'2018-09-14','2018 위포트 NCS 직업기초능력평가+직무수행능력평가.jpg'),(47,'ETS TOEIC 토익 정기시험 기출문제집 LC 리스닝','ETS',9,'2018-09-14','ETS TOEIC 토익 정기시험 기출문제집 LC 리스닝.jpg'),(48,'2019 이동기 핵심문법 100포인트 요약노트','이동기',3,'2018-09-14','2019 이동기 핵심문법 100포인트 요약노트.jpg'),(49,'영어회화 100일의 기적','문성현',5,'2018-09-14','영어회화 100일의 기적.jpg'),(50,'하이큐!! 31','후루다테 하루이치 글그림',5,'2018-09-14','하이큐!! 31.jpg'),(51,'설민석의 조선왕조실록','설민석',6,'2018-09-14','설민석의 조선왕조실록.jpg'),(52,'무례한 사람에게 웃으며 대처하는 법','정문정',2,'2018-09-14','무례한 사람에게 웃으며 대처하는 법.jpg'),(53,'당신이 허락한다면 나는 이 말 하고 싶어요','김제동',6,'2018-09-14','당신이 허락한다면 나는 이 말 하고 싶어요.jpg'),(54,'어떻게 살 것인가','유시민',5,'2018-09-14','어떻게 살 것인가.jpg'),(55,'거울 속 외딴 성','츠지무라 미즈키 저/서혜영 역',4,'2018-09-14','거울 속 외딴 성.jpg'),(56,'고양이 1','베르나르 베르베르 저/전미연 역',5,'2018-09-14','고양이 1.jpg'),(57,'고양이 2','베르나르 베르베르 저/전미연 역',5,'2018-09-14','고양이 2.jpg'),(58,'연애의 기억','줄리언 반스 저/정영목 역',7,'2018-09-14','연애의 기억.jpg'),(59,'시크 : 하다','조승연',2,'2018-09-14','시크 하다.jpg'),(60,'설민석의 한국사 대모험 6 ','설민석, 스토리박스 글/정현희 그림',6,'2018-09-14','설민석의 한국사 대모험 6.jpg'),(61,'개인주의자 선언','문유석',1,'2018-09-14','개인주의자 선언.jpg'),(62,'슬픔을 공부하는 슬픔','신형철',2,'2018-09-14','슬픔을 공부하는 슬픔.jpg'),(63,'후 Who? special 손흥민','강진희 글/김광일 그림/안광필 감수',3,'2018-09-14','후 Who special 손흥민.jpg'),(64,'꼬부기와 쵸비라서 행복해','김지아',6,'2018-09-14','꼬부기와 쵸비라서 행복해.jpg'),(65,'해커스 토익 Reading (2018)','데이비드 조',5,'2018-09-14','해커스 토익 Reading (2018).jpg'),(66,'2018 하반기 해커스 GSAT 삼성직무적성검사 최신기출유형','해커스 취업교육연구소',3,'2018-09-14','2018 하반기 해커스 GSAT 삼성직무적성검사 최신기출유형.jpg'),(67,'익숙해질 때','투에고',10,'2018-09-14','익숙해질 때.jpg'),(68,'2018 위포트 서울교통공사 NCS 직업기초능력평가','위포트 연구소',2,'2018-09-14','2018 위포트 서울교통공사 NCS 직업기초능력평가.jpg'),(69,'호모 데우스','유발 하라리 저/김명주 역',4,'2018-09-14','호모 데우스.JPG'),(70,'한때 소중했던 것들','이기주',4,'2018-09-14','한때 소중했던 것들.jpg'),(71,'에듀윌 한국사능력검정시험 2주끝장 고급 개정판 3.0','한국사기출연구회',3,'2018-09-14','에듀윌 한국사능력검정시험 2주끝장 고급 개정판 3.0.jpg'),(72,'근데, 영화 한 편 씹어먹어 봤니?','신왕국',5,'2018-09-14','근데, 영화 한 편 씹어먹어 봤니.jpg'),(73,'2018 하반기 단기합격 해커스 NCS 직업기초능력평가+직무수행능력평가','김소원, 김태형, 윤종혁, 해커스 취업교육연구소',4,'2018-09-14','2018 하반기 단기합격 해커스 NCS 직업기초능력평가+직무수행능력평가.jpg'),(74,'소설 보다: 봄-여름 2018','조남주, 정지돈, 김혜진, 김봉곤',4,'2018-09-14','소설 보다 봄-여름 2018.jpg'),(75,'2019 신용한 COMPASS 행정학 최근 10년 단원별 기출문제집','신용한',2,'2018-09-14','2019 신용한 COMPASS 행정학 최근 10년 단원별 기출문제집.jpg'),(76,'자존감 수업','윤홍균',3,'2018-09-14','자존감 수업.jpg'),(77,'설민석의 통일 대모험 - 상','설민석 저/스토리박스 글/원프로 그림/태건 역사 연구소 감수',5,'2018-09-14','설민석의 통일 대모험 - 상.jpg'),(78,'어디서 살 것인가','유현준',3,'2018-09-14','어디서 살 것인가.jpg'),(79,'대한민국 아파트 부의 지도','이상우',1,'2018-09-14','대한민국 아파트 부의 지도.jpg'),(80,'있으려나 서점','요시타케 신스케 저/고향옥 역',1,'2018-09-14','있으려나 서점.jpg'),(81,'주무르고 늘리고','요시타케 신스케 글그림/유문조 그림',4,'2018-09-14','주무르고 늘리고.jpg'),(82,'설민석의 한국사 대모험 1','설민석',1,'2018-09-14','설민석의 한국사 대모험 1.jpg'),(83,'푸른 사자 와니니','이현 글 / 오윤화 그림',1,'2018-09-14','푸른 사자 와니니.jpg'),(84,'전설로 떠나는 월가의 영웅','피터 린치, 존 로스차일드 저/이건 역',2,'2018-09-14','전설로 떠나는 월가의 영웅.jpg'),(85,'해커스 토익 Listening (2018)','데이비드 조',2,'2018-09-14','해커스 토익 Listening (2018).jpg'),(86,'오버로드 13','마루야마 쿠가네 저',1,'2018-09-14','오버로드 13.jpg'),(87,'슬램덩크 신장재편판 7','이노우에 타케히코 글그림',2,'2018-09-14','슬램덩크 신장재편판 7.jpg'),(88,'2018 하반기 해커스 GSAT 삼성직무적성검사 실전모의고사','해커스 취업교육연구소',1,'2018-09-14','2018 하반기 해커스 GSAT 삼성직무적성검사 실전모의고사.jpg'),(89,'슬램덩크 신장재편판 8','이노우에 타케히코 글그림',1,'2018-09-14','슬램덩크 신장재편판 8.jpg'),(90,'슬램덩크 신장재편판 9','이노우에 타케히코 글그림',2,'2018-09-14','슬램덩크 신장재편판 9.jpg'),(91,'설민석의 한국사 대모험 2','설민석',5,'2018-09-14','설민석의 한국사 대모험 2.jpg'),(92,'슬램덩크 신장재편판 10','이노우에 타케히코 글그림',2,'2018-09-14','슬램덩크 신장재편판 10.jpg'),(93,'임플란트 전쟁','고광욱',2,'2018-09-14','임플란트 전쟁.jpg'),(94,'모두 거짓말을 한다','세스 스티븐스 다비도위츠 저/이영래 역',5,'2018-09-14','모두 거짓말을 한다.jpg'),(95,'착! 붙는 일본어 독학 첫걸음','일본어 공부기술연구소',6,'2018-09-14','착! 붙는 일본어 독학 첫걸음.jpg'),(96,'2018 바리스타 2급 자격시험 예상문제집','(주)한국커피협회',3,'2018-09-14','2018 바리스타 2급 자격시험 예상문제집.jpg'),(97,'설민석의 한국사 대모험 5','설민석, 스토리박스 글/정현희 그림',2,'2018-09-14','설민석의 한국사 대모험 5.jpg'),(98,'큰별쌤 최태성의 별★별 한국사 한국사능력검정시험 고급(1·2급) 상','최태성',2,'2018-09-14','큰별쌤 최태성의 별★별 한국사 한국사능력검정시험 고급(1·2급) 상.jpg'),(99,'데이터 분석의 힘','이토 고이치로 저/이학배 감수/전선영 역',1,'2018-09-14','데이터 분석의 힘.jpg'),(100,'아파트 언제 어디를 살까요','신준섭',1,'2018-09-14','아파트 언제 어디를 살까요.jpg'),(101,'2019 손진숙 영문법 900제','손진숙',2,'2018-09-15','2019 손진숙 영문법 900제.jpg');
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment_communication`
--

DROP TABLE IF EXISTS `comment_communication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `comment_communication` (
  `comment_num` int(11) NOT NULL AUTO_INCREMENT,
  `communication_num` int(11) DEFAULT NULL,
  `comment_id` varchar(20) DEFAULT NULL,
  `comment_name` varchar(20) DEFAULT NULL,
  `comment_date` date DEFAULT NULL,
  `comment_content` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`comment_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment_communication`
--

LOCK TABLES `comment_communication` WRITE;
/*!40000 ALTER TABLE `comment_communication` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment_communication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment_notice`
--

DROP TABLE IF EXISTS `comment_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `comment_notice` (
  `comment_num` int(11) NOT NULL,
  `notice_num` int(11) DEFAULT NULL,
  `comment_id` varchar(20) DEFAULT NULL,
  `comment_name` varchar(20) DEFAULT NULL,
  `comment_date` date DEFAULT NULL,
  `comment_content` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`comment_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment_notice`
--

LOCK TABLES `comment_notice` WRITE;
/*!40000 ALTER TABLE `comment_notice` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment_notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment_press`
--

DROP TABLE IF EXISTS `comment_press`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `comment_press` (
  `comment_num` int(11) NOT NULL,
  `press_num` int(11) DEFAULT NULL,
  `comment_id` varchar(20) DEFAULT NULL,
  `comment_name` varchar(20) DEFAULT NULL,
  `comment_date` date DEFAULT NULL,
  `comment_content` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`comment_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment_press`
--

LOCK TABLES `comment_press` WRITE;
/*!40000 ALTER TABLE `comment_press` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment_press` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `member` (
  `num` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `id` varchar(45) DEFAULT NULL,
  `pass` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `addr` varchar(200) DEFAULT NULL,
  `reg_date` date DEFAULT NULL,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES (1,'관리자','admin','admin','admin@admin.com',NULL,NULL),(4,'김뽀삐','rlaQhQL','1234567890','a@aaaaa','null/null/null','2018-09-06'),(5,'홍길동','teset11','1234567890','admin@itwill.comdfddfdf','null/null/null','2018-09-13');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-01-10 23:19:21
