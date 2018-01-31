Q1
	mysql - select * from employees where day(hire_date)>15;

	oracle - select * from employees where to_char(HIRE_DATE,'dd')>15;
---------------------------------------------------------------------------------------------------------------------
Q2
	mysql - select c.country_id,count(l.city) as count from Countries c left join 
		Locations l
		on c.country_id = l.country_id
		group by c.country_id;

	oracle - select c.country_id,count(l.city) as count from Countries c left join 
		 Locations lon c.country_id = l.country_id
		group by c.country_id;
---------------------------------------------------------------------------------------------------------------------
Q3
	mysql - select d.department_id,count(e.employee_id) numberofemployee,avg(e.salary) salaryaverage from  departments d 
		left join employees e
		on d.department_id = e.department_id where e.commission_pct is not null and e.commission_pct>=0 
		group by d.department_id;


	oracle - select d.department_id,count(e.employee_id) numberofemployee,avg(e.salary) salaryaverage 
		from  departments d left join employees e
		on d.department_id = e.department_id where e.commission_pct is not null and e.commission_pct>=0 
		group by d.department_id;
---------------------------------------------------------------------------------------------------------------------

Q4
	mysql - select j.job_id,count(e.employee_id) numberofemployee,sum(e.salary) sumofsalary,(max(e.salary)-min(e.salary)) salary_diff 
			from  test_intern_jobs j left join test_intern_employees e
			on j.job_id = e.job_id  group by j.job_id;


	oracle - select j.job_id,count(e.employee_id) numberofemployee,sum(e.salary) sumofsalary,(max(e.salary)-min(e.salary)) salary_diff 
			 from  test_intern_jobs j left join test_intern_employees e
			 on j.job_id = e.job_id  group by j.job_id;

---------------------------------------------------------------------------------------------------------------------

Q5
	mysql - select YEAR(hire_date) as year from test_intern_employees 
			group by year having count(employee_id) > 10;


	oracle - select to_char(hire_date,'YYYY') as year from test_intern_employees 
			 group by to_char(hire_date,'YYYY') 
			 having count(employee_id) > 10;

---------------------------------------------------------------------------------------------------------------------

Q6
	mysql - select d.department_id,count(e.employee_id) numberofemployee from  test_intern_departments d 
			left join test_intern_employees e
			on d.department_id = e.department_id 
			where e.commission_pct is not null and e.commission_pct>=0 
			group by d.department_id having count(e.employee_id)>5;


	oracle - select d.department_id,count(e.employee_id) numberofemployee from  test_intern_departments d 
			left join test_intern_employees e
			on d.department_id = e.department_id 
			where e.commission_pct is not null and e.commission_pct>=0 
			group by d.department_id having count(e.employee_id)>5;

---------------------------------------------------------------------------------------------------------------------

Q7
	mysql - select d.department_id,count(e.employee_id) numberofemployee from  test_intern_departments d 
			left join test_intern_employees e
			on d.department_id = e.department_id 
			where e.commission_pct is not null and e.commission_pct>=0 
			group by d.department_id having count(e.employee_id)>5;


	oracle - select d.department_id,count(e.employee_id) numberofemployee from  test_intern_departments d 
			left join test_intern_employees e
			on d.department_id = e.department_id 
			where e.commission_pct is not null and e.commission_pct>=0 
			group by d.department_id having count(e.employee_id)>5;


---------------------------------------------------------------------------------------------------------------------

Q8
	mysql - select employee_id,count(employee_id) as numberofjobs from test_intern_job_history 
			group by employee_id having numberofjobs>1;


	oracle - select employee_id,count(employee_id) as numberofjobs from test_intern_job_history 
			group by employee_id having count(employee_id)>1;

---------------------------------------------------------------------------------------------------------------------



Q9
	mysql - select job_id,count(employee_id) numberofemployee from test_intern_employees
			where job_id is not null and DATEDIFF(now(),hire_date) > 100 
			group by job_id having numberofemployee > 3;


	oracle - select job_id,count(employee_id) numberofemployee from test_intern_employees
			 where job_id is not null and ROUND(sysdate-to_date(hire_date)) > 100 
  		     group by job_id having count(employee_id) > 3;

---------------------------------------------------------------------------------------------------------------------


Q10
	mysql - select d.department_id,year(hire_date),count(e.employee_id) from test_intern_departments d 
			left join test_intern_employees e on d.department_id = e.department_id
			group by d.department_id,year(hire_date);


	oracle - select d.department_id,to_char(hire_date,'YYYY'),count(e.employee_id) from test_intern_departments d 
			left join test_intern_employees e on d.department_id = e.department_id
			group by d.department_id,to_char(hire_date,'YYYY');

---------------------------------------------------------------------------------------------------------------------


Q11
	mysql - select department_name from njindiainvest.test_intern_departments where 
			department_id in( select  m.employee_id from njindiainvest.test_intern_employees e,
			njindiainvest.test_intern_employees m
			where e.manager_id=m.employee_id group by m.employee_id having count(e.employee_id) > 5
			);



	oracle - select department_name from njindiainvest.test_intern_departments where 
			department_id in( select  m.employee_id from njindiainvest.test_intern_employees e,
			njindiainvest.test_intern_employees m
			where e.manager_id=m.employee_id group by m.employee_id having count(e.employee_id) > 5
			);

---------------------------------------------------------------------------------------------------------------------


Q12
	mysql - select d.department_name,e.first_name,l.city  from test_intern_departments d inner join 
 			test_intern_employees e on d.manager_id = e.employee_id inner join test_intern_locations l 
			on l.location_id = d.location_id;




	oracle - select d.department_name,e.first_name,l.city  from test_intern_departments d inner join 
 			test_intern_employees e on d.manager_id = e.employee_id inner join test_intern_locations l 
			on l.location_id = d.location_id;

---------------------------------------------------------------------------------------------------------------------


Q13
	mysql - select d.department_name,l.city,c.country_name  from test_intern_departments d  
			inner join test_intern_locations l on l.location_id = d.location_id
			inner join test_intern_countries c on c.country_id = l.country_id;


	oracle - select d.department_name,l.city,c.country_name  from test_intern_departments d  
			inner join test_intern_locations l on l.location_id = d.location_id
			inner join test_intern_countries c on c.country_id = l.country_id;

---------------------------------------------------------------------------------------------------------------------

Q14
	mysql - select j.job_title,d.department_name, e.last_name,h.start_date from njindiainvest.test_intern_employees e 
			inner join test_intern_job_history h on h.employee_id = e.employee_id
			inner join njindiainvest.test_intern_departments d on h.department_id = d.department_id
			inner join njindiainvest.test_intern_jobs j on h.job_id = j.job_id 
			where year(h.start_date) between 2000 and 2005;

	oracle - select j.job_title,d.department_name, e.last_name,h.start_date from test_intern_employees e 
			inner join test_intern_job_history h on h.employee_id = e.employee_id
			inner join test_intern_departments d on h.department_id = d.department_id
			inner join test_intern_jobs j on h.job_id = j.job_id 
			where to_char(h.start_date,'YYYY') between 2000 and 2005;

---------------------------------------------------------------------------------------------------------------------

Q15
	mysql - select j.job_title,avg(e.salary) average from test_intern_jobs j left join
			test_intern_employees e on e.job_id = j.job_id group by e.job_id;

	oracle - select j.JOB_TITLE, avg(e.salary) average from test_intern_jobs j left join
			 test_intern_employees e on j.job_id = e.job_id group by j.JOB_TITLE;

---------------------------------------------------------------------------------------------------------------------

Q16
	mysql - select e.first_name,j.job_id,j.job_title,h.start_date,h.end_date,d.department_name 
			from test_intern_jobs j inner join 	test_intern_job_history h
			on j.job_id =  h.job_id inner join test_intern_departments d
			on h.department_id = d.department_id
			inner join test_intern_employees e
			on e.employee_id = h.employee_id
			where h.employee_id in (select employee_id from test_intern_employees where salary > 15000);


	oracle - select e.first_name,j.job_id,j.job_title,h.start_date,h.end_date,d.department_name 
			from test_intern_jobs j inner join 	test_intern_job_history h
			on j.job_id =  h.job_id inner join test_intern_departments d
			on h.department_id = d.department_id
			inner join test_intern_employees e
			on e.employee_id = h.employee_id
			where h.employee_id in (select employee_id from test_intern_employees where salary > 15000);

---------------------------------------------------------------------------------------------------------------------

Q17
	mysql - select d.department_name,concat(e.first_name,e.last_name,' ') as managername,e.salary 
			from test_intern_departments d inner join
			test_intern_employees e on e.employee_id =  d.manager_id
		    where TIMESTAMPDIFF(year,e.hire_date, now()) >5 ;


	oracle - select d.department_name as managername,e.salary from test_intern_departments d inner join
 			test_intern_employees e on e.employee_id =  d.manager_id 
			where trunc(months_between(sysdate,e.hire_date)/12) > 5;


--------------------------------------------------------------------------------------------------------------------

Q18
	mysql - select e.first_name,j.job_title from test_intern_employees e inner join 
			test_intern_job_history h on e.employee_id =  h.employee_id 
			inner join test_intern_jobs j on j.job_id =  h.job_id where  
			period_diff(concat(year(h.end_date),if(month(h.end_date)<10,'0',''),month(h.end_date)), 
			concat(year(h.start_date),if(month(h.start_date)<10,'0',''),month(h.start_date))) < 6;


	oracle - select e.first_name,j.job_title from test_intern_employees e inner join 
			test_intern_job_history h on e.employee_id =  h.employee_id 
			inner join test_intern_jobs j on j.job_id =  h.job_id 
			where  MONTHS_BETWEEN(h.end_date,h.start_date) <6;


--------------------------------------------------------------------------------------------------------------------

Q19
	mysql - select d.department_name,avg(e.salary) average,count(e.employee_id) numberofemployee 
			from njindiainvest.test_intern_departments d
			left join test_intern_employees e on e.department_id =  d.department_id
			where e.commission_pct is not null and e.commission_pct > 0
			group by d.department_id;


	oracle -select d.department_name,avg(e.salary) average,count(e.employee_id) numberofemployee 
			from test_intern_departments d
			left join test_intern_employees e on e.department_id =  d.department_id
			where e.commission_pct is not null and e.commission_pct > 0
			group by d.department_name;


--------------------------------------------------------------------------------------------------------------------

Q20
	mysql - select Month(hire_date) from njindiainvest.test_intern_employees 
			where hire_date is not null group by Month(hire_date) 
			having count(employee_id) >5 ;


	oracle -select to_char(hire_date,'mm') from test_intern_employees 
			where hire_date is not null group by to_char(hire_date,'mm')
			having count(employee_id) >5 ;;


--------------------------------------------------------------------------------------------------------------------

Q21
	mysql - select d.department_id,d.department_name,max(e.salary) max_salary  from njindiainvest.test_intern_departments d
			left join test_intern_employees e on e.department_id =  d.department_id
			group by d.department_id having max(e.salary)>10000;


	oracle -select d.department_id,d.department_name,max(e.salary) max_salary  from test_intern_departments d
			left join test_intern_employees e on e.department_id =  d.department_id
			group by d.department_id,d.department_name having max(e.salary)>10000;


--------------------------------------------------------------------------------------------------------------------
Q22
	mysql - select j.job_title from njindiainvest.test_intern_jobs j inner join
			njindiainvest.test_intern_employees e on e.job_id = j.job_id 
			where year(e.hire_date) = year(now());


	oracle - select j.job_title from test_intern_jobs j inner join
			test_intern_employees e on e.job_id = j.job_id 
			where to_char(e.hire_date,'yyyy') = to_char(sysdate,'yyyy');


--------------------------------------------------------------------------------------------------------------------

Q23
	mysql - select * from  test_intern_employees where employee_id not in
			(select employee_id from test_intern_job_history);


	oracle -select * from  test_intern_employees where employee_id not in
			(select employee_id from test_intern_job_history);


--------------------------------------------------------------------------------------------------------------------

Q24
	mysql - select j.job_title,avg(e.salary) from test_intern_job_history h
			inner join test_intern_jobs j on h.job_id =  j.job_id
			inner join test_intern_employees e on e.employee_id = h.employee_id
			group by j.job_title;


	oracle - select j.job_title,avg(e.salary) from test_intern_job_history h
			inner join test_intern_jobs j on h.job_id =  j.job_id
			inner join test_intern_employees e on e.employee_id = h.employee_id
			group by j.job_title;


--------------------------------------------------------------------------------------------------------------------

Q25
	mysql - select c.country_name,l.city,count(d.location_id) numberofdepartment
			from test_intern_countries c
			inner join test_intern_locations l on l.country_id =  c.country_id
			inner join test_intern_departments d on l.location_id = d.location_id
			where d.department_id in  (select d.department_id from  test_intern_departments d 
			inner join test_intern_employees e on d.department_id = e.department_id
			group by e.department_id having count(e.employee_id) > 5)
			group by c.country_name,d.LOCATION_ID;


	oracle - select c.country_name,l.city,count(d.location_id) numberofdepartment
			from test_intern_countries c
			inner join test_intern_locations l on l.country_id =  c.country_id
			inner join test_intern_departments d on l.location_id = d.location_id
			where d.department_id in  (select d.department_id from  test_intern_departments d 
			inner join test_intern_employees e on d.department_id = e.department_id
			group by e.department_id having count(e.employee_id) > 5)
			group by c.country_name,d.LOCATION_ID;


--------------------------------------------------------------------------------------------------------------------

Q26
	mysql - select m.employee_id, m.first_name from test_intern_employees e
			inner join test_intern_employees m 
			on e.manager_id = m.employee_id group by e.manager_id 
			having count(e.employee_id)>5;


	oracle - select e.manager_id,m.FIRST_NAME from test_intern_employees e
			inner join test_intern_employees m 
			on e.manager_id = m.employee_id group by e.manager_id,m.FIRST_NAME,m.SALARY
			having count(e.employee_id)>5;


--------------------------------------------------------------------------------------------------------------------

Q27
	mysql - select department_id,department_name from test_intern_departments 
			where department_id not in(
			select department_id  from test_intern_employees
			where year(hire_date) > year(now()) - 2)


	oracle - select department_id,department_name from test_intern_departments 
			where department_id not in(
			select department_id  from test_intern_employees
			where to_char(hire_date,'yyyy') > to_char(sysdate,'yyyy') - 2);


--------------------------------------------------------------------------------------------------------------------



Q28
	mysql - select d.department_name  from test_intern_departments d
			inner join test_intern_employees e 
			on e.department_id = d.department_id 
			where e.employee_id in (
			select h.employee_id from test_intern_job_history h
			) group by d.department_name having max(e.salary)>10000;


	oracle - select d.department_name  from test_intern_departments d
			inner join test_intern_employees e 
			on e.department_id = d.department_id 
			where e.employee_id in (
			select h.employee_id from test_intern_job_history h
			) group by d.department_name having max(e.salary)>10000;


--------------------------------------------------------------------------------------------------------------------

Q29
	mysql  - SELECT salary FROM employees order by salary desc limit 2,1;

  	oracle - select min(salary) from (select SALARY from employees  where ROWNUM <= 3 order by salary desc);




=====================================================================================================================
		*****************************************PLSQL Blocks*****************************************
=====================================================================================================================
Q1 
ORACLE : 
		set serveroutput on
		declare 
		employeename varchar2(50);
		departmentname varchar2(50);
		begin
		select e.first_name,d.department_name into employeename,departmentname from test_intern_employees e
		inner join test_intern_departments d on 
		e.department_id = d.department_id
		where employee_id = (select manager_id from test_intern_employees where employee_id = 2);

		dbms_output.put_line('Employee Name : '|| employeename); 
		dbms_output.put_line('Department Name : '|| departmentname); 
		end;
		/

MYSQL :
		CREATE DEFINER=`mysqldb`@`%` PROCEDURE `getEmployeeManagerInfo`
			(in employeeid int,out employeename varchar(30),out departmentname varchar(30))
		BEGIN
			 select e.first_name,d.department_name into employeename,departmentname from test_intern_employees e
			inner join test_intern_departments d on 
			e.department_id = d.department_id
			where employee_id = (select manager_id from test_intern_employees where employee_id = employeeid);
		END
		--------------------------------------------------
		call getEmployeeManagerInfo(4,@empname,@depname);
		select @empname,@depname;	
--------------------------------------------------------------------------------------------------------------------

Q2

ORACLE :
		declare
		hireyear NUMBER;
		
		cursor monthwisehire(hireyear number) is
			SELECT extract(year from HIRE_DATE) as hiredate,extract(month from HIRE_DATE) hiremonth,
			count(EMPLOYEE_ID) employeecount FROM test_intern_employees
			where extract(year from HIRE_DATE) = hireyear
			group by  extract(year from HIRE_DATE),extract(month from HIRE_DATE) order by count(EMPLOYEE_ID) desc;
		
		employee_rec monthwisehire%ROWTYPE;
		begin
			select hiredate into hireyear  from(SELECT extract(year from HIRE_DATE) as hiredate FROM test_intern_employees
			group by  extract(year from HIRE_DATE) order by count(EMPLOYEE_ID) desc) where ROWNUM=1;    
			dbms_output.put_line('Maximum Employee joined in Year : '|| hireyear); 
		
			open monthwisehire(hireyear);

			loop 
				fetch monthwisehire into employee_rec;        
				EXIT WHEN monthwisehire%NOTFOUND;
				dbms_output.put_line('Month :'|| employee_rec.hiremonth||' '||' Number Of Employee Join : '||employee_rec.employeecount);         
			end loop;    

			CLOSE monthwisehire;
		end;
--------------------------------------------------------------------------------------------------------------------

Q3

ORACLE :
		declare
	    countemp number;
		updatedsalary number;
		begin 
			select count(*) into countemp FROM TEST_INTERN_EMPLOYEES WHERE FIRST_NAME = 'Jeo';
			if countemp > 0 then
				select SALARY into updatedsalary FROM TEST_INTERN_EMPLOYEES
				WHERE FIRST_NAME = 'Jeo' and rownum<=1 order by salary;
			else 
				select avg(salary) into updatedsalary from TEST_INTERN_EMPLOYEES;    
			end if;
			update TEST_INTERN_EMPLOYEES set salary = 1000 where EMPLOYEE_ID = 130;
			dbms_output.put_line('Updated Successfully...');
			EXCEPTION 
			   WHEN no_data_found THEN 
				  dbms_output.put_line('No such Employee!'); 
				WHEN others THEN 
					dbms_output.put_line('Error!'); 
		end;

--------------------------------------------------------------------------------------------------------------------

Q4

ORACLE :

		declare 
		cursor employeejob is
		SELECT j.job_title ,e.first_name FROM TEST_INTERN_EMPLOYEES e 
		inner join TEST_INTERN_JOB_HISTORY h on h.EMPLOYEE_ID = e.EMPLOYEE_ID
		inner join TEST_INTERN_JOBS j on e.JOB_ID = j.job_id
		where e.HIRE_DATE =  h.START_DATE;
			emprec employeejob%ROWTYPE;
		begin

		open employeejob;

		LOOP
			FETCH employeejob INTO emprec;
				EXIT WHEN employeejob%NOTFOUND;
				dbms_output.put_line('JOB Title : '||emprec.job_title||' Name : '||emprec.first_name);
			END LOOP;
		close employeejob;
			EXCEPTION 
			   WHEN INVALID_CURSOR THEN 
				  dbms_output.put_line('No such Employee!'); 
				WHEN no_data_found THEN 
				  dbms_output.put_line('No such Employee!'); 
				WHEN others THEN 
				    dbms_output.put_line('Error!'); 
		end;

--------------------------------------------------------------------------------------------------------------------



Q5. Remain

Q6. Remain

Q7. Remain



---------------------------------------------------------------------------------

Q8.
No such Table Found, may occurce
it will allows to change or delete.
But when we execute the procedure then it will gives error.

---------------------------------------------------------------------------------
Q9.

   9.1
    exception. first we need to open cursor.
    After fetch statement is used.
    then fetch course_no from the table and update cost value one by one using loop.

  9.2
    after all update done,because partial update may occurce do to some reasons so
    so after end of the loop we can COMMIT.

  9.3  
    SELECT text FROM all_source WHERE name='Discount';

---------------------------------------------------------------------------------
Q10.

	create or replace procedure pro_check_weekend
	is
	  username varchar2(30);
	  valid number;
	  invalid number;
	begin
	  
	  if to_char(sysdate,'dy') in ('sat','sun') then
	      dbms_output.put_line('today is weekend.');
	  else
	      dbms_output.put_line('today is weekday.');
	  end if;
	  
	  select user into username from dual;
	  
	  select count(object_name) into valid
	  from dba_objects
	  where
	  status = 'valid' and object_type ='procedure';
	  
	  select count(object_name) into invalid
	  from dba_objects
	  where
	  status = 'invalid' and object_type ='procedure';
	  
	  dbms_output.put_line('Username is : '|| username);
	  dbms_output.put_line('Current time : '|| to_char(current_timestamp,'hh24:mi:ss'));
	  dbms_output.put_line('Valid procedure : '|| valid);
	  dbms_output.put_line('Invalid procedure : '|| invalid);
	  
	end;

