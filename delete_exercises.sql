USE codeup_test_db;

SELECT '--------- ALBUMS AFTER 1991' AS '';
SELECT * FROM albums WHERE release_date > 1991;
SELECT '--------- DISCO GENRE ALBUMS' AS '';
SELECT * FROM albums WHERE genre LIKE 'disco%';
SELECT '--------- ALBUMS FEATURING WHITNEY HOUSTON' AS '';
SELECT * FROM albums WHERE artist LIKE 'whitney houston%';

DELETE FROM albums WHERE release_date > 1991;
DELETE FROM albums WHERE genre LIKE 'disco%';
DELETE FROM albums WHERE artist LIKE 'whitney houston%';

-- reset id's in ascending order
# SET @num := 0;
# UPDATE albums SET id = @num := (@num+1);
# ALTER TABLE albums AUTO_INCREMENT = 1;

SELECT * FROM albums;