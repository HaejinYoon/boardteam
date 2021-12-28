use test;

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

CREATE TABLE Please (
	ID INT PRIMARY KEY AUTO_INCREMENT, -- 게시판 id
    UUID INT NOT NULL, -- 회원 ID
    Location VARCHAR(50) NOT NULL,
    Up INT NOT NULL DEFAULT 0,
    Views INT NOT NULL DEFAULT 0,
    Tag VARCHAR(50),
    Title VARCHAR(200) NOT NULL,
    Content VARCHAR(2000) NOT NULL,
    inserted DATETIME DEFAULT NOW() NOT NULL,
    updated DATETIME DEFAULT NOW() NOT NULL,
    FOREIGN KEY (UUID) REFERENCES Members (UUID) -- Members 바뀔 수 있음
);
SELECT * FROM Please;
INSERT INTO Please (UUID, Location, Tag, Title, Content)
	VALUES('1','강남', '해주세요', '저희 집 전등 좀 교체해주세요', '전등 만지기가 무서워요. 전등 교체 좀 부탁드려요');
INSERT INTO Please (UUID, Location, Tag, Title, Content)
	VALUES('2','강남', '해주세요', '약 좀 배달해 주실분 ㅠ', '몸살이 났는데 옴짝달싹을 못하고 있습니다. 타이레놀 한 상자 구매하여 집 앞에 걸어두시고 계좌와 함께 남겨주세요. 확인되면 입금해드릴게요ㅠㅠ');    

ALTER TABLE Please CHANGE inserted Inserted DATETIME DEFAULT NOW() NOT NULL;
ALTER TABLE Please CHANGE updated Updated DATETIME DEFAULT NOW() NOT NULL;

CREATE TABLE PReply (
	ID INT PRIMARY KEY AUTO_INCREMENT,
    BoardId INT NOT NULL,
    Nickname VARCHAR(50) NOT NULL,
    Reply VARCHAR(500) NOT NULL,
    Inserted DATETIME DEFAULT NOW() NOT NULL,
    Updated DATETIME DEFAULT NOW() NOT NULL,
    FOREIGN KEY (BoardId) REFERENCES Please (ID)
);
ALTER TABLE PReply MODIFY COLUMN Inserted DATETIME DEFAULT NOW() NOT NULL;
ALTER TABLE PReply MODIFY COLUMN Updated DATETIME DEFAULT NOW() NOT NULL;
DESC Please;
DESC Members;
DESC PReply;


