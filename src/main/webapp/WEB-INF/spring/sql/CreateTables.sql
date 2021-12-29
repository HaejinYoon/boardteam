use test;
CREATE DATABASE team;
USE team;
CREATE TABLE tb_user(
	id INT NOT NULL AUTO_INCREMENT,
    location VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    pw VARCHAR(100) NOT NULL,
    nickname VARCHAR(100) NOT NULL,
    signupday DATETIME NOT NULL DEFAULT NOW(),
    profileurl VARCHAR(100) NOT NULL,
    introduce VARCHAR(2000) NOT NULL,
	PRIMARY KEY(id)
);

SELECT * FROM tb_user;

CREATE TABLE Members (
	UUID INT PRIMARY KEY AUTO_INCREMENT,
    Nickname VARCHAR(50) NOT NULL,
    Password VARCHAR(50) NOT NULL,
    Email VARCHAR(255) NOT NULL,
    Address VARCHAR(50) NOT NULL,
    ProfileUrl VARCHAR(255) NOT NULL,
    JoinDate DATETIME DEFAULT NOW() NOT NULL,
    SelfIntro VARCHAR(500) NOT NULL
);
SELECT * FROM Members;
ALTER TABLE Members MODIFY COLUMN JoinDate DATETIME DEFAULT NOW() NOT NULL;
INSERT INTO Members (Nickname, Password, Email, Address, ProfileUrl, SelfIntro)
	VALUES ('user1', 'user1', 'user1@gmail.com', '강남', '프로필 링크', '안녕하세요 user1입니다');
INSERT INTO Members (Nickname, Password, Email, Address, ProfileUrl, SelfIntro)
	VALUES ('user2', 'user2', 'user2@gmail.com', '강남', '프로필 링크', '안녕하세요 user2입니다');
INSERT INTO Members (Nickname, Password, Email, Address, ProfileUrl, SelfIntro)
	VALUES ('user3', 'user3', 'user3@gmail.com', '역삼', '프로필 링크', '안녕하세요 user3입니다');
INSERT INTO Members (Nickname, Password, Email, Address, ProfileUrl, SelfIntro)
	VALUES ('user4', 'user4', 'user4@gmail.com', '잠실', '프로필 링크', '안녕하세요 user4입니다');

CREATE TABLE tb_board (
	id INT PRIMARY KEY AUTO_INCREMENT, -- 게시판 id
    memberId INT NOT NULL, -- 회원 ID
    location VARCHAR(50) NOT NULL,
    up INT NOT NULL DEFAULT 0,
    views INT NOT NULL DEFAULT 0,
    tag VARCHAR(50),
    title VARCHAR(200) NOT NULL,
    content VARCHAR(2000) NOT NULL,
    inserted DATETIME DEFAULT NOW() NOT NULL,
    updated DATETIME DEFAULT NOW() NOT NULL,
    FOREIGN KEY (memberId) REFERENCES tb_user (id) -- Members 바뀔 수 있음
);
SELECT * FROM Please;
INSERT INTO Please (UUID, Location, Tag, Title, Content)
	VALUES('1','강남', '해주세요', '저희 집 전등 좀 교체해주세요', '전등 만지기가 무서워요. 전등 교체 좀 부탁드려요');
INSERT INTO Please (UUID, Location, Tag, Title, Content)
	VALUES('2','강남', '해주세요', '약 좀 배달해 주실분 ㅠ', '몸살이 났는데 옴짝달싹을 못하고 있습니다. 타이레놀 한 상자 구매하여 집 앞에 걸어두시고 계좌와 함께 남겨주세요. 확인되면 입금해드릴게요ㅠㅠ');    

ALTER TABLE Please CHANGE inserted Inserted DATETIME DEFAULT NOW() NOT NULL;
ALTER TABLE Please CHANGE updated Updated DATETIME DEFAULT NOW() NOT NULL;

CREATE TABLE tb_reply (
	id INT PRIMARY KEY AUTO_INCREMENT,
    boardId INT NOT NULL,
    nickname VARCHAR(50) NOT NULL,
    reply VARCHAR(500) NOT NULL,
    inserted DATETIME DEFAULT NOW() NOT NULL,
    updated DATETIME DEFAULT NOW() NOT NULL,
    FOREIGN KEY (boardId) REFERENCES tb_user (id)
);
ALTER TABLE PReply MODIFY COLUMN Inserted DATETIME DEFAULT NOW() NOT NULL;
ALTER TABLE PReply MODIFY COLUMN Updated DATETIME DEFAULT NOW() NOT NULL;
DESC Please;
DESC Members;
DESC PReply;

create table tb_media (
	id INT PRIMARY KEY AUTO_INCREMENT,
    boardId INT NOT NULL,
    url VARCHAR(500) NOT NULL,
    filename VARCHAR(500) NOT NULL,
    thumbnail BOOLEAN NOT NULL,
    imagenum INT NOT NULL, -- 첨부파일 순서
    FOREIGN KEY (boardId) REFERENCES tb_board (id)
);

