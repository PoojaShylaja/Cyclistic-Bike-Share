-- To create a table for different months to a single file as 'year_tripdata'
DROP TABLE IF EXISTS year_tripdata

--To change data types

--FOR APRIL

ALTER TABLE apr_tripdata
ADD tempColumnname NVARCHAR(255)
SELECT * FROM apr_tripdata
UPDATE apr_tripdata
SET tempColumnname=CAST(start_station_id AS nvarchar(255))
ALTER TABLE apr_tripdata
DROP COLUMN start_station_id
EXEC sp_rename 'apr_tripdata.tempColumnname','start_station_id','COLUMN';
--FOR DEC end_station_id

ALTER TABLE dec_tripdata
ADD tempColumnname NVARCHAR(255)
SELECT * FROM dec_tripdata
UPDATE dec_tripdata
SET tempColumnname=CAST(end_station_id AS nvarchar(255))
ALTER TABLE dec_tripdata
DROP COLUMN end_station_id
EXEC sp_rename 'dec_tripdata.tempColumnname','end_station_id','COLUMN';

--FOR JUL start_station_id

ALTER TABLE jul_tripdata
ADD tempColumnname nvarchar(255)
SELECT * FROM jul_tripdata
UPDATE jul_tripdata
SET tempColumnname =CAST(start_station_id AS nvarchar(255))
ALTER TABLE jul_tripdata
DROP COLUMN start_station_id
EXEC sp_rename 'jul_tripdata.tempColumnname','start_station_id','COLUMN';


--FOR NOV end_station_id,start_station_id

ALTER TABLE nov_tripdata
ADD tempColumnname nvarchar(255),tempColumnname1 nvarchar(255)
SELECT * FROM nov_tripdata
UPDATE nov_tripdata
SET tempColumnname =CAST(start_station_id AS nvarchar(255)),
tempColumnname1=CAST(end_station_id AS nvarchar(255))
ALTER TABLE nov_tripdata
DROP COLUMN start_station_id,end_station_id
EXEC sp_rename 'nov_tripdata.tempColumnname','start_station_id','COLUMN';
EXEC sp_rename 'nov_tripdata.tempColumnname1','end_station_id','COLUMN';


--FOR OCT start_station_id

ALTER TABLE oct_tripdata
ADD tempColumnname nvarchar(255)
SELECT * FROM oct_tripdata
UPDATE oct_tripdata
SET tempColumnname =CAST(start_station_id AS nvarchar(255))
ALTER TABLE oct_tripdata
DROP COLUMN start_station_id
EXEC sp_rename 'oct_tripdata.tempColumnname','start_station_id','COLUMN';

--FOR SEP end_station_id

ALTER TABLE sep_tripdata
ADD tempColumnname nvarchar(255)
SELECT * FROM sep_tripdata
UPDATE sep_tripdata
SET tempColumnname =CAST(end_station_id AS nvarchar(255))
ALTER TABLE sep_tripdata
DROP COLUMN end_station_id
EXEC sp_rename 'sep_tripdata.tempColumnname','end_station_id','COLUMN';

----------------------------------------------------------------------------------------------------------

DROP TABLE IF EXISTS year_tripdata

SELECT * INTO year_tripdata FROM
(
SELECT * FROM jan_tripdata
UNION ALL
SELECT * FROM feb_tripdata
UNION ALL
SELECT * FROM mar_tripdata
UNION ALL
SELECT * FROM april_tripdata
UNION ALL
SELECT * FROM may_tripdata
UNION ALL
SELECT * FROM jun_tripdata 
UNION ALL
SELECT * FROM july_tripdata
UNION ALL
SELECT * FROM aug_tripdata 
UNION ALL
SELECT * FROM sept_tripdata 
UNION ALL
SELECT * FROM octo_tripdata
UNION ALL
SELECT * FROM novem_tripdata
UNION ALL
SELECT * FROM decem_tripdata) AS CombinedData;


-----------------------------------------------------------------------------------------------
SELECT COUNT(*)
FROM year_tripdata

--no of rows 5667717

-----------------------------------------------------------------------------------------------------



