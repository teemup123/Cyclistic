WITH StartStationData AS (
    SELECT
        start_station_name,
        start_station_id,
        SUM(CASE WHEN member_casual = 'member' THEN 1 ELSE 0 END) AS member_start_count,
        SUM(CASE WHEN member_casual = 'casual' THEN 1 ELSE 0 END) AS casual_start_count
    FROM
        complete_trip_data
    GROUP BY
        start_station_name, start_station_id
),
EndStationData AS (
    SELECT
        end_station_name,
        end_station_id,
        SUM(CASE WHEN member_casual = 'member' THEN 1 ELSE 0 END) AS member_end_count,
        SUM(CASE WHEN member_casual = 'casual' THEN 1 ELSE 0 END) AS casual_end_count
    FROM
        complete_trip_data
    GROUP BY
        end_station_name, end_station_id
)
SELECT
    s.start_station_name AS station_name,
    s.start_station_id AS station_id,
    (e.member_end_count - s.member_start_count) AS net_member_accumulation,
    (e.casual_end_count - s.casual_start_count) AS net_casual_accumulation
FROM
    StartStationData s
JOIN
    EndStationData e ON s.start_station_id = e.end_station_id;
