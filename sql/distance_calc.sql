SELECT
    distance_bucket,
    SUM(CASE WHEN member_casual = 'member' THEN 1 ELSE 0 END) AS member_count,
    SUM(CASE WHEN member_casual = 'casual' THEN 1 ELSE 0 END) AS casual_count,
    COUNT(*) AS total_count
FROM
    (SELECT
        member_casual,
        CASE
            WHEN distance_meters >= 0 AND distance_meters < 5000 THEN '0-4999'
            WHEN distance_meters >= 5000 AND distance_meters < 10000 THEN '5000-9999'
            WHEN distance_meters >= 10000 AND distance_meters < 15000 THEN '10000-14999'
            WHEN distance_meters >= 15000 AND distance_meters < 20000 THEN '15000-19999'
            WHEN distance_meters >= 20000 AND distance_meters < 25000 THEN '20000-24999'
            WHEN distance_meters >= 25000 AND distance_meters < 30000 THEN '25000-29999'
            WHEN distance_meters >= 30000 THEN '30000+'
        END AS distance_bucket
    FROM
        (SELECT
            member_casual,
            ROUND(ST_Distance_Sphere(
                POINT(start_lng, start_lat),
                POINT(end_lng, end_lat)
            ), 0) AS distance_meters
        FROM 
            complete_trip_data) AS subquery
    ) AS distance_buckets
GROUP BY
    distance_bucket
ORDER BY
    CASE distance_bucket
        WHEN '0-4999' THEN 1
        WHEN '5000-9999' THEN 2
        WHEN '10000-14999' THEN 3
        WHEN '15000-19999' THEN 4
        WHEN '20000-24999' THEN 5
        WHEN '25000-29999' THEN 6
        WHEN '30000+' THEN 7
    END;
