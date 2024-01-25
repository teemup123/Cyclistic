SELECT
    -- This part calculates the proportion of complete data.
    (b.total_count_complete) / a.total_count_2023 AS complete_proportion
FROM
    -- This subquery calculates the total number of records in the 'trip_data_2023' table.
    -- The result is aliased (named) as 'a' for reference in the main query.
    (SELECT COUNT(*) AS total_count_2023 FROM trip_data_2023) a
CROSS JOIN
    -- This subquery calculates the total number of records in the 'complete_trip_data' table.
    -- The result is aliased as 'b' for reference in the main query.
    (SELECT COUNT(*) AS total_count_complete FROM complete_trip_data) b;
