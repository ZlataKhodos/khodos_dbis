INSERT INTO khodos.student (GRADEBOOK_NUMBER, WISHES_COUNTER) VALUES ('KM-6222', 0);
INSERT INTO khodos.student (GRADEBOOK_NUMBER, WISHES_COUNTER) VALUES ('KP-6200', 5);
INSERT INTO khodos.student (GRADEBOOK_NUMBER, WISHES_COUNTER) VALUES ('KB�-9110', 2);
SELECT * FROM khodos.student;

INSERT INTO khodos.genre (GENRE_TITLE) VALUES ('pop');
INSERT INTO khodos.genre (GENRE_TITLE) VALUES ('rock');
INSERT INTO khodos.genre (GENRE_TITLE) VALUES ('folk');
SELECT * FROM khodos.genre;

INSERT INTO khodos.performer (PERFORMER_NAME) VALUES ('Oleg Vynnyk');
INSERT INTO khodos.performer (PERFORMER_NAME) VALUES ('Ivo Bobul');
INSERT INTO khodos.performer (PERFORMER_NAME) VALUES ('THE Hardkiss');
SELECT * FROM khodos.performer;

INSERT INTO khodos.melody (MELODY_INFO, PERFORMER_NAME) VALUES ({"title":'Vovchytsa', "duration":'03:46', "release_date":'21-NOV-2017', "genre": {'pop'}}, 'Oleg Vynnyk');
INSERT INTO khodos.melody (MELODY_INFO, PERFORMER_NAME) VALUES ({"title":'Kashtany', "duration":'02:31', "release_date":'17-OCT-1998', "genre": {'folk'}}, 'Ivo Bobul');
INSERT INTO khodos.melody (MELODY_INFO, PERFORMER_NAME) VALUES ({"title":'Prirva', "duration":'03:00', "release_date":'21-APR-2015', "genre": {'rock'}}, 'The HARDKISS');
SELECT * FROM khodos.melody;

INSERT INTO khodos.wish JSON '{"wish_dict": {"student_gradebook":"KM-6222", "genre_name":"pop", "performer_name":null}}';
INSERT INTO khodos.wish JSON '{"wish_dict": {"student_gradebook":"KB-8101", "genre_name":"folk", "performer_name":null}}';
INSERT INTO khodos.wish JSON '{"wish_dict": {"student_gradebook":"KP-7325", "genre_name":null, "performer_name":"IvoBobul"}}';
SELECT JSON * FROM khodos.wish;

UPDATE khodos.student SET WISHES_COUNTER = 1 WHERE GRADEBOOK_NUMBER = 'KM-6222';
SELECT * FROM khodos.student;

//UPDATE khodos.melody SET MELODY_INFO = {"title":'Vovchytsa', "duration":'03:46', "release_date":'22-NOV-2016', "genre": {'pop'}} WHERE PERFORMER_NAME = 'Oleg Vynnyk' AND MELODY_INFO = {"title":'Vovchytsa', "duration":'03:46', "release_date":'21-NOV-2017', "genre": {'pop'}}, 'Oleg Vynnyk';
//SELECT * FROM khodos.melody;

CREATE TABLE khodos.performer_sings_melody (
	performer_name text, 
	melody_info frozen<melody_type>, 
	PRIMARY KEY (performer_name, melody_info)
);

INSERT INTO khodos.performer_sings_melody (performer_name, melody_info) VALUES ('THE Hardkiss', {"title":'Prirva', "duration":'03:00', "release_date":'21-APR-2015', "genre": {'rock'}});
INSERT INTO khodos.performer_sings_melody (performer_name, melody_info) VALUES ('THE Hardkiss', {"title":'Antarktida', "duration":'04:05', "release_date":'13-MAR-2017', "genre": {'rock'}});
INSERT INTO khodos.performer_sings_melody (performer_name, melody_info) VALUES ('Oleg Vynnyk', {"title":'Nino', "duration":'02:45', "release_date":'14-APR-2014', "genre": {'pop'}});
INSERT INTO khodos.performer_sings_melody (performer_name, melody_info) VALUES ('Ivo Bobul', {"title":'Kashtany-Kyany', "duration":'03:30', "release_date":'21-AUG-2001', "genre": {'pop', 'folk'}});

SELECT JSON melody_info
FROM khodos.performer_sings_melody
WHERE performer_name = 'THE Hardkiss';

SELECT melody_info.title
FROM khodos.performer_sings_melody
WHERE performer_name = 'THE Hardkiss'
ALLOW FILTERING;


CREATE TABLE khodos.student_wishes (
	gradebook_number text, 
	wishes_counter int, 
	genre_title text, 
	performer_name text, 
	PRIMARY KEY ((gradebook_number), wishes_counter)
);

INSERT INTO khodos.student_wishes JSON '{"gradebook_number": "KM-6200", "wishes_counter": 1, "genre_title": "rock", "performer_name": "THE Hardkiss"}';

SELECT wishes_counter
FROM khodos.student_wishes
WHERE gradebook_number = 'KM-6200';

SELECT performer_name
FROM khodos.student_wishes
WHERE  gradebook_number = 'KM-6200';

/* 
DELETE WISHES_COUNTER FROM khodos.STUDENT WHERE GRADEBOOK_NUMBER = 'ÊÌ-6222';
DELETE WISH_DICT FROM khodos.WISHES WHERE WISH_DICT = {"student_gradebook":'ÊÂ-7325', "genre_name":null, "performer_name":'Ivo Bobul'};
DELETE PERFORMER_NAME WHERE PERFORMER_NAME = 'Oleg Vynnyk';*/