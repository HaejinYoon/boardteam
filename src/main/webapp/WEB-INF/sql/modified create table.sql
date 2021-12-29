use team;
select * from tb_user;
select * from tb_board;
desc tb_user;

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
INSERT INTO tb_board (memberId, location, tag, title, Content)
	VALUES('1','강남', '해주세요', '저희 집 전등 좀 교체해주세요', '전등 만지기가 무서워요. 전등 교체 좀 부탁드려요');
INSERT INTO tb_board (memberId, location, tag, title, Content)
	VALUES('1','잠실', '해주세요', '약 좀 배달해 주실분 ㅠ', '몸살이 났는데 옴짝달싹을 못하고 있습니다. 타이레놀 한 상자 구매하여 집 앞에 걸어두시고 계좌와 함께 남겨주세요. 확인되면 입금해드릴게요ㅠㅠ');    
INSERT INTO tb_board (memberId, location, tag, title, Content)
	VALUES('1','역삼', '동네소식', 'XX 아파트 입구 앞에 공사 중', '아파트 메인 입구에서 공사중입니다. 차량, 보행자 통행에 유의해주시고 혼잡할 수 있으니 양해 부탁드립니다.');    
    
CREATE TABLE tb_reply (
	id INT PRIMARY KEY AUTO_INCREMENT,
    boardId INT NOT NULL,
    nickname VARCHAR(50) NOT NULL,
    reply VARCHAR(500) NOT NULL,
    inserted DATETIME DEFAULT NOW() NOT NULL,
    updated DATETIME DEFAULT NOW() NOT NULL,
    FOREIGN KEY (boardId) REFERENCES tb_user (id)
);

CREATE TABLE tb_media (
	id INT PRIMARY KEY AUTO_INCREMENT,
    boardId INT NOT NULL,
    url VARCHAR(500) NOT NULL,
    filename VARCHAR(500) NOT NULL,
    thumbnail BOOLEAN NOT NULL,
    imagenum INT NOT NULL, -- 첨부파일 순서
    FOREIGN KEY (boardId) REFERENCES tb_board (id)
);