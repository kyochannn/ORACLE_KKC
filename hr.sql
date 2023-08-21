-- 커서 실행 단축키    : 컨트롤 + 엔터
-- 문서 전체 실행      : F5
SELECT 1+1
FROM dual;

-- 1. 계정 접속 명령어
-- conn 계정명/비밀번호
conn system/123456;

-- 2.  
-- SQL은 대/소문자 구분이 없다.
-- 명령어 키워드 대문자, 식별자는 소문자 주로 사용한다. (각자의 스타일대로)
SELECT user_id, username
FROM all_users
WHERE username = 'HR'  -- 이것만 하면계정이 없다 
;        -- 이거 찍어줘야함.

-- 기본 계정 생성 (계정을 생성할 때 아래의 5줄을 입력해주면 된다.)
ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE;
CREATE USER HR IDENTIFIED BY 123456;
ALTER USER HR DEFAULT TABLESPACE users;
ALTER USER HR QUOTA UNLIMITED ON users;
GRANT connect, resource TO HR;

-- HR 계정 삭제
-- DROP USER 계정명 [CASCADE];
-- DROP USER HR [CASCADE];

-- 3. 

DESC employees;

SELECT employee_id, first_name
FROM employees;

-- 4. 
-- * 띄어쓰기가 없으면, 
--      따옴표(" ") 
--      생략 가능 ex) employye_id AS 사원번호 (x)
--      employye_id AS "사원 번호" (0)
-- * AS 생략가능
-- * 

-- AS (alias) : 출력되는 컬럼명에 별명을 짓는 명령어
SELECT employee_id AS "사원 번호"       
        , first_name AS 이름
        , last_name AS 성
        , email AS 이메일
        , phone_number AS 전화번호
        , hire_date AS 입사일자
        , salary AS 급여
FROM employees
;

-- 
SELECT *            -- (*) [에스터리크] : 모든 컬럼 지정
FROM employees
;

-- 5.
-- * DISTINCT 키워드 :  중복된 컬럼명을 제거해준다.
SELECT DISTINCT job_id 
FROM employees
;

-- 6.
-- * WHERE 조건 : 조회 조건을 작성하는 구문 > 조건을 작성할 때 사용함, 자바의 if문과 비슷함.
SELECT *
FROM employees
WHERE salary >= 6000
;

-- 7.
SELECT *
FROM employees
WHERE salary = 10000-- sql에서는 "=" 가 같다라는 의미
;       

-- 8.
-- 정렬 명령어
-- ORDER BY 컬럼명 [ASC,DESC]
-- * ASC  : 오름차순
-- * DESC : 내림차순
-- * (생략) : 오름차순이 기본값
SELECT *
FROM employees
ORDER BY salary DESC,
         first_name ASC
;

-- 9.
-- OR 키워드의 사용
-- OR 연산 : ~또는, ~이거나
-- WHERE A OR B;
SELECT *
FROM employees
WHERE job_id = 'FI_ACCOUNT' 
   OR job_id = 'IT_PROG'
   OR job_id = 'AD_VP'
;
    
-- 10. 
-- * 컬럼명 IN ('A', 'B') : OR 연산을 대체하여 사용할 수 있게 해주는 키워드
-- IN 키워드를 사용하면 OR키워드를 효율적으로 사용할 수 있게 해준다.
SELECT *
FROM employees
WHERE job_id IN ('FI_ACCOUNT', 'IT_PROG')
;

-- 11.
-- NOT 키워드의 사용
-- * 컬럼명 NOT ('A', 'B') : 'A', 'B'를 제외한 결과가 나온다.
-- 'FI_ACCOUNT', 'IT_PROG'을 제외한 JOB_ID가 다 나온다.
SELECT *
FROM employees
WHERE job_id NOT IN ('FI_ACCOUNT', 'IT_PROG')
;

-- 12.
-- AND 키워드의 사용
-- * AND 연산 : ~이면서, 그리고, ~동시에
-- WHERE A AND B;
SELECT *
FROM employees
WHERE job_id = 'IT_PROG'
  AND SALARY >= 6000
;

-- 13.
-- 와일드카드에 대하여
SELECT *
FROM employees
WHERE FIRST_NAME LIKE 'S%';


-- 14.
SELECT *
FROM employees
WHERE FIRST_NAME LIKE '%s'
;

-- 15.
SELECT *
FROM employees
WHERE FIRST_NAME LIKE '%s%'
;

-- 16.
-- 와일드 카드 중 '_'키워드의 사용
SELECT *
FROM employees
WHERE FIRST_NAME LIKE '_____'
;
    -- 이렇게도 접근할 수 있다.
    -- LENGTH(컬럼명) : 글자수를 반환하는 함수
SELECT *
FROM employees
WHERE LENGTH(first_name) = 5;
;


-- 17.
-- IS 키워드의 사용
-- 
SELECT *
FROM employees
WHERE COMMISSION_PCT IS NULL
;

-- 18. 
-- IS NOT 키워드의 사용
SELECT *
FROM employees
WHERE COMMISSION_PCT IS NOT NULL
;

-- 19.
SELECT *
FROM employees
WHERE HIRE_DATE >= '04/01/01'       -- SQL DEVELOPER 에서 문자형 데이터('04/01/01')를 날짜형 데이터로 자동 변환
;
-- TO_DATE() : 문자형 데이터를 날짜형 데이터롤 변환하는 함수
SELECT *
FROM employees
WHERE HIRE_DATE >= TO_DATE('20040101', 'YYYYMMDD')       
;

-- 20.
SELECT *
FROM employees
WHERE HIRE_DATE >= '04/01/01'
  AND HIRE_DATE <= '05/12/31'
;
-- TO_DATE() : 문자형 데이터를 날짜형 데이터롤 변환하는 함수
SELECT *
FROM employees
WHERE HIRE_DATE >= TO_DATE('20040101', 'YYYYMMDD')     
  AND HIRE_DATE <= TO_DATE('20051231', 'YYYYMMDD')  
;
-- TO_DATE() : 
SELECT *
FROM employees
WHERE HIRE_DATE BETWEEN TO_DATE('20040101', 'YYYYMMDD')
  AND TO_DATE('20051231', 'YYYYMMDD')
;


-- 21.



-- D
