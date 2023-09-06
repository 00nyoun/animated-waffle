조건에 부합하는 중고거래 상태 조회하기
USED_GOODS_BOARD 테이블에서 2022년 10월 5일에 등록된 중고거래 게시물의 게시글 ID, 작성자 ID, 게시글 제목, 가격, 거래상태를 조회하는 SQL문을 작성해주세요. 
거래상태가 SALE 이면 판매중, RESERVED이면 예약중, DONE이면 거래완료 분류하여 출력해주시고, 결과는 게시글 ID를 기준으로 내림차순 정렬해주세요.

sql에서 조건문 사용하기 -> (case when then else end)
SELECT BOARD_ID, WRITER_ID, TITLE, PRICE, 
case 
when status = 'sale' 
then '판매중'
when status = 'reserved' 
then '예약중'
else '거래완료'
end as status
from USED_GOODS_BOARD

날짜조건 : 2022 10 5
where CREATED_DATE = '2022-10-05'

게시글 ID를 기준으로 내림차순 정렬
order by BOARD_ID desc
