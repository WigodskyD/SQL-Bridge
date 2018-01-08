#Dan Wigodsky
#SQL Bridge week 1

#------------------------------1---------------------------------------

select distinct distance
from flights
where
distance in
(select 
max(distance) 
from flights);
# JFK is 4983 miles from HNL  (a Google search was needed to clarify miles as unit)

#------------------------------2---------------------------------------

select 
manufacturer, model, engines, seats
from planes
where seats in
(select 
max(seats)
from planes
group by engines)
group by engines;

#------------------------------3-----------------------------------------

select
count(distinct flight,carrier) as 'total distinct flights'
from flights;

#------------------------------4-----------------------------------------
 
select
airlines.name,
count(distinct flight) as 'carrier flight count'
from flights
inner join airlines
on airlines.carrier = flights.carrier
group by flights.carrier;

#------------------------------5-----------------------------------------

select
airlines.name,
count(distinct flight) as 'carrier flight count'
from flights
inner join airlines
on airlines.carrier = flights.carrier
group by flights.carrier
order by count(distinct flight) desc;  

#------------------------------6-----------------------------------------

select
airlines.name,
count(distinct flight) as 'carrier flight count'
from flights
inner join airlines
on airlines.carrier = flights.carrier
group by flights.carrier
order by count(distinct flight) desc
limit 5
;            
#------------------------------7-----------------------------------------
# I used the interpretation that the same flight number on different days includes separate instances
#of the same flight.  I had difficulty making the numbers for each carrier match (see below).
select
airlines.name,
count(distinct flight) as 'count'

from flights

join airlines
on airlines.carrier = flights.carrier
where (distance >= 1000)
group by flights.carrier
order by count(distinct flight) desc
limit 5
;

#---------------------------------8-----------------------------------

# Question:  What is the average delay time by 2 hour period throughout the day based on departure time?

select 
floor(dep_time/200) as '2 hour time interval', avg(arr_delay) as 'average delay time'  from flights

group by floor(dep_time/200);

# Output could be improved by using a lookup table to report time in an easier to read format.
 
 
#------------------------------7 test tries-----------------------------------------
# I could not get the total flights by carrier to equal flights above and below (with =) 1000.  In this section, 
#I was trying to filter my data by a select before my primary select statement to see if I could fix my problem.  
#It came up with the same answer.  Later, I created a category (that was small and countable) that only 
#used Endeavor Air flights above 1200.  This method came up with 12, which matches the actual data.  
# I do not know why my data is not matching.
select
airlines.name,
count(distinct flight)
from 
(Select flight, carrier, origin, dest, if(distance >= 1000,distance,null ) as 'filtered'
from flights
) as H
join airlines
on airlines.carrier = H.carrier
where filtered is not null
group by H.carrier
order by count(distinct flight) desc
limit 5
;




# 12 flights by endeavor above 1200
select  * 
from 
(select distinct flight, carrier, origin, dest, distance
from flights
where carrier = "9e"
having distance > 1200
) as x;

 