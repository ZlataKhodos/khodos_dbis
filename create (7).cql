CREATE KEYSPACE khodos
WITH replication = {
	'class': 'SimpleStrategy', 
	'replication_factor': 2
};

CREATE TABLE khodos.student (
	gradebook_number text, 
	wishes_counter int, 
	PRIMARY KEY (gradebook_number)
);

CREATE TYPE IF NOT EXISTS khodos.melody_type (
	title text, 
	duration text, 
	release_date text, 
	genre set<text>
);

CREATE TYPE IF NOT EXISTS khodos.performer_type(
	performer map<text, frozen<melody_type>>
);

CREATE TABLE khodos.melody (
	melody_info frozen<melody_type>, 
	performer_name text, 
	PRIMARY KEY (melody_info, performer_name)
);

CREATE TABLE khodos.genre (
	genre_title text, 
	PRIMARY KEY (genre_title)
);

CREATE TABLE khodos.performer (
	performer_name text, 
	PRIMARY KEY (performer_name)
);

CREATE TYPE IF NOT EXISTS khodos.wish_type (
	student_gradebook text, 
	genre_name text, 
	performer_name text
);

CREATE TABLE khodos.wish (
	wish_dict frozen<wish_type>, 
	PRIMARY KEY (wish_dict)
)