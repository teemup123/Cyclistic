SELECT
    start_station_name AS start_station_name,
    COUNT(CASE WHEN member_casual = 'member' THEN 1 END) AS member_count,
    COUNT(CASE WHEN member_casual = 'casual' THEN 1 END) AS casual_count,
    COUNT(*) AS total_count,
    ROUND(AVG(start_lat),3) AS avg_start_lat,
    ROUND(AVG(start_lng),3) AS avg_start_lng
    
FROM 
    complete_trip_data
GROUP BY
    start_station_name
HAVING total_count >= 100;
