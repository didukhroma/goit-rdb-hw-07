use hw3;

-- 1
select id,date,year(date) year, month(date) month, day(date) day from orders;

-- 2
select id,date, date + interval 1 day date_plus from orders; 


-- 3
select id,date, round(unix_timestamp(date),0)  timestamp from orders;

-- 4
select count(*) from orders where date between '1996-07-10 00:00:00' and '1996-10-08 00:00:00';


-- 5
 drop function if exists CreateData  ;
 delimiter //
 
 create function CreateData(id_value int, date_value date)
 returns json
 deterministic
 no sql
 begin
 return json_object('id',id_value,'date',date_value); 
 end// 
 
 delimiter ;
 
 select id,date,createdata(id,date) json_data from orders ;