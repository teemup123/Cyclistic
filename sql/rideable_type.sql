SELECT 
    rideable_type,
    SUM(CASE WHEN member_casual = 'casual' THEN 1 ELSE 0 END) AS casual_count,
    SUM(CASE WHEN member_casual = 'member' THEN 1 ELSE 0 END) AS member_count
FROM 
    complete_trip_data
GROUP BY 
    rideable_type
ORDER BY 
    FIELD(
    rideable_type, 
    'classic_bike', 
    'electric_bike', 
    'docked_bike'
    );