CREATE TABLE routes(
 id serial PRIMARY KEY,
 name text NOT NULL,
 description text NOT NULL,
 base_price integer NOT NULL,
 start_town_id integer REFERENCES towns(id)
);
CREATE TABLE tours(
 id serial PRIMARY KEY,
 departure_day date NOT NULL,
 duration integer NOT NULL,
 extra_contributions integer NOT NULL,
 extra_description text,
 route_id integer UNIQUE REFERENCES routes(id)
);

CREATE TABLE towns(
 id serial PRIMARY KEY,
 name text NOT NULL
);
CREATE TABLE excursions(
 id serial PRIMARY KEY,
 name text NOT NULL,
 price integer NOT NULL,
 description text NOT NULL,
 town_id integer REFERENCES towns(id)
);
CREATE TABLE tour_towns(
 town_id integer REFERENCES towns(id),
 route_id integer REFERENCES routes(id),
 duration integer NOT NULL,
 PRIMARY KEY(town_id, route_id)
);