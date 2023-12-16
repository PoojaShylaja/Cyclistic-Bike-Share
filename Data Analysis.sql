-- to select all data
  
SELECT * FROM year_tripdata


UPDATE year_tripdata
SET ride_length = CAST(ride_length1 AS bigint)

--to find mean
SELECT AVG(ride_length)
FROM year_tripdata --avg 17

--to find max
SELECT MAX(ride_length)
FROM year_tripdata --max -34355

--to find MODE OF start day of week

SELECT TOP 1 start_day_of_week AS Mode, COUNT(*) AS Frequency
FROM year_tripdata
GROUP BY start_day_of_week
ORDER BY COUNT(*) DESC;    --Sat 705474

SELECT COUNT(*)
FROM year_tripdata --4368551 

--average ride length of member_casual

SELECT member_casual,AVG(ride_length) AS Avg_ride_length
FROM year_tripdata
GROUP BY member_casual
ORDER BY Avg_ride_length DESC ---member 12,casual 23

--AVG ride lengthof membercasual for each day of the week

SELECT member_casual,start_day_of_week,AVG(ride_length) AS Avg_of_ride_length
FROM year_tripdata
GROUP BY member_casual,start_day_of_week
ORDER BY Avg_of_ride_length 

--no of total rides in each day of the week

SELECT start_day_of_week,COUNT(start_station_id) AS total_rides
FROM year_tripdata
GROUP BY start_day_of_week
ORDER BY total_rides DESC -- TOPIS sat 705474

--total no of rides in each month

SELECT start_month,COUNT(start_station_id) AS total_rides
FROM year_tripdata
GROUP BY start_month
ORDER BY total_rides DESC -- MOST NUMBER OF rides in jul 642563,jun 620225,aug,sep,may,oct least in jan feb dec

--total no of rides in each day of the week in and month 

SELECT start_month,start_day_of_week,COUNT(start_station_id) AS total_rides
FROM year_tripdata
GROUP BY start_month,start_day_of_week
ORDER BY total_rides DESC --JUL sat,sun, JUN thu, AUG tue wed

SELECT TOP 5 start_month,start_day_of_week,start_date,COUNT(start_station_id) AS total_rides
FROM year_tripdata
GROUP BY start_month,start_day_of_week,start_date
ORDER BY total_rides DESC -- JUL SAT,JUN SAT,APR SAT,MAY SUN,SAT

--member casual and total rides

SELECT member_casual,COUNT(start_station_id) AS total_rides
FROM year_tripdata
GROUP BY member_casual 
ORDER BY total_rides DESC --member 2610674,casual 1757877

--different types of cycle and totla rides
SELECT rideable_type,COUNT(start_station_id) AS total_rides
FROM year_tripdata
GROUP BY rideable_type
ORDER BY total_rides --do	cked_bike 174831, electric_bike 1596780,classic_bike 2596940

--ride length average for diff bikes
 
 SELECT rideable_type,SUM(ride_length) total_time,COUNT(start_station_id) total_count,AVG(ride_length) AS avg_ride_length
 FROM year_tripdata
 GROUP BY rideable_type
 ORDER BY avg_ride_length --electric_bike 13 classic_bike 17 docked_bike docked_bike

  
 SELECT top 5 start_month,rideable_type,SUM(ride_length) total_time,COUNT(start_station_id) total_count,AVG(ride_length) AS avg_ride_length
 FROM year_tripdata
 GROUP BY start_month,rideable_type
 ORDER BY avg_ride_length asc --good one

 -- toTAL no of rides from which  station

 SELECT start_station_name,COUNT(start_station_id) AS total_no
 FROM year_tripdata
 GROUP BY start_station_name
 ORDER BY total_no DESC

 SELECT start_station_name,member_casual,COUNT(start_station_id) AS total_no
 FROM year_tripdata
 GROUP BY start_station_name,member_casual
 ORDER BY total_no DESC
