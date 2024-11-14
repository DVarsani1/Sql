create database dhruv;
use dhruv;

select * from empdata;

alter table empdata add column ( Emp_name varchar(50));

update empdata set Emp_name = concat(FirstName ," " ,LastName);

alter table empdata drop column FirstName;
alter table empdata drop column LastName;

update empdata set Emp_name = replace(Emp_name,'@' ,'');
select Emp_name from empdata;

update empdata set Emp_name = rtrim(Emp_name);


alter table empdata add column ( Emp_ID varchar(50));
update empdata set Emp_ID = Concat(EmpID,left(Emp_name,3));

select Emp_ID from empdata;


select Emp_name ,count(*) from empdata group by Emp_name having count(*)>1 ;

UPDATE empdata
SET StartDate = str_to_date(StartDate, '%d-%b-%y');

UPDATE empdata
SET exitdate = str_to_date(exitdate ,'%d-%b-%y') 












