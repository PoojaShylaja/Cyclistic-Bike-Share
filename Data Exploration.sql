 
  --To check null values
  
  SELECT COUNT(*)-COUNT(ride_id) ride_id,
	   COUNT(*)-COUNT(rideable_type) rideable_type,
	   COUNT(*)-COUNT(started_at) started_at,
     COUNT(*)-COUNT(ended_at) ended_at,
	   COUNT(*)-COUNT(start_station_id) start_station_id,
	   COUNT(*)-COUNT(start_station_name) start_station_name,
	   COUNT(*)-COUNT(end_station_id) end_station_id,
	   COUNT(*)-COUNT(end_station_name) end_station_name,
	   COUNT(*)-COUNT(start_lat) start_lat,
	   COUNT(*)-COUNT(start_lng) start_lng,
	   COUNT(*)-COUNT(end_lat) end_lat,
	   COUNT(*)-COUNT(end_lng) end_lng,
	   COUNT(*)-COUNT(member_casual) member_casual

FROM year_tripdata

----------------------------------------------------------------------------------------------------------------------------------

-- To find duplicate rows(9)
    
SELECT COUNT(ride_id)-COUNT(DISTINCT ride_id) Without_duplicates
FROM year_tripdata

--------------------------------------------------------------------------------------------------------------------------------

--rideid length
    
SELECT length_1
FROM(
       SELECT COUNT (DISTINCT length_of_ride_id) AS length_1
       FROM (  SELECT LEN(ride_id) AS length_of_ride_id 
               FROM year_tripdata
		    ) AS length
	) AS count_length
GROUP BY length_1;

SELECT count(ride_id)
FROM year_tripdata
WHERE len(ride_id)=16

SELECT *
FROM year_tripdata
WHERE len(ride_id)<>16
----------------------------------------------------------------------------------------------------------------------------

--Different bikes

SELECT DISTINCT(rideable_type)
FROM year_tripdata
--docked_bike,electric_bike,classic_bike

--------------------------------------------------------------------------------------------------------------------------------

SELECT COUNT (DISTINCT start_lng)
FROM year_tripdata
--631047 start_lng
SELECT COUNT (DISTINCT end_lng)
FROM year_tripdata
--1876 end len
SELECT COUNT (DISTINCT start_lat)
FROM year_tripdata
--668349 start lat
SELECT COUNT (DISTINCT end_lat)
FROM year_tripdata
--1606


SELECT end_lng, COUNT (end_lng) AS total_no
FROM year_tripdata
GROUP BY end_lng
ORDER BY total_no DESC

-------------------------------------------------------------------------------------------------------------------------------

--casual member observation
  
SELECT DISTINCT member_casual
FROM year_tripdata
--casual,member
SELECT member_casual,COUNT(member_casual) AS total_no
FROM year_tripdata
GROUP BY member_casual
--casual 2322032,member 3345685

---------------------------------------------------------------------------------------------------------------------------------

--start station name and end station name,ids as well
-- in some cases we have station name but no id 

SELECT COUNT( DISTINCT start_station_id)
FROM year_tripdata --1311

SELECT start_station_name,COUNT(start_station_name) AS station_no
FROM year_tripdata
GROUP BY start_station_name 
ORDER BY station_no DESC

SELECT end_station_name,COUNT(end_station_name) AS station_no
FROM year_tripdata
GROUP BY end_station_name 
ORDER BY station_no DESC

SELECT start_station_id,start_station_name,COUNT(start_station_id) AS station_no
FROM year_tripdata
GROUP BY start_station_id,start_station_name
ORDER BY station_no DESC

SELECT start_station_id,start_station_name
FROM year_tripdata
WHERE start_station_id IS NULL 
GROUP BY start_station_id,start_station_name


SELECT start_station_id,start_station_name
FROM year_tripdata
WHERE  start_station_name ='Kimbark Ave & 53rd St'

------------------------------------------------------------------------------------------------------------------------------------

--time

SELECT started_at
FROM year_tripdata


SELECT CAST(started_at AS DATE) AS trip_date
INTO start_trip_date
FROM year_tripdata

SELECT * FROM start_trip_date


