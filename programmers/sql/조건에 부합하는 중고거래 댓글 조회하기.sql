조건에 부합하는 중고거래 댓글 조회하기
USED_GOODS_BOARD와 USED_GOODS_REPLY 테이블에서 2022년 10월에 작성된 게시글 제목, 게시글 ID, 댓글 ID, 댓글 작성자 ID, 댓글 내용, 댓글 작성일을 조회하는 SQL문을 작성해주세요. 
결과는 댓글 작성일을 기준으로 오름차순 정렬해주시고, 댓글 작성일이 같다면 게시글 제목을 기준으로 오름차순 정렬해주세요.
주의 : CREATED_DATE의 포맷이 예시의 포맷과 일치해야 정답처리 됩니다.
  
  두개 테이블을 조회.
USED_GOODS_BOARD 에는 게시글 아이디, 작성자 아이디, 게시글 제목, 글 내용,
가격, 작성일, 거래상태, 조회수
USED_GOODS_REPLY 에는 댓글 아이디, 게시글 아이디, 작성자 아이디, 댓글 내용,
작성일

필요한거 : 2022년 10월에 작성된 게시글 제목, 게시글 ID, 댓글 ID, 댓글 작성자 ID, 댓글 내용, 댓글 작성일

보드에서 게시글 제목, 게시글 ID 리플에서 전부 
select b.TITLE, b.BOARD_ID, r.REPLY_ID, r.WRITER_ID, r.CONTENTS, 
  to_char(r.CREATED_DATE, 'yyyy-mm-dd') CREATED_DATE
from USED_GOODS_REPLY r
left join USED_GOODS_BOARD b
on r.BOARD_ID = b.BOARD_ID
--> join, ',' 다 가능.
  
날짜 조건
where to_char(r.CREATED_DATE, 'yyyy-mm') = '2022-10' -->프로그래머스가 받아주지않음.
where b.CREATED_DATE BETWEEN TO_DATE('20221001','YYYYMMDD') AND TO_DATE('20221031','YYYYMMDD') --> 얘는 받아줌.

날짜 참조를 USED_GOODS_BOARD를 기준으로 해야 정답처리됨! 
where to_char(b.CREATED_DATE, 'yyyy-mm') = '2022-10' --> 하면 정답해줌.
  
정렬 조건
order by r.CREATED_DATE, b.title



