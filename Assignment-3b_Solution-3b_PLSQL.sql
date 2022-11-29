[1]

 declare
   eno number(5);
   salary emp.sal%type;
   low_sal exception;
 begin
   eno:=&empno;
   select sal into salary from emp where empno=eno;
   if salary < 2000 then
     raise low_sal;
   else
     update emp set sal = sal+1000 where empno= eno;
   end if;
 exception
    when low_sal then
      dbms_output.put_line('salary is less then 2000');
 end;


[2]

 declare
   f1 number := 1;
   f2 number := 1;
   f3 number := 1;
 begin
   while f3 <=50 loop
      f2 := f1;
      f1 := f3;
      f3 := f1+f2;
      dbms_output.put_line(f1||'  '||f2||'   '||f3);
   end loop;
 end;

1  1   2
2  1   3
3  2   5
5  3   8
8  5   13
13  8   21
21  13   34
34  21   55


[3]

 declare
   cursor c1 is select empno,ename,job,sal,emp.deptno,dname,loc
   from emp,dept where emp.deptno = dept.deptno;
   emp_rec c1%rowtype;
   recno number := 1;
 begin
   open c1;
   fetch c1 into emp_rec;
   while c1%found = true loop
     dbms_output.put_line(recno||'  '||emp_rec.empno||' '||
      emp_rec.ename||'  '||emp_rec.job||'  '||emp_rec.sal||'   '||
      emp_rec.deptno||'  '||emp_rec.dname||'  '||emp_rec.loc);
      recno := recno+1;
      fetch c1 into emp_rec;
   end loop;
   close c1;
 end;

[4]

 declare
   cursor d1(dno number) is select * from emp
     where deptno = dno;
   emprec d1%rowtype;
 begin
   open d1(&dno);
   fetch d1 into emprec;
   while d1%found = true loop
     dbms_output.put_line(emprec.empno||'  '||emprec.ename||'  '||
       emprec.deptno||'  '||emprec.job||' '||emprec.sal);
      fetch d1 into emprec;
   end loop;/

   close d1;
 end;

[5]

 create or replace procedure p1 (eno number) as
 begin
   delete from emp where empno=eno;
   dbms_output.put_line('record deleted');
 end;
 /

 exec p1(7934);

[6]

 create or replace function f1(dno number)  return number is
   netsal number;
   begin
   select sum(nvl(sal,0)+nvl(comm,0)) into netsal from emp
     where deptno = dno;
   return netsal;
 end;

 declare
   salary number;
 begin
  salary := f1(10);
  dbms_output.put_line('the netsalary is '||salary);
 end;


[7]

create or replace function addition(a number, b number) return number is 
begin
  return a+b;
end;

 select addition(5,10) from dual;

[8]

 create or replace package pack1 is
  procedure p1(name varchar2);
  function f1(dno number) return number;
 end pack1;


 create or replace package body pack1 as
 procedure p1(name varchar2) as
   desig emp.job%type;
 begin
   select job into desig from emp where ename=upper(name);
   if desig = 'CLERK' then
     update emp set sal = sal+1000 where ename=upper(name);
     dbms_output.put_line('bonus rs. 1000');
   else
     update emp set sal = sal+ 2000 where ename=upper(name);
     dbms_output.put_line('bonus rs. 2000');
   end if;
 end p1;
 function f1(dno number) return number is
   total number;
 begin
   select count(*) into total from emp where deptno=dno;
   return total;
 end f1;
 end pack1;

 exec pack1.p1('MILLER');

 BEGIN
   DBMS_OUTPUT.PUT_LINE(PACK1.F1(10));
 END;

[9]

 CREATE TABLE DEPT_BACKUP AS SELECT * FROM DEPT;

 SELECT * FROM DEPT_BACKUP;

DEPTNO DNAME          LOC
------ -------------- -------------
    10 ACCOUNTING     NEW YORK
    20 RESEARCH       DALLAS
    30 SALES          CHICAGO
    40 OPERATIONS     BOSTON

 CREATE OR REPLACE TRIGGER DEPT_BACKUP_TRG
 AFTER INSERT ON DEPT FOR EACH ROW
 BEGIN
  INSERT INTO DEPT_BACKUP VALUES(:NEW.DEPTNO,:NEW.DNAME,:NEW.LOC);
 END;

 INSERT INTO DEPT VALUES (50,'IT','MUMBAI');

 SELECT * FROM DEPT_BACKUP;


[10]

create or replace view empdep as 
select empno,ename,emp.deptno,dname,loc from emp,dept
where emp.deptno=dept.deptno;

create or replace trigger view_trg instead of insert on empdep
for each row
declare
  cursor c1 is select * from dept;
  a c1%rowtype;
  f number := 0;
begin
  open c1;
  loop
    fetch c1 into a;
    exit when c1%notfound;
    if :new.deptno=a.deptno then
       f := 1;
       exit;
    end if;
  end loop;
    if f=1 then
       insert into emp(empno,ename,deptno) values
         (:new.empno,:new.ename,:new.deptno);
    else
      insert into dept values (:new.deptno,:new.dname,:new.loc);
      insert into emp(empno,ename,deptno) values
        (:new.empno,:new.ename,:new.deptno);
    end if;
end;


DEPTNO DNAME          LOC
------ -------------- -------------
    10 ACCOUNTING     NEW YORK
    20 RESEARCH       DALLAS
    30 SALES          CHICAGO
    40 OPERATIONS     BOSTON
    50 IT             MUMBAI

