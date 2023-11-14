USE jsp_board;

SELECT * FROM board b ;
SELECT * FROM `member` m ;

INSERT INTO `member` (id, pass, name)
VALUES ('musthave', '12345', '머스트해브');

INSERT INTO board(title, content, id, postdate, visitcount)
VALUES ('지금은 봄입니다.', '봄의 왈츠', 'musthave', DEFAULT, DEFAULT);
INSERT INTO board(title, content, id, postdate, visitcount)
VALUES ('지금은 여름입니다.', '여름향기', 'musthave', DEFAULT, DEFAULT);
INSERT INTO board(title, content, id, postdate, visitcount)
VALUES ('지금은 가을입니다.', '가을동화', 'musthave', DEFAULT, DEFAULT);
INSERT INTO board(title, content, id, postdate, visitcount)
VALUES ('지금은 겨울입니다.', '겨울연가', 'musthave', DEFAULT, DEFAULT);

