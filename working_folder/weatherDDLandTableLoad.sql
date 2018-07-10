-- A script containig DDLs for table to hold city and weather
-- data extracted from the metaweather API
-- Created By Brad, Created On 10/07/18



-- Create table scripts, use if not exists for deployments

CREATE TABLE IF NOT EXISTS public.city (
        latitude          numeric(6,2),
   	longitude         numeric(6,2),
   	location_type     char(5),
   	title             char(50),
   	woeid             integer,
);

CREATE TABLE IF NOT EXISTS public.weather (
	air_pressure         	numeric(4,2),
	applicable_date      	date,
	created              	datetime,
	humidity             	integer,
	id                   	bigint,
	max_temp             	numeric(4,2),
	min_temp             	numeric(4,2),
	predictability       	integer,
	the_temp             	numeric(4,2),
	visibility           	numeric(2,6),
	weather_state_abbr   	char(3),
	weather_state_name   	char(20),
	wind_direction       	numeric(2,4),
	wind_direction_compass  char(3),
	wind_speed              numeric(2,4),
	woeid                   integer
);


-- Copy data in from CSVs generated earlier

BEGIN;
COPY public.city FROM 'C:/Temp/city.csv' WITH (FORMAT csv);
COMMIT;

BEGIN;
COPY public.weather FROM 'C:/Temp/weather.csv' WITH (FORMAT csv);
COMMIT;
