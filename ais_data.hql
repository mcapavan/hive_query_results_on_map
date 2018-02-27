CREATE EXTERNAL TABLE IF NOT EXISTS ais_data
(
	arkposid BIGINT,
  mmsi INT,
  navigationalstatus INT,
  lon DOUBLE,
  lat DOUBLE,
  sog FLOAT,
  cog FLOAT,
  rot FLOAT,
  heading INT,
  acquisitiontime STRING,
  iptype INT
	)
	COMMENT 'Text formatted ais_data table'
  ROW FORMAT DELIMITED
  FIELDS TERMINATED BY '\t' LINES TERMINATED BY '\n'
  LOCATION '/ais'
;


DROP TABLE IF EXISTS ais_data_orc;

CREATE  TABLE IF NOT EXISTS ais_data_orc
(
	arkposid BIGINT,
  mmsi INT,
  navigationalstatus INT,
  lon DOUBLE,
  lat DOUBLE,
  sog FLOAT,
  cog FLOAT,
  rot FLOAT,
  heading INT,
  acquisitiontime STRING,
  iptype INT
	)
	COMMENT 'ORC formatted ais_data table'
  STORED AS ORC
;

INSERT OVERWRITE TABLE ais_data_orc SELECT * FROM ais_data;
