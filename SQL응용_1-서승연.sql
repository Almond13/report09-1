DROP DATABASE IF EXISTS movie_db;
DROP USER IF EXISTS movie_db@localhost;
CREATE DATABASE IF NOT EXISTS movie_db;
CREATE USER movie_db@localhost IDENTIFIED WITH mysql_native_password by 'movie_db';
GRANT ALL PRIVILEGES ON movie_db.* TO movie_db@localhost WITH GRANT OPTION;
SHOW databases;

USE movie_db;

CREATE TABLE 장르(
	장르코드 VARCHAR(10) NOT NULL,
    장르명 VARCHAR(20) NOT NULL,
    PRIMARY KEY (장르코드)
  );
DESC 장르;

CREATE TABLE 영화(
	영화코드 VARCHAR(10) NOT NULL,
    제목 VARCHAR(30) NOT NULL UNIQUE,
    제작년도 DATE,
    상영시간 VARCHAR(20),
    개봉일자 DATE,
    제작사 VARCHAR(30) NOT NULL,
    배급사 VARCHAR(30) NOT NULL,
    장르코드 VARCHAR(10),
    PRIMARY KEY (영화코드),
    FOREIGN KEY (장르코드) REFERENCES 장르(장르코드)
    );
    DESC 영화;

CREATE TABLE 감독 (
	감독등록번호 VARCHAR(10) NOT NULL,
    이름 VARCHAR(10) NOT NULL,
    성별 ENUM('남', '여') NOT NULL DEFAULT '남',
    출생일 DATE,
    출생지 VARCHAR(45),
    학력사항 VARCHAR(20),
    PRIMARY KEY (감독등록번호)
  );
DESC 감독;

CREATE TABLE 배우(
    주민번호 VARCHAR(15) NOT NULL,
    이름 VARCHAR(10) NOT NULL,
    성별 ENUM('남', '여') NOT NULL DEFAULT '남',
    출생일 DATE,
    출생지 VARCHAR(45),
    키 VARCHAR(10),
    몸무게 VARCHAR(10),
    혈액형 ENUM('A', 'B', 'O', 'AB'),
  PRIMARY KEY (주민번호)
  );
DESC 배우;
    
CREATE TABLE 감독과영화(
    감독등록번호 VARCHAR(10) NOT NULL,
    영화코드 VARCHAR(10) NOT NULL,
    PRIMARY KEY (감독등록번호,영화코드),
    FOREIGN KEY (감독등록번호) REFERENCES 감독(감독등록번호),
    FOREIGN KEY (영화코드) REFERENCES 영화(영화코드)
    );
    DESC 감독과영화;

CREATE TABLE 배우와영화(
	배우주민번호 VARCHAR(15) NOT NULL,
    영화코드 VARCHAR(10) NOT NULL,
    PRIMARY KEY (배우주민번호, 영화코드),
    FOREIGN KEY (배우주민번호) REFERENCES 배우(주민번호),
    FOREIGN KEY (영화코드) REFERENCES 영화(영화코드)
    );
DESC 배우와영화;
    
SHOW TABLES;


-- 3번 자료입력----------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO 장르 VALUES('000112','로맨스');
INSERT INTO 장르 VALUES('000113','어드밴처');
INSERT INTO 장르 VALUES('000114','Romantic comedy');
INSERT INTO 장르 VALUES('000115','판타지');
INSERT INTO 장르 VALUES('000116','포르노');
SELECT * FROM 장르 ORDER BY 장르.장르명 ASC;

INSERT INTO 영화 VALUES('20081230','쌍화점','2006-12-29','월~금 20:30~22:30','2008-12-30','쌍화점 제작사','쇼박스','000116');
INSERT INTO 영화 VALUES('20220316','메리미','2020-03-17','수,목,토 18:00~20:00','2022-03-16','메리미 제작사','유니버설 픽쳐스','000112');
INSERT INTO 영화 VALUES('20220126','해적:도깨비 깃발','2020-01-27','토,일 18:00~20:00','2022-01-26','해적 제작사','롯데엔터테이먼트','000113');
INSERT INTO 영화 VALUES('20220229','듄','2019-03-01','매일 13:00~15:00','2022-02-09','듄 제작사','워너 브라더스 코리아','000113');
INSERT INTO 영화 VALUES('20220711','해리포터와불사조기사단','2020-07-12','매일 15:20~17:20','2022-07-11','해리포터 제작사','워너 브라더스 코리아','000115');
INSERT INTO 영화 VALUES('20131205','어바웃타임','2010-12-01','수~일 08:40~10:40','2013-12-05','어바웃타임 제작사','유니버설 픽쳐스','000114');
INSERT INTO 영화 VALUES('20140813','비긴어게인','2012-08-14','월~금 21:10~23:10','2014-08-13','비긴어게인 제작사','판씨네마','000114');
SELECT * FROM 영화 ORDER BY 영화.제목 ASC;

INSERT INTO 감독 VALUES('1001','강감독','여','1960-01-11','한국','한국 고등학교 졸업');
INSERT INTO 감독 VALUES('1002','유하','남','1980-02-02','한국','한국 영화학과 학사과정 졸업');
INSERT INTO 감독 VALUES('1003','드니 빌뇌르','남','1978-03-03','캐나다','캐나다 영화학과 박사과정 졸업');
INSERT INTO 감독 VALUES('1004','데이빗 예이츠','남','1958-04-05','영국','영국 영화학과 박사과정 졸업');
INSERT INTO 감독 VALUES('1005','리차드커티스','남','1960-05-04','영국','영국 영화학과 학사과정 졸업');
INSERT INTO 감독 VALUES('1006','존 카니','남','1988-06-07','미국','미국 고등학교 졸업');
SELECT * FROM 감독 ORDER BY 감독.감독등록번호;

INSERT INTO 배우 VALUES('900201-2134567','이여주','여','1990-02-01','한국','168cm','비공개','B');
INSERT INTO 배우 VALUES('870302-1234567','최남주','남','1987-03-02','한국','183cm','78kg','AB');
INSERT INTO 배우 VALUES('750403-1345678','조인성','남','1975-04-03','한국','187cm','85kg','A');
INSERT INTO 배우 VALUES('790605-1567890','티모시 샬라메','남','1979-06-05','캐나다','185cm','79kg','A');
INSERT INTO 배우 VALUES('850504-1456789','다니엘 래드클리프','남','1985-05-04','영국','180cm','80kg','O');
INSERT INTO 배우 VALUES('800716-2678901','레이첼 맥아담스','여','1980-07-16','영국','175cm','비공개','B');
INSERT INTO 배우 VALUES('671122-1789012','마크 러팔로','남','1967-11-22','미국','173cm','83kg','A');
SELECT * FROM 배우 ORDER BY 배우.주민번호;

INSERT INTO 감독과영화 VALUES('1001','20220316');
INSERT INTO 감독과영화 VALUES('1001','20220126');
INSERT INTO 감독과영화 VALUES('1002','20081230');
INSERT INTO 감독과영화 VALUES('1003','20220229');
INSERT INTO 감독과영화 VALUES('1004','20220711');
INSERT INTO 감독과영화 VALUES('1005','20131205');
INSERT INTO 감독과영화 VALUES('1006','20140813');
SELECT * FROM 감독과영화 ORDER BY 감독과영화.감독등록번호 ASC;

INSERT INTO 배우와영화 VALUES('900201-2134567','20220316');
INSERT INTO 배우와영화 VALUES('900201-2134567','20220126');
INSERT INTO 배우와영화 VALUES('870302-1234567','20220316');
INSERT INTO 배우와영화 VALUES('750403-1345678','20081230');
INSERT INTO 배우와영화 VALUES('790605-1567890','20220229');
INSERT INTO 배우와영화 VALUES('850504-1456789','20220711');
INSERT INTO 배우와영화 VALUES('800716-2678901','20131205');
INSERT INTO 배우와영화 VALUES('671122-1789012','20140813');
SELECT * FROM 배우와영화 ORDER BY 배우와영화.배우주민번호 ASC;

-- ----------------------------------------------------------------------------------------------------------------------------------------------------------


-- 4번 2020년에 제작된 장르별 영화의 편수----------------------------------------------------------------------------------------------------------

SELECT 장르.장르명 AS 장르, COUNT(영화.장르코드) AS 제작편수 FROM 장르 JOIN 영화 ON 장르.장르코드=영화.장르코드 GROUP BY 장르.장르코드;

-- ------------------------------------------------------------------------------------------------------------------------------------------------


-- 5번 Romantic comedy에 출연하지 않은 배우목록----------------------------------------------------------------------------------------------------------

SELECT DISTINCT 배우.이름 
FROM 배우 JOIN 배우와영화 ON 배우.주민번호=배우와영화.배우주민번호 JOIN 영화 ON 영화.영화코드=배우와영화.영화코드 JOIN 장르 ON 장르.장르코드=영화.장르코드 
WHERE 장르.장르명 NOT IN('romantic comedy');

-- --------------------------------------------------------------------------------------------------------------------------------------------------------


-- 6번 장르명이 ‘Romantic comedy’인 자료의 장르코드와 장르명을 각각 ‘000111“,”로맨틱 코미디“로 변경----------------------------------------------------------

-- 변경전
SELECT * FROM 장르 ORDER BY 장르.장르명 ASC;

SET foreign_key_checks=0;
UPDATE 장르 SET 장르.장르코드 = '000111', 장르.장르명 = '로맨틱 코미디' 
WHERE 장르.장르명 = 'Romantic comedy';
SET foreign_key_checks=1;

-- 변경후
SELECT * FROM 장르 ORDER BY 장르.장르명 ASC;
-- --------------------------------------------------------------------------------------------------------------------------------------------------------


-- 7번 장르가 포르노에 대한 모든것 삭제--------------------------------------------------------------------------------------------------------------------
SET foreign_key_checks=0;


SELECT * FROM 감독과영화 ORDER BY 감독과영화.감독등록번호 ASC;
DELETE FROM 감독과영화 WHERE 감독과영화.영화코드 =(
SELECT 영화.영화코드 
FROM 영화 JOIN 장르 ON 영화.장르코드=장르.장르코드 
WHERE 장르.장르코드 ='000116'
);
SELECT * FROM 감독과영화 ORDER BY 감독과영화.감독등록번호 ASC;


SELECT * FROM 배우와영화 ORDER BY 배우와영화.배우주민번호 ASC;
DELETE FROM 배우와영화 
WHERE 배우와영화.영화코드 =(
SELECT 영화.영화코드 
FROM 영화 JOIN 장르 ON 영화.장르코드=장르.장르코드 
WHERE 장르.장르코드 ='000116'
);
SELECT * FROM 배우와영화 ORDER BY 배우와영화.배우주민번호 ASC;


SELECT * FROM 장르 ORDER BY 장르.장르명 ASC;
DELETE FROM 장르 WHERE 장르.장르코드 = '000116';
SELECT * FROM 장르 ORDER BY 장르.장르명 ASC;


SELECT * FROM 영화 ORDER BY 영화.제목 ASC;
DELETE FROM 영화 WHERE 영화.장르코드 = '000116';
SELECT * FROM 영화 ORDER BY 영화.제목 ASC;


SET foreign_key_checks=1;
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------

