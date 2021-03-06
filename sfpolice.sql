DROP TABLE IF EXISTS "police";
CREATE TABLE "police"(
    incident_datetime TIMESTAMP WITHOUT TIME ZONE NOT NULL,
    incident_date DATE,
    incident_time TEXT,
    incident_year TEXT,
    incident_day_of_week TEXT,
    report_datetime TIMESTAMP WITHOUT TIME ZONE NOT NULL,
    row_id NUMERIC,
    incident_id TEXT,
    incident_number TEXT,
    cad_number TEXT,
    report_type_code TEXT,
    report_type_description TEXT,
    filed_online TEXT,
    incident_code TEXT,
    incident_category TEXT,
    incident_sub_category TEXT,
    incident_description TEXT,
    resolution TEXT,
    intersection TEXT,
    cnn TEXT,
    police_district TEXT,
    analysis_neighborhood TEXT,
    supervisor_district TEXT,
    latitude NUMERIC,
    longitude NUMERIC,
    location_point TEXT,
    control_1 NUMERIC,
    control_2 NUMERIC,
    control_3 NUMERIC,
    control_4 NUMERIC,
    control_5 NUMERIC,
    control_6 NUMERIC,
    control_7 NUMERIC,
    control_8 NUMERIC,
    control_9 NUMERIC,
    control_10 NUMERIC
);
SELECT create_hypertable('police', 'incident_datetime', 'incident_category', 2, create_default_indexes=>FALSE);
SELECT create_hypertable('police', 'incident_datetime', 'incident_sub_category', 2, create_default_indexes=>FALSE);
CREATE INDEX ON police (incident_datetime, incident_category desc);
CREATE INDEX ON police (incident_datetime, incident_sub_category desc);

DROP TABLE IF EXISTS "weather";
CREATE TABLE "weather"(
    station TEXT,
    name TEXT,
    latitude NUMERIC,
    longitude NUMERIC,
    elevation NUMERIC,
    weather_date DATE,
    precipitation NUMERIC,
    temp_max NUMERIC,
    temp_min NUMERIC,
    temp_mid NUMERIC
);
SELECT create_hypertable('weather', 'weather_date', 'temp_mid', 2, create_default_indexes=>FALSE);
CREATE INDEX ON weather (weather_date, temp_id desc);

DROP TABLE IF EXISTS "info";
CREATE TABLE "info"(
    id TEXT,
    open_date TIMESTAMP WITHOUT TIME ZONE NOT NULL,
    close_date TIMESTAMP WITHOUT TIME ZONE NOT NULL,
    update_date TIMESTAMP WITHOUT TIME ZONE NOT NULL,
    status TEXT,
    status_notes TEXT,
    responsible_agency TEXT,
    category TEXT,
    request_type TEXT,
    request_details TEXT,
    street TEXT,
    district NUMERIC,
    neighborhood TEXT,
    police_district TEXT,
    latitude NUMERIC,
    longitude NUMERIC
);
SELECT create_hypertable('info', 'open_date', 'category', 2, create_default_indexes=>FALSE);
SELECT create_hypertable('info', 'open_date', 'request_type', 2, create_default_indexes=>FALSE);
CREATE INDEX ON info (open_date, category desc);
CREATE INDEX ON info (open_date, request_type desc);
