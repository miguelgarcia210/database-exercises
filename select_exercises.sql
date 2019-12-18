USE codeup_test_db;

SELECT 'All albums by Pink Floyd' AS '';
SELECT name FROM albums WHERE artist = 'Pink Floyd';

SELECT 'Year ''Sgt. Pepper''s Lonely Hearts Club Band'' released' AS '';
SELECT release_date FROM albums WHERE name = 'Sgt. Peppers Lonely Hearts Club Band';

SELECT 'Genre of Nevermind' AS '';
SELECT genre FROM albums WHERE name = 'Nevermind';

SELECT 'Albums released in the 1990''s' AS '';
SELECT name FROM albums WHERE release_date BETWEEN 1990 AND 1999;

SELECT 'Albums with less than 20M sales' AS '';
SELECT name FROM albums WHERE sales < 20;

SELECT 'Albums with genre type: Rock' AS '';
SELECT name FROM albums WHERE genre LIKE 'ROCK%';