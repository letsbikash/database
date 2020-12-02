CREATE PROCEDURE SAMPLE_PROC (IN BATCH_SK, OUT STATUS)
AS
DECLARE
 A VARCHAR(10);
BEGIN;

INSERT INTO EMPLOYEE
(
      EMP_ID,
      ENAME,
      SAL
)
SELECT 
      EMP_ID,
      ENAME,
      SAL
FROM
     EMP_WRK
QUALIFY
    ROW_NUMBER() OVER (PARTITION BY EMP_ID ORDER BY LAST_MODIFIED_TS DESC)=1
;

UPDATE EMPLOYEE
SET 
COMMISSION = SAL*0.2
;




INSERT INTO DEPARTMENT
(
      DEPTNO,
      DNAME,
      LOCATION
)
SELECT 
      DEPTNO,
      DNAME,
      LOCATION
FROM
     DEPT_WRK
WHERE 
  DEPTNO=10;



INSERT INTO DEPT_MAX_SAL
(
      DEPTNO,
      SAL
)
SELECT 
      DEPTNO,
      MAX(SAL) 
FROM
     EMP_WRK
GROUP BY
DEPTNO
;



INSERT INTO DEPT_MIN_SAL
(
      DEPTNO,
      SAL
)
SELECT 
      DEPTNO,
      MIN(SAL) 
FROM
     EMP_WRK
GROUP BY
DEPTNO
;


INSERT INTO DEPT_MIN_SAL
(
      DEPTNO,
      SAL
)
SELECT 
      DEPTNO,
      MIN(SAL) 
FROM
     EMP_WRK
GROUP BY
DEPTNO
;



END;
      
