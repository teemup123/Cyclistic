SELECT 
    DAYNAME(started_at) AS day_of_week,
    COUNT(*) AS total_count,
    SUM(CASE WHEN member_casual = 'casual' THEN 1 ELSE 0 END) AS casual_count,
    SUM(CASE WHEN member_casual = 'member' THEN 1 ELSE 0 END) AS member_count
FROM 
    complete_trip_data
GROUP BY 
    DAYNAME(started_at)
ORDER BY 
    FIELD(
    day_of_week, 
    'Monday', 
    'Tuesday', 
    'Wednesday', 
    'Thursday', 
    'Friday', 
    'Saturday', 
    'Sunday'
    );
