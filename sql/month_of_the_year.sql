SELECT 
    MONTHNAME(started_at) AS month_of_year,
    COUNT(*) AS total_count,
    SUM(CASE WHEN member_casual = 'casual' THEN 1 ELSE 0 END) AS casual_count,
    SUM(CASE WHEN member_casual = 'member' THEN 1 ELSE 0 END) AS member_count
FROM 
    complete_trip_data
GROUP BY 
    MONTH(started_at), MONTHNAME(started_at)
ORDER BY 
    MONTH(started_at);
