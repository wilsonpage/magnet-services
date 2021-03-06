CREATE TABLE channel (
  name TEXT PRIMARY KEY,
  email TEXT UNIQUE,
  tags TEXT
);

CREATE INDEX channel_name_index ON channel(name);

CREATE TABLE beacon (
  id SERIAL PRIMARY KEY,
  channel_name TEXT REFERENCES channel(name),
  canonical_url TEXT,
  call_to_action TEXT,
  extra_metadata TEXT,
  location GEOGRAPHY(POINT,4326),
  is_virtual BOOLEAN
);

CREATE INDEX id_index ON beacon (id);
CREATE INDEX beacon_location_index ON beacon USING gist (location);
