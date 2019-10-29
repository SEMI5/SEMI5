
-- 호관 -- 
--안해도됨  --  N_BOARD 테이블 제약조건 변경 (외래키 연쇄삭제) --  
ALTER TABLE N_ATTACH DROP CONSTRAINT SYS_C007488;
ALTER TABLE N_ATTACH ADD CONSTRAINT SYS_C007488 FOREIGN KEY(BID) 
REFERENCES N_BOARD(BID) ON DELETE CASCADE;  


--필수!!!! 테이블 공지사항에 칼럼 추가 (보드 레벨) -- 
ALTER TABLE N_BOARD ADD BLEVEL NUMBER DEFAULT 1;
-------------------------------------------


----------밑에는 안해도됨 ----
UPDATE N_BOARD 
SET BLEVEL = 4
WHERE BID BETWEEN 7 AND 14;


ALTER TABLE F_BOARD ADD BLEVEL NUMBER DEFAULT 1;

UPDATE F_BOARD 
SET BLEVEL = 4
WHERE BID BETWEEN 29 AND 34;
WHERE BID BETWEEN 7 AND 14;
---------------------------



----------------좋아요 --------

DROP TABLE GOOD; 

DROP SEQUENCE SEQ_GNO; 

CREATE SEQUENCE SEQ_GNO; 
CREATE TABLE GOOD(
      GID NUMBER PRIMARY KEY,
      RID NUMBER REFERENCES F_REPLY(RID), 
      USER_NO NUMBER REFERENCES MEMBER(USER_NO), 
      STATUS VARCHAR2(1)DEFAULT 'Y'
);

COMMIT;
-------------------------------------------------------------

------------------------------대댓글 (답글이라는 의미에서 ANSWER)------------------

DROP TABLE F_ANSWER; 

DROP SEQUENCE SEQ_ANO; 

CREATE SEQUENCE SEQ_ANO; 

CREATE TABLE F_ANSWER(
  AID NUMBER PRIMARY KEY,
  ACONTENT VARCHAR2(400),
  RID NUMBER,
  AWRITER NUMBER,
  CREATE_DATE DATE,
  MODIFY_DATE DATE,
  STATUS VARCHAR2(1) DEFAULT 'Y' CHECK (STATUS IN ('Y', 'N')),
  FOREIGN KEY (RID) REFERENCES F_REPLY(RID),
  FOREIGN KEY (AWRITER) REFERENCES MEMBER(USER_NO)
);

COMMIT;
-----------------------------------------



CREATE OR REPLACE VIEW F_ALIST
AS
SELECT AID, ACONTENT, AWRITER, m.user_name, R.REF_BID AS BID, A.RID, A.CREATE_DATE, A.MODIFY_DATE, A.STATUS 
FROM F_ANSWER A 
JOIN F_REPLY R ON (A.RID = R.RID)
join member m on ( a.awriter = m.user_no);


----------------------------------------------------








-- 준배
ALTER TABLE S_FILE MODIFY BTYPE DEFAULT 3;