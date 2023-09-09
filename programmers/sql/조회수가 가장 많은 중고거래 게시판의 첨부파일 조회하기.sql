조회수가 가장 많은 중고거래 게시판의 첨부파일 조회하기(Oracle)
USED_GOODS_BOARD와 USED_GOODS_FILE 테이블에서 조회수가 가장 높은 중고거래 게시물에 대한 첨부파일 경로를 조회하는 SQL문을 작성해주세요. 
첨부파일 경로는 FILE ID를 기준으로 내림차순 정렬해주세요. 기본적인 파일경로는 /home/grep/src/ 이며, 
게시글 ID를 기준으로 디렉토리가 구분되고, 파일이름은 파일 ID, 파일 이름, 파일 확장자로 구성되도록 출력해주세요. 조회수가 가장 높은 게시물은 하나만 존재합니다.

1. USED_GOODS_BOARD에서 조회수가 가장 많은 board_id를 
select board_id from USED_GOODS_BOARD 
where views = (select max(views) from USED_GOODS_BOARD)
  
2. USED_GOODS_FILE 에서 찾아서 
select board_id,file_id,file_ext from USED_GOODS_FILE
where board_id = (select board_id from USED_GOODS_BOARD 
where views = (select max(views) from USED_GOODS_BOARD))

3. 형식에 맞게 file_path를 출력
select '/home/grep/src/'||board_id||'/'||file_id||file_ext as file_path
from USED_GOODS_FILE
where board_id = (select board_id from USED_GOODS_BOARD 
where views = (select max(views) from USED_GOODS_BOARD))

4. FILE ID를 기준으로 내림차순 정렬
order by file_id desc

맞는데 왜틀렸나...
>> 파일네임 빼먹음 해결!

select '/home/grep/src/'||board_id||'/'||file_id||file_name||file_ext as FILE_PATH
from USED_GOODS_FILE
where board_id = (
    select board_id from USED_GOODS_BOARD 
where views = (select max(views) from USED_GOODS_BOARD))
order by file_id desc


