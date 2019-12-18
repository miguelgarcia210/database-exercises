USE codeup_test_db;

/*
All albums in your table.
All albums released before 1980
All albums by Michael Jackson
 */

SELECT 'ALL ALBUMS' AS '';
SELECT * FROM albums;
SELECT 'UPDATED SALES ------------' AS '';
UPDATE albums
SET sales = (sales * 10);
SELECT * FROM albums;




SELECT 'ALL ALBUMS BEFORE 1980' AS '';
SELECT * FROM albums WHERE release_date < 1980;

SELECT 'ALL ALBUMS BY ''MICHAEL JACKSON''' AS '';
SELECT * FROM albums WHERE artist LIKE 'MICHAEL JACKSON%';
