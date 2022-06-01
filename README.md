# TaeLab-DB
TaeLab Back-End 구축을 위한 DB

## 2022-06-01 (일)
- news table 수정
  + 요약
    + **userId**, **coldate** 컬럼 추가
  + 상세
    + 뉴스 기사를 수집한 유저의 아이디를 명시하기 위하여 user table을 참조한 **userId** 외래키 컬럼 추가
    + 기사가 실제로 작성된 시간과 수집된 시간을 구분하기 위하여 **coldate** 컬럼 추가
