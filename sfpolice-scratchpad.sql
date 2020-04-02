SELECT incident_category,
       count (police.incident_category) as num_incidents
FROM weather 
INNER JOIN police ON police.incident_date = weather.weather_date
WHERE weather.temp_max > 15.0
GROUP BY incident_category
ORDER BY num_incidents DESC
LIMIT 20;

SELECT incident_category,
       count (police.incident_category) as num_incidents
FROM weather 
INNER JOIN police ON police.incident_date = weather.weather_date
WHERE weather.temp_max < 15.0
GROUP BY incident_category
ORDER BY num_incidents DESC
LIMIT 20;

SELECT weather.weather_date, 
       weather.temp_max
FROM weather 
WHERE weather.temp_max > 15.0
GROUP BY weather.weather_date, weather.temp_max
ORDER BY weather.weather_date;

SELECT weather.weather_date, 
       weather.temp_max,
       police.incident_category
FROM weather 
INNER JOIN police ON police.incident_date = weather.weather_date
WHERE weather.temp_max > 15.0
GROUP BY police.incident_category
ORDER BY weather.weather_date;

awk -F, '{split($7,a,"/"); $7=a[1]"-"a[2]"-"a[3]}1' OFS=,  Weather_SFO.csv
awk -F, '{split($2,a,"/"); $2=a[1]"-"a[2]"-"a[3]}1' OFS=,  Police_Department_Incident_Reports__2018_to_Present.csv 

\COPY police from police.csv CSV HEADER;

SELECT
    time_bucket_gapfill('1 day', weather_date) AS date,
    name, lattiude, longitude,
    locf(avg(temp_mid), treat_null_as_missing:=true)
  FROM weather
  WHERE weather_date >= '2018-01-05' AND weather_date <= '2018-01-30' AND name = 'SAN FRANCISCO OCEANSIDE, CA US'
  GROUP BY date, name, lattiude, longitude
  ORDER BY date
  LIMIT 10;
  
SELECT * 
FROM weather 
WHERE name = 'SAN FRANCISCO OCEANSIDE, CA US' AND weather_date >= '2018-01-05' AND weather_date <= '2018-01-30' 
ORDER BY weather_date
LIMIT 10;  

SELECT time_bucket('1 week', incident_datetime) as time,
       incident_category,
       count (police.incident_category) as num_incidents
FROM police
GROUP BY time, incident_category
ORDER BY time;