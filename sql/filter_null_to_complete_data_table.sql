CREATE TABLE complete_trip_data AS
SELECT DISTINCT
    start_station_name,
    start_station_id,
    end_station_name,
    end_station_id,
    CASE
        WHEN member_casual LIKE '%casual%' THEN 'casual'
        WHEN member_casual LIKE '%member%' THEN 'member'
        ELSE 'other'
    END AS member_casual,
    rideable_type,
    ride_id,
    start_lat,
    end_lat,
    start_lng,
    end_lng,
    started_at,
    ended_at
FROM 
    trip_data_2023
WHERE start_station_name <> '' -- filtering start name and ID (TEXT)
    AND start_station_name IS NOT NULL
    AND start_station_id <> ''
    AND start_station_id IS NOT NULL
    -- filtering end name and ID (TEXT)
    AND end_station_name <> ''
    AND end_station_name IS NOT NULL
    AND end_station_id <> ''
    AND end_station_id IS NOT NULL
    -- filtering member-casual (TEXT)
    AND member_casual IS NOT NULL
    AND member_casual <> ''
    -- filtering rideable_type (TEXT)
    AND rideable_type IS NOT NULL
    AND rideable_type <> ''
    -- filtering ride_id (TEXT)
    AND ride_id IS NOT NULL
    AND ride_id <> ''
    -- filtering start/end (DOUBLE) lat and ID
    AND start_lat IS NOT NULL
    AND end_lat IS NOT NULL AND end_lat > 0
    AND start_lng IS NOT NULL 
    AND end_lng IS NOT NULL and end_lat > 0
    -- filtering started/ended (DATE-TIME) 
    AND started_at IS NOT NULL
    AND ended_at IS NOT NULL 
    AND ended_at > started_at;
