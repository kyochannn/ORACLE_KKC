-- Ŀ�� ���� ����Ű    : ��Ʈ�� + ����
-- ���� ��ü ����      : F5
SELECT 1+1
FROM dual;

-- 1. ���� ���� ��ɾ�
-- conn ������/��й�ȣ
conn system/123456;

-- 2.  
-- SQL�� ��/�ҹ��� ������ ����.
-- ��ɾ� Ű���� �빮��, �ĺ��ڴ� �ҹ��� �ַ� ����Ѵ�. (������ ��Ÿ�ϴ��)
SELECT user_id, username
FROM all_users
WHERE username = 'HR'  -- �̰͸� �ϸ������ ���� 
;        -- �̰� ��������.

-- �⺻ ���� ���� (������ ������ �� �Ʒ��� 5���� �Է����ָ� �ȴ�.)
ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE;
CREATE USER HR IDENTIFIED BY 123456;
ALTER USER HR DEFAULT TABLESPACE users;
ALTER USER HR QUOTA UNLIMITED ON users;
GRANT connect, resource TO HR;

-- HR ���� ����
-- DROP USER ������ [CASCADE];
-- DROP USER HR [CASCADE];

-- 3. 

DESC employees;

SELECT employee_id, first_name
FROM employees;

-- 4. 
-- * ���Ⱑ ������, 
--      ����ǥ(" ") 
--      ���� ���� ex) employye_id AS �����ȣ (x)
--      employye_id AS "��� ��ȣ" (0)
-- * AS ��������
-- * 

-- AS (alias) : ��µǴ� �÷��� ������ ���� ��ɾ�
SELECT employee_id AS "��� ��ȣ"       
        , first_name AS �̸�
        , last_name AS ��
        , email AS �̸���
        , phone_number AS ��ȭ��ȣ
        , hire_date AS �Ի�����
        , salary AS �޿�
FROM employees
;

-- 
SELECT *            -- (*) [�����͸�ũ] : ��� �÷� ����
FROM employees
;

-- 5.
-- * DISTINCT Ű���� :  �ߺ��� �÷����� �������ش�.
SELECT DISTINCT job_id 
FROM employees
;

-- 6.
-- * WHERE ���� : ��ȸ ������ �ۼ��ϴ� ���� > ������ �ۼ��� �� �����, �ڹ��� if���� �����.
SELECT *
FROM employees
WHERE salary >= 6000
;

-- 7.
SELECT *
FROM employees
WHERE salary = 10000-- sql������ "=" �� ���ٶ�� �ǹ�
;       

-- 8.
-- ���� ��ɾ�
-- ORDER BY �÷��� [ASC,DESC]
-- * ASC  : ��������
-- * DESC : ��������
-- * (����) : ���������� �⺻��
SELECT *
FROM employees
ORDER BY salary DESC,
         first_name ASC
;

-- 9.
-- OR Ű������ ���
-- OR ���� : ~�Ǵ�, ~�̰ų�
-- WHERE A OR B;
SELECT *
FROM employees
WHERE job_id = 'FI_ACCOUNT' 
   OR job_id = 'IT_PROG'
   OR job_id = 'AD_VP'
;
    
-- 10. 
-- * �÷��� IN ('A', 'B') : OR ������ ��ü�Ͽ� ����� �� �ְ� ���ִ� Ű����
-- IN Ű���带 ����ϸ� ORŰ���带 ȿ�������� ����� �� �ְ� ���ش�.
SELECT *
FROM employees
WHERE job_id IN ('FI_ACCOUNT', 'IT_PROG')
;

-- 11.
-- NOT Ű������ ���
-- * �÷��� NOT ('A', 'B') : 'A', 'B'�� ������ ����� ���´�.
-- 'FI_ACCOUNT', 'IT_PROG'�� ������ JOB_ID�� �� ���´�.
SELECT *
FROM employees
WHERE job_id NOT IN ('FI_ACCOUNT', 'IT_PROG')
;

-- 12.
-- AND Ű������ ���
-- * AND ���� : ~�̸鼭, �׸���, ~���ÿ�
-- WHERE A AND B;
SELECT *
FROM employees
WHERE job_id = 'IT_PROG'
  AND SALARY >= 6000
;

-- 13.
-- ���ϵ�ī�忡 ���Ͽ�
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
-- ���ϵ� ī�� �� '_'Ű������ ���
SELECT *
FROM employees
WHERE FIRST_NAME LIKE '_____'
;
    -- �̷��Ե� ������ �� �ִ�.
    -- LENGTH(�÷���) : ���ڼ��� ��ȯ�ϴ� �Լ�
SELECT *
FROM employees
WHERE LENGTH(first_name) = 5;
;


-- 17.
-- IS Ű������ ���
-- 
SELECT *
FROM employees
WHERE COMMISSION_PCT IS NULL
;

-- 18. 
-- IS NOT Ű������ ���
SELECT *
FROM employees
WHERE COMMISSION_PCT IS NOT NULL
;

-- 19.
SELECT *
FROM employees
WHERE HIRE_DATE >= '04/01/01'       -- SQL DEVELOPER ���� ������ ������('04/01/01')�� ��¥�� �����ͷ� �ڵ� ��ȯ
;
-- TO_DATE() : ������ �����͸� ��¥�� �����ͷ� ��ȯ�ϴ� �Լ�
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
-- TO_DATE() : ������ �����͸� ��¥�� �����ͷ� ��ȯ�ϴ� �Լ�
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