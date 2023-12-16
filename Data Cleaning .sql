--To delete rows with ride_id legth is not 16

SELECT *
FROM year_tripdata
WHERE LEN(ride_id)<>16

DELETE FROM year_tripdata
WHERE LEN(ride_id)<>16

-----------------------------------------------------------------------------------------------------------------------------

-- duplicate rows is zero

SELECT COUNT(ride_id)-COUNT(DISTINCT ride_id) duplicates
FROM year_tripdata

-----------------------------------------------------------------------------------------------------------------------------

--removing values where both start station id and start staion name was not given
--and end station id and end staion name was not given

SELECT * INTO year_tripdata2
FROM
(SELECT * FROM year_tripdata)AS combineddata

SELECT COUNT(*)
FROM year_tripdata2
WHERE start_station_id IS NULL AND start_station_name IS NULL

DELETE FROM year_tripdata2
WHERE start_station_id IS NULL AND start_station_name IS NULL

SELECT COUNT(*)
FROM year_tripdata2
WHERE end_station_id IS NULL AND end_station_name IS NULL

DELETE FROM year_tripdata2
WHERE end_station_id IS NULL AND end_station_name IS NULL

SELECT COUNT(*)
FROM year_tripdata2
--removed 1,298,125
  
--total rows after removing is 4,368,575


------------------------------------------------------------------------------------------------------------------------------

-- where start_station_id IS NULL and start_station_name IS not  NULL

SELECT COUNT(*)
FROM year_tripdata2
WHERE start_station_id IS NULL and start_station_name IS not  NULL -- more that 800000

UPDATE year_tripdata2
SET start_station_id = (
    SELECT MAX(start_station_id)
    FROM year_tripdata2 t2
    WHERE t2.start_station_name = year_tripdata2.start_station_name
)
WHERE start_station_id IS NULL;

SELECT start_station_id,start_station_name
FROM year_tripdata2
WHERE start_station_id IS NULL and start_station_name IS not  NULL--- 9 null values Divvy Valet - Oakwood Beach

-- where start_station_id IS not NULL and start_station_name IS  NULL

SELECT COUNT(*)
FROM year_tripdata2
WHERE start_station_id IS not NULL and start_station_name IS NULL -- 0 values

-- where end_station_id IS NULL and end_station_name IS not  NULL

SELECT COUNT(*)
FROM year_tripdata2
WHERE end_station_id IS NULL and end_station_name IS NOT NULL -- 510916

UPDATE year_tripdata2
SET end_station_id = (
    SELECT MAX(end_station_id)
    FROM year_tripdata2 t2
    WHERE t2.end_station_name = year_tripdata2.end_station_name
)
WHERE end_station_id IS NULL;

SELECT end_station_id,end_station_name
FROM year_tripdata2
WHERE end_station_id IS NULL and end_station_name IS NOT NULL--1011

--Loomis St & Lexington St* IN END STATION NAME TO BE CHANGED TO 13332 IN END STATION,Divvy Valet - Oakwood Beach TO BE REMOVED FROM START AND END STATIONS
--,Green St & Madison Ave* TO BE CHANGED TO chargingstx07

SELECT start_station_id,start_station_name
from year_tripdata2
WHERE start_station_name ='Loomis St & Lexington St' 

SELECT end_station_id,end_station_name
from year_tripdata2
WHERE end_station_name ='Loomis St & Lexington St' 

UPDATE year_tripdata2
SET end_station_id=13332
WHERE end_station_name ='Loomis St & Lexington St*'  --526 changed

DELETE FROM year_tripdata2
WHERE start_station_name ='Divvy Valet - Oakwood Beach' -- 9 ROWS deleted

DELETE FROM year_tripdata2
WHERE end_station_name ='Divvy Valet - Oakwood Beach' -- 15 rows deleted

UPDATE year_tripdata2
SET end_station_id= 'chargingstx07'
WHERE end_station_name ='Green St & Madison Ave*' --485 rows changed

UPDATE year_tripdata2
SET end_station_name = REPLACE(end_station_name, '*', '') --changing 'Green St & Madison Ave*'  to 'Green St & Madison Ave' 
WHERE end_station_name ='Green St & Madison Ave*' 

UPDATE year_tripdata2
SET start_station_name = REPLACE(end_station_name, '*', '') --changing 'Green St & Madison Ave*'  to 'Green St & Madison Ave' 
WHERE start_station_name ='Green St & Madison Ave*' 

UPDATE year_tripdata2
SET end_station_name = REPLACE(end_station_name,'*', ''), --changing 'GLoomis St & Lexington St*'  to 'Loomis St & Lexington St' 
     start_station_name = REPLACE(start_station_name, '*', '')
WHERE end_station_name ='Loomis St & Lexington St*' OR start_station_name ='Loomis St & Lexington St*' 

SELECT COUNT(*) FROM year_tripdata2 -- TOTAL NO OF DATA after cleaning is 4368551


--------------------------------------------------------------------------------------------------------------------------------


-- splitting date and time into two columns

SELECT *
FROM year_tripdata2

-- adding columns for start -date,time,day,month and for end- date,time,day,month

ALTER TABLE year_tripdata2
ADD start_date date ,start_time time,start_day_of_week nvarchar(50),start_month nvarchar(50)

ALTER TABLE year_tripdata2
ADD end_date date ,end_time time,end_day_of_week nvarchar(50),end_month nvarchar(50)

--updatinf startdate,time and end date,time

UPDATE year_tripdata2
SET start_date=CAST(started_at AS date),
    start_time=CAST(started_at AS time)  


UPDATE year_tripdata2
SET end_date=CAST(started_at AS date),
    end_time=CAST(started_at AS time)

-- to extract month for started at and ended at

UPDATE year_tripdata2
SET start_month = FORMAT(start_date,'MMM')


UPDATE year_tripdata2
SET end_month = FORMAT(end_date,'MMM')

--to extract DAY FOR STARTed at and DAY FOrideR ended at

UPDATE year_tripdata2
SET start_day_of_week = FORMAT(start_date, 'ddd')

UPDATE year_tripdata2
SET end_day_of_week = FORMAT(end_date, 'ddd')

-----------------------------------------------------------------------------------------------------------------------------


--ride_length
  
ALTER  TABLE year_tripdata
ADD ride_length varchar(20)
  
UPDATE year_tripdata
SET ride_length =DATEDIFF(MINUTE,started_at,eneded_at)

SELECT * FROM year_tripdata

ALTER TABLE year_tripdata
DROP COLUMN started_at,ended_at


----------------------------------------------------------------------------------------------------------------------------------
SELECT * FROM year_tripdata

SELECT count(*)
FROM year_tripdata
WHERE ride_length<0 --59

DELETE FROM year_tripdata
WHERE ride_length<0 

SELECT count(*)
FROM year_tripdata
WHERE ride_length>960 --59 --1082

DELETE FROM year_tripdata
WHERE ride_length>960 

--year_tripdata is the latest data
