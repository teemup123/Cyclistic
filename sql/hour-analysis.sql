SELECT 
    HOUR(started_at) AS hour_of_day,
    COUNT(*) AS total_count,
    SUM(CASE WHEN member_casual = 'casual' THEN 1 ELSE 0 END) AS casual_count,
    SUM(CASE WHEN member_casual = 'member' THEN 1 ELSE 0 END) AS member_count
FROM 
    complete_trip_data
GROUP BY 
   hour_of_day
ORDER BY hour_of_day;
