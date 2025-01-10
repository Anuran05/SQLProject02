SELECT * FROM airlines.airlines;
#Find out the unique airlines taken
select distinct Airlines from airlines;
#Which year did I visit maximum source cities 
--select * from airlines;
select count(year),year,source from airlines group by year order by count(year) desc
#Which airline spent most money
select Airlines,Cost_in_rupees from airlines order by Cost_in_rupees desc limit 1

#YOY which had highest % increase in number of flights
--select year, count(year) as flights from airlines group by year #In absence of group by one row was showing which was 2015 and trips showing sum of all 4,2,13,5,12, etc which was 58
--order by flights desc
with data as(
select year, count(year) as flights from airlines group by year #In absence of group by one row was showing which was 2015 and trips showing sum of all 4,2,13,5,12, etc which was 58
order by flights desc)
select year,flights,lag(flights) over (order by year) as flightstakeninpreviousyear,
(flights-(lag(flights) over (order by year)))/(lag(flights) over (order by year)) as yoy_increase
  from data
order by year



#Maximum distance and trips covered in which airline using rank
with data as(
select airlines, count(*) as trips, sum(distance_in_kms) as totaldistance from airlines
group by airlines) 
select airlines, trips, totaldistance, rank() over (order by totaldistance desc) as ranking from data


#Which airline have I taken maximum number of times 

--From the above query, I have taken Ryan airways the most