SELECT name,counted_leads FROM (Select name,count(DATE_FORMAT(created_at,'%d-%m-%y')) as counted_leads from users group by DATE_FORMAT(created_at,'%d-%m-%y')) r;


select *,
  sum(value) over (partition by name order by day) Total,
  sum(value2) over (partition by name2 order by day) SumValue2
from tablename 
order by day 

sum(counted_leads) over (partition by counted_leads ORDER BY counted_leads) SumValue


SELECT DAYNAME(mydate),counted_leads 
	FROM (
			Select DATE_FORMAT(created_at,'%d-%m-%y') as mydate, 
			count(DATE_FORMAT(created_at,'%d-%m-%y')) as counted_leads 
			from users 
			group by DATE_FORMAT(created_at,'%d-%m-%y') 
		) r;


#count current user with total user row by row with day name
SELECT DAYNAME(mydate) as dayName,counted_leads as currentUserCount,sum(counted_leads) over (order by mydate) Total 
FROM ( 
	Select DATE_FORMAT(created_at,'%d-%m-%y') as mydate, count(DATE_FORMAT(created_at,'%d-%m-%y')) as counted_leads 
	from users group by DATE_FORMAT(created_at,'%d-%m-%y') 
	) r;

#count current user with total user row by row with day name and where cluase, limit
SELECT mydate,DAYNAME(mydate) as dayName,counted_leads as currentUserCount,sum(counted_leads) over (order by mydate) Total 
FROM ( 
	Select DATE_FORMAT(created_at,'%d-%m-%y') as mydate, count(DATE_FORMAT(created_at,'%d-%m-%y')) as counted_leads 
	from users where status=1 group by DATE_FORMAT(created_at,'%d-%m-%y') limit 2
	) r;


for current week data
 created_at > date_sub( curdate(), interval 7 day)

 select 
 (select count(created_at) from users) as totaluser, 
 (select count(name) from users) as totalusers,
 (select count(created_at) from users where created_at < date_sub( curdate(), interval 7 day)) as runnitotal; 

 SELECT mydate,DAYNAME(mydate) as dayName,counted_leads as currentUserCount,sum(counted_leads) over (order by mydate) Total 
FROM ( 
	Select DATE_FORMAT(created_at,'%d-%m-%y') as mydate, count(created_at) as counted_leads 
	from users  group by DATE_FORMAT(created_at,'%d-%m-%y') 
	) r;

SELECT mydate,DAYNAME(mydate) as dayName,counted_leads as currentUserCount,
sum( counted_leads + (
	select count(created_at) 
	from users 
	where created_at < date_sub( curdate(), interval 7 day))
) over (order by mydate) Total 

FROM 
( Select DATE_FORMAT(created_at,'%d-%m-%y') as mydate, count(DATE_FORMAT(created_at,'%d-%m-%y')) as counted_leads 
	from users 
	where created_at > date_sub( curdate(), interval 7 day) 
	group by DATE_FORMAT(created_at,'%d-%m-%y') ) r;




SELECT mydate,DAYNAME(mydate) as dayName,counted_leads as currentUserCount,
sum(counted_leads) over (order by mydate) Total,
count(counted_leads) over (order by mydate) sno
FROM ( 
	Select DATE_FORMAT(created_at,'%d-%m-%y') as mydate, count(DATE_FORMAT(created_at,'%d-%m-%y')) as counted_leads 
	from users where created_at > date_sub( curdate(), interval 7 day) group by DATE_FORMAT(created_at,'%d-%m-%y') 
	) r;