SELECT
    distance_bucket,
    SUM(CASE WHEN member_casual = 'member' THEN 1 ELSE 0 END) AS member_count,
    SUM(CASE WHEN member_casual = 'casual' THEN 1 ELSE 0 END) AS casual_count,
    COUNT(*) AS total_count
FROM
    (SELECT
        member_casual,
        CASE
            WHEN distance_meters < 1000 THEN '0-999'
            WHEN distance_meters < 2000 THEN '1000-1999'
            WHEN distance_meters < 3000 THEN '2000-2999'
            WHEN distance_meters < 4000 THEN '3000-3999'
            WHEN distance_meters < 5000 THEN '4000-4999'
            WHEN distance_meters < 6000 THEN '5000-5999'
			WHEN distance_meters < 7000 THEN '6000-6999'
			WHEN distance_meters < 8000 THEN '7000-7999'
			WHEN distance_meters < 9000 THEN '8000-8999'
			WHEN distance_meters < 10000 THEN '9000-9999'
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
WHERE distance_bucket IS NOT NULL
GROUP BY
    distance_bucket
ORDER BY
    distance_bucket;
