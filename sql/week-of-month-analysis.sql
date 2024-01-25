SELECT 
    CEIL(DAY(started_at) * 4 / DAY(LAST_DAY(started_at))) AS week_of_month,
    COUNT(*) AS total_count,
    SUM(CASE WHEN member_casual = 'casual' THEN 1 ELSE 0 END) AS casual_count,
    SUM(CASE WHEN member_casual = 'member' THEN 1 ELSE 0 END) AS member_count
FROM 
    complete_trip_data
GROUP BY 
    week_of_month
ORDER BY 
    week_of_month;
