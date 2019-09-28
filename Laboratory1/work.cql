INSERT INTO STUDENT (GRADEBOOK_NUMBER, WISHES_COUNTER) VALUES (' Ã-6222', 0);
INSERT INTO STUDENT (GRADEBOOK_NUMBER, WISHES_COUNTER) VALUES (' œ-6200', 5);
INSERT INTO STUDENT (GRADEBOOK_NUMBER, WISHES_COUNTER) VALUES (' ¬-9110', 2);
SELECT * FROM STUDENT;

INSERT INTO GENRE (GENRE_TITLE) VALUES ('pop');
INSERT INTO GENRE (GENRE_TITLE) VALUES ('rock');
INSERT INTO GENRE (GENRE_TITLE) VALUES ('folk');
SELECT * FROM GENRE;

INSERT INTO PERFORMER (PERFORMER_NAME) VALUES ('Oleg Vynnyk');
INSERT INTO PERFORMER (PERFORMER_NAME) VALUES ('Ivo Bobul');
INSERT INTO PERFORMER (PERFORMER_NAME) VALUES ('The HARDKISS');
SELECT * FROM PERFORMER;

INSERT INTO MELODY (MELODY_INFO, PERFORMER_NAME) VALUES ({"title":'Vovchytsa', "duration":'03:46', "release_date":'21-NOV-2017', "genre": {'pop'}}, 'Oleg Vynnyk');
INSERT INTO MELODY (MELODY_INFO, PERFORMER_NAME) VALUES ({"title":'Kashtany', "duration":'02:31', "release_date":'17-OCT-1998', "genre": {'folk'}}, 'Ivo Bobul');
INSERT INTO MELODY (MELODY_INFO, PERFORMER_NAME) VALUES ({"title":'Prirva', "duration":'03:00', "release_date":'21-APR-2015', "genre": {'rock'}}, 'The HARDKISS');
SELECT * FROM MELODY;

INSERT INTO WISHES (wish_dict) VALUES ({"student_gradebook":' Ã-6222', "genre_name":'pop', "performer_name":null});
INSERT INTO WISHES (wish_dict) VALUES ({"student_gradebook":' œ-8101', "genre_name":'folk', "performer_name":null});
INSERT INTO WISHES (wish_dict) VALUES ({"student_gradebook":' ¬-7325', "genre_name":null, "performer_name":'Ivo Bobul'});
SELECT * FROM WISHES;

UPDATE STUDENT SET WISHES_COUNTER = 1 WHERE GRADEBOOK_NUMBER = ' Ã-6222';
SELECT * FROM STUDENT;

UPDATE MELODY SET MELODY_INFO = {"title":'Vovchytsa', "duration":'03:46', "release_date":'22-NOV-2016', "genre": {'pop'}} WHERE PERFORMER_NAME = 'Oleg Vynnyk';
SELECT * FROM MELODY;

CREATE TABLE khodos.performer_sings_melody (
	performer_name text, 
	melody_info melody_type, 
	PRIMARY KEY (performer_name, melody_info)
);

SELECT JSON melody_info
FROM performer_sings_melody
WHERE performer_name = 'The HARDKISS';

SELECT performer_name
FROM performer_sings_melody
WHERE melody_info = {title":'Prirva', "duration":'03:00', "release_date":'21-APR-2015', "genre": {'rock'}};

CREATE TABLE khodos.student_wishes (
	gradebook_number text, 
	wishes_counter int, 
	genre_title text, 
	performer_name text, 
	PRIMARY KEY ((gradebook_number), wishes_counter)
);

SELECT wishes_counter
FROM student_wishes
WHERE gradebook_number = ' œ-6200';

SELECT performer_name
FROM student_wishes
WHERE  gradebook_number = ' œ-6200';

DELETE WISHES_COUNTER FROM STUDENT WHERE GRADEBOOK_NUMBER = ' Ã-6222';
DELETE WISH_DICT FROM WISHES WHERE WISH_DICT = {"student_gradebook":' ¬-7325', "genre_name":null, "performer_name":'Ivo Bobul'};
DELETE PERFORMER_NAME WHERE PERFORMER_NAME = 'Oleg Vynnyk';