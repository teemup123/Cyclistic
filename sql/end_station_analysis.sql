SELECT
    end_station_name AS end_station_name,
    COUNT(CASE WHEN member_casual = 'member' THEN 1 END) AS member_count,
    COUNT(CASE WHEN member_casual = 'casual' THEN 1 END) AS casual_count,
    COUNT(*) AS total_count,
    ROUND(AVG(end_lat),3) AS avg_end_lat,
    ROUND(AVG(end_lng),3) AS avg_end_lng
    
FROM 
    complete_trip_data
GROUP BY
    end_station_name;
