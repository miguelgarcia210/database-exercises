USE codeup_test_db;

SELECT 'ALL ALBUMS' AS '';
SELECT * FROM albums;
SELECT 'UPDATED SALES ------------' AS '';
UPDATE albums
SET sales = (sales * 10);
SELECT * FROM albums;


SELECT 'ALL ALBUMS BEFORE 1980' AS '';
SELECT * FROM albums WHERE release_date < 1980;
SELECT  'BACK 100 YRS ----------' AS '';
UPDATE albums
SET release_date = release_date - 100
WHERE release_date < 1980;
SELECT  * FROM albums WHERE release_date < 1980;

SELECT 'ALL ALBUMS BY MICHAEL JACKSON' AS '';
SELECT * FROM albums WHERE artist LIKE 'MICHAEL JACKSON%';
SELECT 'CHANGE ''MICHAEL'' -> ''PETER'' ---------' AS '';
UPDATE albums
SET artist = 'PETER JACKSON'
WHERE artist LIKE 'MICHAEL JACKSON%';
SELECT * FROM albums WHERE artist LIKE 'PETER JACKSON%';