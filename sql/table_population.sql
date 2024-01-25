-- Create the table
-- CREATE TABLE transactions (
--     id INT,
--     transaction_date DATE,
--    amount DECIMAL(10, 2)
-- );

-- Import data from a CSV file
LOAD DATA LOCAL INFILE '/Users/teemup123/Data Analysis/Cyclistic/2023_trip_data/202301-divvy-tripdata.csv'
INTO TABLE trip_data_1223
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(ride_id, 
rideable_type, 
started_at,  
ended_at,
start_station_name, 
start_station_id, 
end_station_name, 
end_station_id, 
start_lat, 
start_lng, 
end_lat, 
end_lng, 
member_casual);
