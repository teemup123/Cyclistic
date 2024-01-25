(SELECT 'start_station_name', 'start_station_id', 'end_station_name', 'end_station_id', 
		'member_causal','rideable_type','ride_id',
        'start_lat','end_lat','start_lng','end_lng',
        'started_at','ended_at'
)
UNION ALL
(SELECT * FROM complete_trip_data)
INTO OUTFILE '/Users/teemup123/Data Analysis/Cyclistic/complete_trip_data.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';
