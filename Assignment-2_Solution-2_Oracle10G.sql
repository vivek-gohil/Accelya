
1] QUERY THE DEPT TABLE.

SQL> select * from dept;

   DEPTNO DNAME          LOC
--------- -------------- -------------
       10 ACCOUNTING     NEW YORK
       20 RESEARCH       DALLAS
       30 SALES          CHICAGO
       40 OPERATIONS     BOSTON

2] QUERY THE EMP TABLE.
SQL> SELECT * FROM EMP;

    EMPNO ENAME      JOB             MGR HIREDATE        SAL      COMM    DEPTNO
--------- ---------- --------- --------- --------- --------- --------- ---------
     7839 KING       PRESIDENT           17-NOV-81      5000                  10
     7698 BLAKE      MANAGER        7839 01-MAY-81      2850                  30
     7782 CLARK      MANAGER        7839 09-JUN-81      2450                  10
     7566 JONES      MANAGER        7839 02-APR-81      2975                  20
     7654 MARTIN     SALESMAN       7698 28-SEP-81      1250      1400        30
     7499 ALLEN      SALESMAN       7698 20-FEB-81      1600       300        30
     7844 TURNER     SALESMAN       7698 08-SEP-81      1500         0        30
     7900 JAMES      CLERK          7698 03-DEC-81       950                  30
     7521 WARD       SALESMAN       7698 22-FEB-81      1250       500        30
     7902 FORD       ANALYST        7566 03-DEC-81      3000                  20
     7369 SMITH      CLERK          7902 17-DEC-80       800                  20
     7788 SCOTT      ANALYST        7566 09-DEC-82      3000                  20
     7876 ADAMS      CLERK          7788 12-JAN-83      1100                  20
     7934 MILLER     CLERK          7782 23-JAN-82      1300                  10

14 rows selected.

3] SELECT THE EMPLOYEE IN DEPARTMENT 30.

SQL> SELECT * FROM EMP
  2  WHERE DEPTNO=30;

    EMPNO ENAME      JOB             MGR HIREDATE        SAL      COMM    DEPTNO
--------- ---------- --------- --------- --------- --------- --------- ---------
     7698 BLAKE      MANAGER        7839 01-MAY-81      2850                  30
     7654 MARTIN     SALESMAN       7698 28-SEP-81      1250      1400        30
     7499 ALLEN      SALESMAN       7698 20-FEB-81      1600       300        30
     7844 TURNER     SALESMAN       7698 08-SEP-81      1500         0        30
     7900 JAMES      CLERK          7698 03-DEC-81       950                  30
     7521 WARD       SALESMAN       7698 22-FEB-81      1250       500        30

6 rows selected.


4] LIST THE NAMES ,NUMBERS AND DEPARTMENT OF ALL CLERKS.

SQL> SELECT ENAME,EMPNO,DEPTNO FROM EMP 
  2  WHERE JOB = 'CLERK';

ENAME          EMPNO    DEPTNO
---------- --------- ---------
JAMES           7900        30
SMITH           7369        20
ADAMS           7876        20
MILLER          7934        10


5] FIND THE DEPART NUMBERS AND THE NAME OF EMPLOYEE OF ALL DEPT WITH DEPTNO GREATER OR EQUAL TO 20.

SQL> SELECT DEPTNO,ENAME FROM EMP
  2  WHERE DEPTNO >=20;

   DEPTNO ENAME
--------- ----------
       30 BLAKE
       20 JONES
       30 MARTIN
       30 ALLEN
       30 TURNER
       30 JAMES
       30 WARD
       20 FORD
       20 SMITH
       20 SCOTT
       20 ADAMS

11 rows selected.


6] FIND THE EMPLOYEES WHOSE COMMISSION  IS GREATER THAN THEIR SALARY.

SQL> SELECT ENAME FROM EMP 
  2  WHERE COMM > SAL;

ENAME
----------
MARTIN

7]  FIND THE EMPLOYEES WHOSE COMMISSION IS GREATER THAN 60 PERCENT OF THEIR SALARY.

SQL> SELECT * FROM EMP 
  2  WHERE COMM > SAL*.6;

    EMPNO ENAME      JOB             MGR HIREDATE        SAL      COMM    DEPTNO
--------- ---------- --------- --------- --------- --------- --------- ---------
     7654 MARTIN     SALESMAN       7698 28-SEP-81      1250      1400        30


8] FIND THE EMPLOYEE WHOSE COMMISSION IS GREATER THAN 50 PERCENT OF THEIR SALARY.


SQL> SELECT * FROM EMP 
  2  WHERE COMM > SAL*.6;

    EMPNO ENAME      JOB             MGR HIREDATE        SAL      COMM    DEPTNO
--------- ---------- --------- --------- --------- --------- --------- ---------
     7654 MARTIN     SALESMAN       7698 28-SEP-81      1250      1400        30


9] LIST THE NAME, JOB AND SALARY OF ALL EMPLOYEE IN DEPT 20 WHO EARN MORE THAN 2000.

SQL> SELECT ENAME, JOB, SAL FROM EMP
  2  WHERE DEPTNO=20 AND SAL > 2000;

ENAME      JOB             SAL
---------- --------- ---------
JONES      MANAGER        2975
FORD       ANALYST        3000
SCOTT      ANALYST        3000


10] FIND ALL SALESMAN IN DEPT 30 WHOSE SALARY IS GREATER THAN OR EQUAL TO RS. 1500.

SQL> SELECT * FROM EMP
  2  WHERE DEPTNO=30 AND SAL >= 1500;

    EMPNO ENAME      JOB             MGR HIREDATE        SAL      COMM    DEPTNO
--------- ---------- --------- --------- --------- --------- --------- ---------
     7698 BLAKE      MANAGER        7839 01-MAY-81      2850                  30
     7499 ALLEN      SALESMAN       7698 20-FEB-81      1600       300        30
     7844 TURNER     SALESMAN       7698 08-SEP-81      1500         0        30


11] FIND ALL THE EMPLOYEES WHOSE JOB IS EITHER A PRESIDENT OR MANAGER.

SQL> SELECT * FROM EMP
  2  WHERE JOB= 'PRESIDENT' OR JOB = 'MANAGER';

    EMPNO ENAME      JOB             MGR HIREDATE        SAL      COMM    DEPTNO
--------- ---------- --------- --------- --------- --------- --------- ---------
     7839 KING       PRESIDENT           17-NOV-81      5000                  10
     7698 BLAKE      MANAGER        7839 01-MAY-81      2850                  30
     7782 CLARK      MANAGER        7839 09-JUN-81      2450                  10
     7566 JONES      MANAGER        7839 02-APR-81      2975                  20


12]  FIND ALL MANAGER WHO ARE NOT IN DEPT 30.

SQL> SELECT * FROM EMP 
  2  WHERE JOB = 'MANAGER' AND DEPTNO<>30;

    EMPNO ENAME      JOB             MGR HIREDATE        SAL      COMM    DEPTNO
--------- ---------- --------- --------- --------- --------- --------- ---------
     7782 CLARK      MANAGER        7839 09-JUN-81      2450                  10
     7566 JONES      MANAGER        7839 02-APR-81      2975                  20


13]  FIND THE DETAILS OF ALL MANAGERS AND CLERKS IN DEPT 10.

SQL> SELECT * FROM EMP
  2  WHERE DEPTNO =10 AND JOB = 'MANAGER' OR DEPTNO = 10 AND JOB = 'CLERK';

    EMPNO ENAME      JOB             MGR HIREDATE        SAL      COMM    DEPTNO
--------- ---------- --------- --------- --------- --------- --------- ---------
     7782 CLARK      MANAGER        7839 09-JUN-81      2450                  10
     7934 MILLER     CLERK          7782 23-JAN-82      1300                  10


14]  FIND THE DETAILS OF ALL MANAGER (IN ANY DEPT) AND ALL CLERKS IN DEPT 10

SQL> SELECT * FROM EMP
SQL> 2
  2* WHERE JOB = 'MANAGER' AND (JOB = 'CLERK' AND DEPTNO = 10)
SQL> C\AND\OR
  2* WHERE JOB = 'MANAGER' OR (JOB = 'CLERK' AND DEPTNO = 10)
SQL> /

    EMPNO ENAME      JOB             MGR HIREDATE        SAL      COMM    DEPTNO
--------- ---------- --------- --------- --------- --------- --------- ---------
     7698 BLAKE      MANAGER        7839 01-MAY-81      2850                  30
     7782 CLARK      MANAGER        7839 09-JUN-81      2450                  10
     7566 JONES      MANAGER        7839 02-APR-81      2975                  20
     7934 MILLER     CLERK          7782 23-JAN-82      1300                  10


15]  FIND THE DETAILS OF ALL MANAGER IN DEPT 10 AND ALL CLERKS IN DEPT 20.

SQL> SELECT * FROM EMP
  2  WHERE DEPTNO = 10 AND JOB = 'MANAGER' OR DEPTNO = 20 AND JOB = 'CLERK';

    EMPNO ENAME      JOB             MGR HIREDATE        SAL      COMM    DEPTNO
--------- ---------- --------- --------- --------- --------- --------- ---------
     7782 CLARK      MANAGER        7839 09-JUN-81      2450                  10
     7369 SMITH      CLERK          7902 17-DEC-80       800                  20
     7876 ADAMS      CLERK          7788 12-JAN-83      1100                  20


16]  FIND THE DETAILS OF ALL THE MANAGER IN DEPT 10, ALL CLERK IN DEPT 20 AND ALL EMPLOYEE WHO ARE NIETHER CLERKS NOR MANAGER BUT WHOSE SALARY IS GREATER THAN OR EQUAL TO RS. 2000..

SQL> SELECT * FROM EMP
  2  WHERE DEPTNO = 10 AND JOB = 'MANAGER' OR DEPTNO = 20 AND JOB = 'CLERK'
  3  OR JOB <> 'MANAGER' AND JOB <> 'CLERK' AND SAL>=2000;

    EMPNO ENAME      JOB             MGR HIREDATE        SAL      COMM    DEPTNO
--------- ---------- --------- --------- --------- --------- --------- ---------
     7839 KING       PRESIDENT           17-NOV-81      5000                  10
     7782 CLARK      MANAGER        7839 09-JUN-81      2450                  10
     7902 FORD       ANALYST        7566 03-DEC-81      3000                  20
     7369 SMITH      CLERK          7902 17-DEC-80       800                  20
     7788 SCOTT      ANALYST        7566 09-DEC-82      3000                  20
     7876 ADAMS      CLERK          7788 12-JAN-83      1100                  20

6 rows selected.


17]  FIND THE NAMES OF EVERYONE IN DEPTNO 20 WHO IS NEITHER A CLERK NOR A MANAGER.

SQL> SELECT * FROM EMP
  2  WHERE DEPTNO = 20 AND JOB NOT IN ('MANAGER' , 'CLERK' );

    EMPNO ENAME      JOB             MGR HIREDATE        SAL      COMM    DEPTNO
--------- ---------- --------- --------- --------- --------- --------- ---------
     7902 FORD       ANALYST        7566 03-DEC-81      3000                  20
     7788 SCOTT      ANALYST        7566 09-DEC-82      3000                  20


18] FIND THE EMPLOYEES WHO EARNS BETWEEN RS. 1200 AND RS.1400.

SQL> SELECT * FROM EMP
  2  WHERE SAL+NVL(COMM,0) BETWEEN 1200 AND 1400;

    EMPNO ENAME      JOB             MGR HIREDATE        SAL      COMM    DEPTNO
--------- ---------- --------- --------- --------- --------- --------- ---------
     7934 MILLER     CLERK          7782 23-JAN-82      1300                  10


19] FIND THE EMPLOYEES WHO ARE CLERKS, ANALYSTS OR SALESMAN.

SQL> SELECT * FROM EMP
  2  WHERE JOB = 'CLERK' OR JOB = 'ANALYST' OR JOB = 'SALESMAN';

    EMPNO ENAME      JOB             MGR HIREDATE        SAL      COMM    DEPTNO
--------- ---------- --------- --------- --------- --------- --------- ---------
     7654 MARTIN     SALESMAN       7698 28-SEP-81      1250      1400        30
     7499 ALLEN      SALESMAN       7698 20-FEB-81      1600       300        30
     7844 TURNER     SALESMAN       7698 08-SEP-81      1500         0        30
     7900 JAMES      CLERK          7698 03-DEC-81       950                  30
     7521 WARD       SALESMAN       7698 22-FEB-81      1250       500        30
     7902 FORD       ANALYST        7566 03-DEC-81      3000                  20
     7369 SMITH      CLERK          7902 17-DEC-80       800                  20
     7788 SCOTT      ANALYST        7566 09-DEC-82      3000                  20
     7876 ADAMS      CLERK          7788 12-JAN-83      1100                  20
     7934 MILLER     CLERK          7782 23-JAN-82      1300                  10

10 rows selected.

20]  FIND THE EMPLOYEES WHO ARE NOT CLERKS,ANALYST OR SALESMAN.

SQL> SELECT * FROM EMP
  2  WHERE  JOB NOT IN ('CLERK' , 'ANALYST' , 'SALESMAN');

    EMPNO ENAME      JOB             MGR HIREDATE        SAL      COMM    DEPTNO
--------- ---------- --------- --------- --------- --------- --------- ---------
     7839 KING       PRESIDENT           17-NOV-81      5000                  10
     7698 BLAKE      MANAGER        7839 01-MAY-81      2850                  30
     7782 CLARK      MANAGER        7839 09-JUN-81      2450                  10
     7566 JONES      MANAGER        7839 02-APR-81      2975                  20


21] FIND THE EMPLOYEES WHO DO NOT RECEIVE  A COMMISSION.

SQL> SELECT * FROM EMP
  2  WHERE COMM IS NULL;

    EMPNO ENAME      JOB             MGR HIREDATE        SAL      COMM    DEPTNO
--------- ---------- --------- --------- --------- --------- --------- ---------
     7839 KING       PRESIDENT           17-NOV-81      5000                  10
     7698 BLAKE      MANAGER        7839 01-MAY-81      2850                  30
     7782 CLARK      MANAGER        7839 09-JUN-81      2450                  10
     7566 JONES      MANAGER        7839 02-APR-81      2975                  20
     7900 JAMES      CLERK          7698 03-DEC-81       950                  30
     7902 FORD       ANALYST        7566 03-DEC-81      3000                  20
     7369 SMITH      CLERK          7902 17-DEC-80       800                  20
     7788 SCOTT      ANALYST        7566 09-DEC-82      3000                  20
     7876 ADAMS      CLERK          7788 12-JAN-83      1100                  20
     7934 MILLER     CLERK          7782 23-JAN-82      1300                  10

10 rows selected.


22]  FIND THE EMPLOYEE WHOSE COMMISSION IS RS. 0.

SQL> SELECT * FROM EMP
  2  WHERE COMM = 0;

    EMPNO ENAME      JOB             MGR HIREDATE        SAL      COMM    DEPTNO
--------- ---------- --------- --------- --------- --------- --------- ---------
     7844 TURNER     SALESMAN       7698 08-SEP-81      1500         0        30


23] FIND THE DIFFERENT JOBS OF THE EMPLOYEES RECEIVING COMMISSION.

SQL> SELECT JOB FROM EMP 
  2  WHERE COMM IS NOT NULL;

JOB
---------
SALESMAN
SALESMAN
SALESMAN
SALESMAN


24] FIND ALL EMPLOYEES WHO DO NOT RECEIVE A COMMISSION ,OR WHOSE COMMISSION IS LESS THAN RS. 100. 

SQL> SELECT * FROM EMP
  2  WHERE COMM IS NULL OR COMM < 100;

    EMPNO ENAME      JOB             MGR HIREDATE        SAL      COMM    DEPTNO
--------- ---------- --------- --------- --------- --------- --------- ---------
     7839 KING       PRESIDENT           17-NOV-81      5000                  10
     7698 BLAKE      MANAGER        7839 01-MAY-81      2850                  30
     7782 CLARK      MANAGER        7839 09-JUN-81      2450                  10
     7566 JONES      MANAGER        7839 02-APR-81      2975                  20
     7844 TURNER     SALESMAN       7698 08-SEP-81      1500         0        30
     7900 JAMES      CLERK          7698 03-DEC-81       950                  30
     7902 FORD       ANALYST        7566 03-DEC-81      3000                  20
     7369 SMITH      CLERK          7902 17-DEC-80       800                  20
     7788 SCOTT      ANALYST        7566 09-DEC-82      3000                  20
     7876 ADAMS      CLERK          7788 12-JAN-83      1100                  20
     7934 MILLER     CLERK          7782 23-JAN-82      1300                  10

11 rows selected.


25] IF ALL EMPLOYEES NOT RECEIVING COMMISSION ARE ENTILED TO RS. 250 , SHOW THE NET ERNINGS OF ALL EMPLOYEES.

SQL>  SELECT ENAME , SAL+NVL(COMM,250) "NET EARNINGS" FROM EMP;

ENAME      NET EARNINGS
---------- ------------
KING               5250
BLAKE              3100
CLARK              2700
JONES              3225
MARTIN             2650
ALLEN              1900
TURNER             1500
JAMES              1200
WARD               1750
FORD               3250
SMITH              1050
SCOTT              3250
ADAMS              1350
MILLER             1550

14 rows selected.


26] FIND ALL EMPLOYEES WHOSE TOTAL EARNINGS IS GREATER THAN RS. 2000.

SQL> SELECT * FROM EMP
  2  WHERE SAL + NVL(COMM,0) > 2000;

    EMPNO ENAME      JOB             MGR HIREDATE        SAL      COMM    DEPTNO
--------- ---------- --------- --------- --------- --------- --------- ---------
     7839 KING       PRESIDENT           17-NOV-81      5000                  10
     7698 BLAKE      MANAGER        7839 01-MAY-81      2850                  30
     7782 CLARK      MANAGER        7839 09-JUN-81      2450                  10
     7566 JONES      MANAGER        7839 02-APR-81      2975                  20
     7654 MARTIN     SALESMAN       7698 28-SEP-81      1250      1400        30
     7902 FORD       ANALYST        7566 03-DEC-81      3000                  20
     7788 SCOTT      ANALYST        7566 09-DEC-82      3000                  20

7 rows selected.

27] FIND ALL EMPLOYEES WHOSE NAME BEGIN WITH M.

SQL> SELECT * FROM EMP
  2  WHERE ENAME LIKE 'M%';

    EMPNO ENAME      JOB             MGR HIREDATE        SAL      COMM    DEPTNO
--------- ---------- --------- --------- --------- --------- --------- ---------
     7654 MARTIN     SALESMAN       7698 28-SEP-81      1250      1400        30
     7934 MILLER     CLERK          7782 23-JAN-82      1300                  10

28] FIND ALL EMPLOYEES WHOSE NAMES END WITH M.

SQL> SELECT * FROM EMP
  2  WHERE ENAME LIKE '%M';

no rows selected
29] FIND ALL EMPLOYEES WHOSE NAMES CONTAINS THE LETTER M IN ANY CASE.

SQL> SELECT * FROM EMP
  2  WHERE ENAME LIKE UPPER('%m%');

    EMPNO ENAME      JOB             MGR HIREDATE        SAL      COMM    DEPTNO
--------- ---------- --------- --------- --------- --------- --------- ---------
     7654 MARTIN     SALESMAN       7698 28-SEP-81      1250      1400        30
     7900 JAMES      CLERK          7698 03-DEC-81       950                  30
     7369 SMITH      CLERK          7902 17-DEC-80       800                  20
     7876 ADAMS      CLERK          7788 12-JAN-83      1100                  20
     7934 MILLER     CLERK          7782 23-JAN-82      1300                  10


30] FIND THE EMPLOYEES WHOSE NAMES ARE 5 CHARACTERS LONG AND END WITH n.

SQL> SELECT * FROM EMP
  2  WHERE ENAME LIKE '____N';

no rows selected


31] FIND THE EMPLOYEE WHO HAVE THE LETTER r AS THE THIRD LETTER IN THEIR NAME.

SQL> SELECT * FROM EMP
  2  WHERE ENAME LIKE '__R%';

    EMPNO ENAME      JOB             MGR HIREDATE        SAL      COMM    DEPTNO
--------- ---------- --------- --------- --------- --------- --------- ---------
     7654 MARTIN     SALESMAN       7698 28-SEP-81      1250      1400        30
     7844 TURNER     SALESMAN       7698 08-SEP-81      1500         0        30
     7521 WARD       SALESMAN       7698 22-FEB-81      1250       500        30
     7902 FORD       ANALYST        7566 03-DEC-81      3000                  20


32] FIND ALL EMPLOYEE HIRED IN MONTH OF FEBUARY (OF ANY YEAR).

SQL> SELECT * FROM EMP
  2  WHERE TO_CHAR(HIREDATE,'MON') = 'FEB';

    EMPNO ENAME      JOB             MGR HIREDATE        SAL      COMM    DEPTNO
--------- ---------- --------- --------- --------- --------- --------- ---------
     7499 ALLEN      SALESMAN       7698 20-FEB-81      1600       300        30
     7521 WARD       SALESMAN       7698 22-FEB-81      1250       500        30


33] FIND ALL EMPLOYEE WHO WERE HIRED.    ON THE LAST DAY OF THE MONTH. .

SQL> SELECT * FROM EMP
  2  WHERE HIREDATE=LAST_DAY(HIREDATE);

no rows selected


34] FIND THE EMPLOYEE WHO WERE HIRED MORE THAN 12 YEARS AGO.

SQL> SELECT * FROM EMP
  2  WHERE MONTHS_BETWEEN(SYSDATE,HIREDATE) > 144;

    EMPNO ENAME      JOB             MGR HIREDATE        SAL      COMM    DEPTNO
--------- ---------- --------- --------- --------- --------- --------- ---------
     7839 KING       PRESIDENT           17-NOV-81      5000                  10
     7698 BLAKE      MANAGER        7839 01-MAY-81      2850                  30
     7782 CLARK      MANAGER        7839 09-JUN-81      2450                  10
     7566 JONES      MANAGER        7839 02-APR-81      2975                  20
     7654 MARTIN     SALESMAN       7698 28-SEP-81      1250      1400        30
     7499 ALLEN      SALESMAN       7698 20-FEB-81      1600       300        30
     7844 TURNER     SALESMAN       7698 08-SEP-81      1500         0        30
     7900 JAMES      CLERK          7698 03-DEC-81       950                  30
     7521 WARD       SALESMAN       7698 22-FEB-81      1250       500        30
     7902 FORD       ANALYST        7566 03-DEC-81      3000                  20
     7369 SMITH      CLERK          7902 17-DEC-80       800                  20
     7788 SCOTT      ANALYST        7566 09-DEC-82      3000                  20
     7876 ADAMS      CLERK          7788 12-JAN-83      1100                  20
     7934 MILLER     CLERK          7782 23-JAN-82      1300                  10

14 rows selected.


35] FIND THE MANAGERS HIRED IN THE YEAR 1981.

SQL> SELECT * FROM EMP
  2  WHERE JOB='MANAGER' AND TO_CHAR(HIREDATE,'YY')='81';

    EMPNO ENAME      JOB             MGR HIREDATE        SAL      COMM    DEPTNO
--------- ---------- --------- --------- --------- --------- --------- ---------
     7698 BLAKE      MANAGER        7839 01-MAY-81      2850                  30
     7782 CLARK      MANAGER        7839 09-JUN-81      2450                  10
     7566 JONES      MANAGER        7839 02-APR-81      2975                  20


36] DISPLAY THE NAMES AND THE JOBS OF ALL EMPLOYEES, SEPARATED BY A','.

SQL> SELECT RTRIM(ENAME) || ','  || JOB FROM EMP;

RTRIM(ENAME)||','||J
--------------------
KING,PRESIDENT
BLAKE,MANAGER
CLARK,MANAGER
JONES,MANAGER
MARTIN,SALESMAN
ALLEN,SALESMAN
TURNER,SALESMAN
JAMES,CLERK
WARD,SALESMAN
FORD,ANALYST
SMITH,CLERK
SCOTT,ANALYST
ADAMS,CLERK
MILLER,CLERK

14 rows selected.



37] DISPLAY THE NAMES OF ALL EMPLOYEES WITH THE INITIAL LETTER ONLY IN CAPITALS.

SQL> SELECT  INITCAP(ENAME) FROM EMP;

INITCAP(EN
----------
King
Blake
Clark
Jones
Martin
Allen
Turner
James
Ward
Ford
Smith
Scott
Adams
Miller

14 rows selected.



38] DISPLAY THE NAMES OF ALL EMPLOYEES, RIGHT ALINGNING THEM TO 15 CHARACTERS.


SQL> SELECT LPAD(RTRIM(ENAME),15) FROM EMP;

LPAD(RTRIM(ENAM
---------------
           KING
          BLAKE
          CLARK
          JONES
         MARTIN
          ALLEN
         TURNER
          JAMES
           WARD
           FORD
          SMITH
          SCOTT
          ADAMS
         MILLER

14 rows selected.


39] DISPLAY THE NAMES OF ALL EMPLOYEES, PADDING THEM TO RIGHT UPTO 15 CHARACTERS WITH '-'.

SQL> SELECT RPAD(RTRIM(ENAME),15,'-') FROM EMP;

RPAD(RTRIM(ENAM
---------------
KING-----------
BLAKE----------
CLARK----------
JONES----------
MARTIN---------
ALLEN----------
TURNER---------
JAMES----------
WARD-----------
FORD-----------
SMITH----------
SCOTT----------
ADAMS----------
MILLER---------

14 rows selected.


40] DISPLAY THE LENGTH OF THE NAME OF ALL EMPLOYEES.

SQL> SELECT ENAME, LENGTH(RTRIM(ENAME)) FROM EMP;

ENAME      LENGTH(RTRIM(ENAME))
---------- --------------------
KING                          4
BLAKE                         5
CLARK                         5
JONES                         5
MARTIN                        6
ALLEN                         5
TURNER                        6
JAMES                         5
WARD                          4
FORD                          4
SMITH                         5
SCOTT                         5
ADAMS                         5
MILLER                        6

14 rows selected.


41] DISPLAY THE NAMES OF ALL EMPLOYEES CENTERING THEM WITH 20 CHARACTERS.

SQL> SELECT LPAD(RPAD(RTRIM(ENAME),(20-LENGTH(RTRIM(ENAME)))/2 +LENGTH(RTRIM(ENAME))),20) FROM EMP;

LPAD(RPAD(RTRIM(ENAM
--------------------
        KING
        BLAKE
        CLARK
        JONES
       MARTIN
        ALLEN
       TURNER
        JAMES
        WARD
        FORD
        SMITH
        SCOTT
        ADAMS
       MILLER

14 rows selected.


42] DISPLAY THE NAMES OF ALL EMPLOYEES WITHOUT ANY LEADING 'A'.

SQL> SELECT ENAME FROM EMP
  2  WHERE ENAME NOT LIKE 'A%' ;

ENAME
----------
KING
BLAKE
CLARK
JONES
MARTIN
TURNER
JAMES
WARD
FORD
SMITH
SCOTT
MILLER

12 rows selected.

43] DISPLAY THE NAMES OF ALL EMPLOYEES WITHOUT ANY TRAILING 'R'.

SQL> SELECT ENAME FROM EMP
  2  WHERE RTRIM(ENAME) NOT LIKE '%R'  ;

ENAME
----------
KING
BLAKE
CLARK
JONES
MARTIN
ALLEN
JAMES
WARD
FORD
SMITH
SCOTT
ADAMS

12 rows selected.

44] SHOW THE FIRST THREE CHARACTERS OF THE NAMES OF ALL EMPLOYEES.

SQL> SELECT SUBSTR((ENAME),1,3) FROM EMP;

SUB
---
KIN
BLA
CLA
JON
MAR
ALL
TUR
JAM
WAR
FOR
SMI
SCO
ADA
MIL

14 rows selected.

45] SHOW THE LAST THREE CHARACTERS OF THE NAMES OF ALL EMPLOYEES.

SQL> SELECT SUBSTR(ENAME,(LENGTH(RTRIM(ENAME))-2),3) ENAME FROM EMP;

ENA
---
ING
AKE
ARK
NES
TIN
LEN
NER
MES
ARD
ORD
ITH
OTT
AMS
LER

14 rows selected.


46] DISPLAY THE NAMES OF ALL EMPLOYEES WITH ANY 'A'.

SQL> SELECT ENAME FROM EMP 
  2  WHERE ENAME LIKE '%A%' ;

ENAME
----------
BLAKE
CLARK
MARTIN
ALLEN
JAMES
WARD
ADAMS

7 rows selected.


47] DISPLAY THE NAMES OF ALL EMPLOYEES REPLACING ANY 'A' WITH 'a'.

SQL> SELECT REPLACE(ENAME,'A','a') FROM EMP;

REPLACE(EN
----------
KING
BLaKE
CLaRK
JONES
MaRTIN
aLLEN
TURNER
JaMES
WaRD
FORD
SMITH
SCOTT
aDaMS
MILLER

14 rows selected.


48] DISPLAY THE NAMES OF ALL EMPLOYEES AND THE POSITION AT WHICH THE STRING 'ar' OCCURS IN THE NAME.

SQL> SELECT ENAME,INSTR(RTRIM(ENAME),'AR') FROM EMP 
  2  WHERE ENAME LIKE '%AR%';

ENAME      INSTR(RTRIM(ENAME),'AR')
---------- ------------------------
CLARK                             3
MARTIN                            2
WARD                              2


49] SHOW THE SALARY OF ALL EMPLOYEES ROUNDING IT TO THE NEAREST RS. 1000.

SQL> SELECT ROUND(SAL,-3) FROM EMP;

ROUND(SAL,-3)
-------------
         5000
         3000
         2000
         3000
         1000
         2000
         2000
         1000
         1000
         3000
         1000
         3000
         1000
         1000

14 rows selected.


50] SHOE THE SALARY OF ALL EMPLOYEES IGNORING FRACTIONS LESS THAN RS. 1000.


SQL> SELECT FLOOR(SAL) FROM EMP;

FLOOR(SAL)
----------
      5000
      2850
      2450
      2975
      1250
      1600
      1500
       950
      1250
      3000
       800
      3000
      1100
      1300

14 rows selected.


51] SHOW THE DAILY SALARY OF ALL EMPLOYEES ASSUMING A MONTH HAS 30 DAYS.

SQL> SELECT SAL,SAL/30 "DAILY SALARY" FROM EMP;

      SAL DAILY SALARY
--------- ------------
     5000    166.66667
     2850           95
     2450    81.666667
     2975    99.166667
     1250    41.666667
     1600    53.333333
     1500           50
      950    31.666667
     1250    41.666667
     3000          100
      800    26.666667
     3000          100
     1100    36.666667
     1300    43.333333

14 rows selected.


52] SHOW THE DAILY SALARY OF ALL EMPLOYEES ASSUMING A MONTH HAS 30 DAYS. IGNORE FRACTION OF A RUPEE.

SQL> SELECT SAL, FLOOR(SAL/30) "DAILY SALARY" FROM EMP;

      SAL DAILY SALARY
--------- ------------
     5000          166
     2850           95
     2450           81
     2975           99
     1250           41
     1600           53
     1500           50
      950           31
     1250           41
     3000          100
      800           26
     3000          100
     1100           36
     1300           43

14 rows selected.


53] DISPLAY THE NAME OF ALL EMPLOYEES, AND 'GRATER' OR 'LESSER' OR 'EQUAL' DEPENDING ON WHETHER THE
    SALARY OF THE EMPLOYEE IS GRATER THAN OR LESS THAN OR EQUAL TO RS. 1500. DISPLAY THE NAMES,JOBS
    AND BONUS FOR ALL EMPLOYEES.  ASSUMING ALL MANAGERS GET A BONUS OF RS. 500, CLERK GET RS. 200 
    AND ALL OTHERS EXCEPT THE PRESIDENT GET RS. 350. THE PRESIDENT GET 20 PERCENT OF HIS SALARY AS 
    BONUS.



  1* SELECT ENAME, DECODE(SIGN(SAL-1500),1,'GREATER',0,'EQUAL',-1,'LESSER') STATUS ,
JOB,SAL,DECODE(RTRIM(JOB),'MANAGER',500,'CLERK',200,'PRESIDENT',(SAL*.2),350)  BONUS FROM EMP
SQL> /

ENAME      STATUS  JOB             SAL     BONUS
---------- ------- --------- --------- ---------
KING       GREATER PRESIDENT      5000      1000
BLAKE      GREATER MANAGER        2850       500
CLARK      GREATER MANAGER        2450       500
JONES      GREATER MANAGER        2975       500
MARTIN     LESSER  SALESMAN       1250       350
ALLEN      GREATER SALESMAN       1600       350
TURNER     EQUAL   SALESMAN       1500       350
JAMES      LESSER  CLERK           950       200
WARD       LESSER  SALESMAN       1250       350
FORD       GREATER ANALYST        3000       350
SMITH      LESSER  CLERK           800       200
SCOTT      GREATER ANALYST        3000       350


54] DISPLAY THE NAME OF ALL EMPLOYEES, AND THEIR BONUS. ASSUME EACH EMPLOYEE GETS A BONUS OF 
    20 PERCENT OF HIS SALARY SUBJECT TO THE MAXIMUM OF RS. 500.

SQL> SELECT ENAME, LEAST(SAL*.2,500) BONUS FROM EMP;

ENAME          BONUS
---------- ---------
KING             500
BLAKE            500
CLARK            490
JONES            500
MARTIN           250
ALLEN            320
TURNER           300
JAMES            190
WARD             250
FORD             500
SMITH            160
SCOTT            500
ADAMS            220
MILLER           260

14 rows selected.


55] DISPLAY THE NAME OF ALL EMPLOYEES, AND THEIR BONUS. ASSUME EACH EMPLOYEE GETS A BONUS OF 
    20 PERCENT OF HIS SALARY SUBJECT TO THE MAXIMUM OF RS. 200.

SQL>  SELECT ENAME, LEAST(SAL*.2,200) FROM EMP;

ENAME      LEAST(SAL*.2,200)
---------- -----------------
KING                     200
BLAKE                    200
CLARK                    200
JONES                    200
MARTIN                   200
ALLEN                    200
TURNER                   200
JAMES                    190
WARD                     200
FORD                     200
SMITH                    160
SCOTT                    200
ADAMS                    200
MILLER                   200

14 rows selected.



56] DISPLAY THE NAMES , JOBS AND BONUS FOR ALL EMPLOYEES. ALL EMPLOYEES GET A BONUS EQUAL TO 
    20 PERCENT OF HIS SALARY, SUBJECT TO THE FOLLOWING LIMITS. MANAGERS RS 500 , CLERKS RS. 200 
    AND ALL OTHERS EXCEPT THE PRESIDENT RS.350. THE PRESIDENT HAS NO LIMITS.


  1   SELECT ENAME,JOB, DECODE(RTRIM(JOB),'MANAGER',LEAST(SAL*.20,500),'CLERK',LEAST(SAL*.2,200),
  2* 'PRESIDENT',SAL*.2,(LEAST(SAL*.2,350))) BONUS FROM EMP
SQL> /

ENAME      JOB           BONUS
---------- --------- ---------
KING       PRESIDENT      1000
BLAKE      MANAGER         500
CLARK      MANAGER         490
JONES      MANAGER         500
MARTIN     SALESMAN        250
ALLEN      SALESMAN        320
TURNER     SALESMAN        300
JAMES      CLERK           190
WARD       SALESMAN        250
FORD       ANALYST         350
SMITH      CLERK           160
SCOTT      ANALYST         350
ADAMS      CLERK           200
MILLER     CLERK           200

14 rows selected.


57] SHOW THE NAMES OF ALL EMPLOYEES, AND THE DATE ON WHICH THEY COMPLETED 10 YEARS OF SERVICES.
    
SQL> SELECT ENAME, ADD_MONTHS(HIREDATE,120) FROM EMP;

ENAME      ADD_MONTH
---------- ---------
KING       17-NOV-91
BLAKE      01-MAY-91
CLARK      09-JUN-91
JONES      02-APR-91
MARTIN     28-SEP-91
ALLEN      20-FEB-91
TURNER     08-SEP-91
JAMES      03-DEC-91
WARD       22-FEB-91
FORD       03-DEC-91
SMITH      17-DEC-90
SCOTT      09-DEC-92
ADAMS      12-JAN-93
MILLER     23-JAN-92

14 rows selected.


58] FOR EACH EMPLOYEE DISPLAY THE NUMBER OF DAYS PASSED SINCE THE EMPLOYEE JOINED THE COMPANY.

  1* SELECT ENAME, TO_CHAR(SYSDATE,'J') -TO_CHAR(HIREDATE,'J') "DAYS WORKES" FROM EMP
SQL> /

ENAME      DAYS WORKES
---------- -----------
KING              6159
BLAKE             6359
CLARK             6320
JONES             6388
MARTIN            6209
ALLEN             6429
TURNER            6229
JAMES             6143
WARD              6427
FORD              6143
SMITH             6494
SCOTT             5772
ADAMS             5738
MILLER            6092

14 rows selected.
59] FOR EACH EMPLOYEE DISPLAY THE NUMBER OF MONTHS PASSED SINCE THE EMPLOYEE JOINED THE COMPANY.

  1* SELECT ENAME,FLOOR(MONTHS_BETWEEN(SYSDATE,HIREDATE)) FROM EMP
SQL> /

ENAME      FLOOR(MONTHS_BETWEEN(SYSDATE,HIREDATE))
---------- ---------------------------------------
KING                                           202
BLAKE                                          208
CLARK                                          207
JONES                                          209
MARTIN                                         203
ALLEN                                          211
TURNER                                         204
JAMES                                          201
WARD                                           211
FORD                                           201
SMITH                                          213
SCOTT                                          189
ADAMS                                          188
MILLER                                         200

14 rows selected.


60] DISPLAY THE TENURE  OF SERVICE IN THE YEARS,MONTHS AND DAYS FOR ALL EMPLOYEES.


  1  select  to_char(sysdate,'yyyy')-to_char(hiredate,'yyyy') "year",
  2  months_between(sysdate,hiredate) "months",
  3  to_char(sysdate,'J') - to_char(hiredate,'j') "days"
  4* from  emp
SQL> /

     year    months      days
--------- --------- ---------
       17 203.85858      6204
       17 210.37471      6404
       17 209.11665      6365
       17 211.34245      6433
       17 205.50374      6254
       17 212.76181      6474
       17 206.14891      6274
       17  203.3102      6188
       17 212.69729      6472
       17  203.3102      6188
       18 214.85858      6539
       16 191.11665      5817
       15       190      5783
       16 201.66503      6137

14 rows selected.


61] DISPLAY THE EMPLOYEE DETAILS IN THE FOLLOWING MANNER. 'MILER JOINED ON THE TWENTY-THIRD OF
    JANUARY OF THE YEAR NINTEEN HUNDERD AND EIGHTY TWO'.

  1* SELECT ENAME ||'JOINED ON THE' || '  '||  TO_CHAR(HIREDATE, 'DDSPTH  MONTH  YEAR') FROM EMP
SQL> /

ENAME||'JOINEDONTHE'||''||TO_CHAR(HIREDATE,'DDSPTHMONTHYEAR')
----------------------------------------------------------------------------------------------
KING      JOINED ON THE  SEVENTEENTH  NOVEMBER   NINETEEN EIGHTY-ONE
BLAKE     JOINED ON THE  FIRST  MAY        NINETEEN EIGHTY-ONE
CLARK     JOINED ON THE  NINTH  JUNE       NINETEEN EIGHTY-ONE
JONES     JOINED ON THE  SECOND  APRIL      NINETEEN EIGHTY-ONE
MARTIN    JOINED ON THE  TWENTY-EIGHTH  SEPTEMBER  NINETEEN EIGHTY-ONE
ALLEN     JOINED ON THE  TWENTIETH  FEBRUARY   NINETEEN EIGHTY-ONE
TURNER    JOINED ON THE  EIGHTH  SEPTEMBER  NINETEEN EIGHTY-ONE
JAMES     JOINED ON THE  THIRD  DECEMBER   NINETEEN EIGHTY-ONE
WARD      JOINED ON THE  TWENTY-SECOND  FEBRUARY   NINETEEN EIGHTY-ONE
FORD      JOINED ON THE  THIRD  DECEMBER   NINETEEN EIGHTY-ONE
SMITH     JOINED ON THE  SEVENTEENTH  DECEMBER   NINETEEN EIGHTY
SCOTT     JOINED ON THE  NINTH  DECEMBER   NINETEEN EIGHTY-TWO
ADAMS     JOINED ON THE  TWELFTH  JANUARY    NINETEEN EIGHTY-THREE
MILLER    JOINED ON THE  TWENTY-THIRD  JANUARY    NINETEEN EIGHTY-TWO

14 rows selected.

62] DISPLAY THE DETAILS OF ALL EMPLOYEES, SORTED ON THE NAMES.

SQL> SELECT * FROM EMP
  2  ORDER BY ENAME;

    EMPNO ENAME      JOB             MGR HIREDATE        SAL      COMM    DEPTNO
--------- ---------- --------- --------- --------- --------- --------- ---------
     7876 ADAMS      CLERK          7788 12-JAN-83      1100                  20
     7499 ALLEN      SALESMAN       7698 20-FEB-81      1600       300        30
     7698 BLAKE      MANAGER        7839 01-MAY-81      2850                  30
     7782 CLARK      MANAGER        7839 09-JUN-81      2450                  10
     7902 FORD       ANALYST        7566 03-DEC-81      3000                  20
     7900 JAMES      CLERK          7698 03-DEC-81       950                  30
     7566 JONES      MANAGER        7839 02-APR-81      2975                  20
     7839 KING       PRESIDENT           17-NOV-81      5000                  10
     7654 MARTIN     SALESMAN       7698 28-SEP-81      1250      1400        30
     7934 MILLER     CLERK          7782 23-JAN-82      1300                  10
     7788 SCOTT      ANALYST        7566 09-DEC-82      3000                  20
     7369 SMITH      CLERK          7902 17-DEC-80       800                  20
     7844 TURNER     SALESMAN       7698 08-SEP-81      1500         0        30
     7521 WARD       SALESMAN       7698 22-FEB-81      1250       500        30

14 rows selected.

63] DISPLAY THE NAME OF ALL EMPLOYEES, BASED ON THEIR TENURE, 
    WITH THE OLDEST EMPLOYEE COMING FIRST.

SQL> SELECT * FROM EMP
  2  ORDER BY HIREDATE;

    EMPNO ENAME      JOB             MGR HIREDATE        SAL      COMM    DEPTNO
--------- ---------- --------- --------- --------- --------- --------- ---------
     7369 SMITH      CLERK          7902 17-DEC-80       800                  20
     7499 ALLEN      SALESMAN       7698 20-FEB-81      1600       300        30
     7521 WARD       SALESMAN       7698 22-FEB-81      1250       500        30
     7566 JONES      MANAGER        7839 02-APR-81      2975                  20
     7698 BLAKE      MANAGER        7839 01-MAY-81      2850                  30
     7782 CLARK      MANAGER        7839 09-JUN-81      2450                  10
     7844 TURNER     SALESMAN       7698 08-SEP-81      1500         0        30
     7654 MARTIN     SALESMAN       7698 28-SEP-81      1250      1400        30
     7839 KING       PRESIDENT           17-NOV-81      5000                  10
     7900 JAMES      CLERK          7698 03-DEC-81       950                  30
     7902 FORD       ANALYST        7566 03-DEC-81      3000                  20
     7934 MILLER     CLERK          7782 23-JAN-82      1300                  10
     7788 SCOTT      ANALYST        7566 09-DEC-82      3000                  20
     7876 ADAMS      CLERK          7788 12-JAN-83      1100                  20

14 rows selected.
64] DISPLAY THE NAMES, JOB AND SALARY OF ALL EMPLOYEES SORTED ON JOBS AND SALARY.

SQL> SELECT ENAME,JOB,SAL FROM EMP
  2  ORDER BY JOB,SAL;

ENAME      JOB             SAL
---------- --------- ---------
FORD       ANALYST        3000
SCOTT      ANALYST        3000
SMITH      CLERK           800
JAMES      CLERK           950
ADAMS      CLERK          1100
MILLER     CLERK          1300
CLARK      MANAGER        2450
BLAKE      MANAGER        2850
JONES      MANAGER        2975
KING       PRESIDENT      5000
MARTIN     SALESMAN       1250
WARD       SALESMAN       1250
TURNER     SALESMAN       1500
ALLEN      SALESMAN       1600

14 rows selected.

65] DISPLAY THE NAMES, JOB AND SALARY OF ALL EMPLOYEES, SORTED ON JOBS AND WITHIN JOB, 
    SORTED ON THE  DESCENDING ORDER OF SALARY.

SQL> SELECT ENAME,JOB,SAL FROM EMP
  2  ORDER BY JOB,SAL DESC;

ENAME      JOB             SAL
---------- --------- ---------
FORD       ANALYST        3000
SCOTT      ANALYST        3000
MILLER     CLERK          1300
ADAMS      CLERK          1100
JAMES      CLERK           950
SMITH      CLERK           800
JONES      MANAGER        2975
BLAKE      MANAGER        2850
CLARK      MANAGER        2450
KING       PRESIDENT      5000
ALLEN      SALESMAN       1600
TURNER     SALESMAN       1500
MARTIN     SALESMAN       1250
WARD       SALESMAN       1250

14 rows selected.


66] DISPLAY THE NAMES, JOB AND SALARY OF ALL EMPLOYEES, SORTED ON DESCENDING ORDER OF JOB
    AND WITHIN JOB, SORTED ON THE DESCENDING ORDER OF SALARY.

SQL> SELECT ENAME,JOB,SAL FROM EMP
  2   ORDER BY JOB DESC,SAL DESC;

ENAME      JOB             SAL
---------- --------- ---------
ALLEN      SALESMAN       1600
TURNER     SALESMAN       1500
MARTIN     SALESMAN       1250
WARD       SALESMAN       1250
KING       PRESIDENT      5000
JONES      MANAGER        2975
BLAKE      MANAGER        2850
CLARK      MANAGER        2450
MILLER     CLERK          1300
ADAMS      CLERK          1100
JAMES      CLERK           950
SMITH      CLERK           800
FORD       ANALYST        3000
SCOTT      ANALYST        3000

14 rows selected.


67] DISPLAY THE NAME, MONTH AND YEAR OF ALL EMPLOYEES, SORTED ON THE MONTH OF THEIR HIREDATE
    IRRESPECTIVE OF THE YEAR.


  1* SELECT ENAME, TO_CHAR(HIREDATE, 'MON  YY') FROM EMP ORDER BY TO_CHAR(HIREDATE,'MM')
SQL> /

ENAME      TO_CHAR
---------- -------
ADAMS      JAN  83
MILLER     JAN  82
ALLEN      FEB  81
WARD       FEB  81
JONES      APR  81
BLAKE      MAY  81
CLARK      JUN  81
MARTIN     SEP  81
TURNER     SEP  81
KING       NOV  81
JAMES      DEC  81
FORD       DEC  81
SMITH      DEC  80
SCOTT      DEC  82

14 rows selected.


68] DISPLAY THE NAME, MONTH AND YEAR OF JOINING OF ALL EMPLOYEES, SORTED ON THE MONTH OF THEIR
    HIREDATE,AND WITHIN THAT ON THE YEAR, WITH THE EARLIEST YEAR APPERING FIRST.

  1  SELECT ENAME, TO_CHAR(HIREDATE,'MON  YY') FROM EMP
  2* ORDER BY TO_CHAR(HIREDATE,'MM') , TO_CHAR(HIREDATE,'YY') DESC
SQL> /

ENAME      TO_CHAR
---------- -------
ADAMS      JAN  83
MILLER     JAN  82
ALLEN      FEB  81
WARD       FEB  81
JONES      APR  81
BLAKE      MAY  81
CLARK      JUN  81
MARTIN     SEP  81
TURNER     SEP  81
KING       NOV  81
SCOTT      DEC  82
JAMES      DEC  81
FORD       DEC  81
SMITH      DEC  80

14 rows selected.