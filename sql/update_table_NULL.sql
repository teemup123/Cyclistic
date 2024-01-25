SET SQL_SAFE_UPDATES = 0;
UPDATE ride_history SET start_station_id = NULL WHERE start_station_id = 0;
UPDATE ride_history SET end_station_id = NULL WHERE end_station_id = 0;
SET SQL_SAFE_UPDATES = 1;

