-- CREATE DATABASE SONGS_Database;
DROP DATABASE IF EXISTS Py_SONGS_Db;
CREATE DATABASE IF NOT EXISTS Py_SONGS_Db;

-- Select the Earthquake_analysis database to store our tables
USE Py_SONGS_Db;

-- ALTERNATIVELY RUN THE BELOW CODE TO CREATE THE TABLE
DROP TABLE IF EXISTS raw_Py_Songs_tb;
CREATE TABLE IF NOT EXISTS raw_Py_Songs_tb(
song_id INT UNSIGNED,
title VARCHAR(200),
artist VARCHAR(300),
album VARCHAR(150),
year_released SMALLINT UNSIGNED, #-32,000 to +32,000
duration FLOAT8,
tempo FLOAT8,
loudness FLOAT8,
PRIMARY KEY(song_id)
)ENGINE=INNODB 
DEFAULT CHARSET=UTF8MB4 
DEFAULT COLLATE = UTF8MB4_UNICODE_CI;

-- 1. Displaying the Table Structure that was imported
DESCRIBE Py_SONGS_Db.raw_Py_Songs_tb;

-- 1. Another way to display the table structure that was imported
USE Py_SONGS_Db;
DESC raw_Py_Songs_tb;

-- 1.1 Set the local_infile to 'ON' for faster loading
SET GLOBAL local_infile = 'ON';

-- 1.2 Use the SHOW command to see that it is effected
SHOW GLOBAL VARIABLES LIKE 'local_infile';
SHOW VARIABLES LIKE "secure_file_priv";

/* Step 1: Press (Window + E), copy and paste the below path on the file address to go into upload folder:
 C:/ProgramData/MySQL/MySQL Server 8.0/Uploads
   Step 2: Press (Window + E) again and go to the folder containing the Songs_Data_v2.csv file
   Copy the downloaded Songs_Data_v2 file and paste in the Uploads folder
ALWAYS PASTE YOUR CSV FILES INTO THAT FOLDER and run the code below. */

-- 1.3. The better way to load heavy data in MySQL
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/input_files/dbin_songs_data_v2.csv' 
INTO TABLE raw_Py_Songs_tb
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(song_id, title, artist, album, year_released, duration, tempo, loudness);

-- The duration is the length of the song in seconds
-- Tempo measures the speed of the song in beats per minute
/* Average Loudness is a negative number. The closer it 
is to zero the louder the song. A song with loudness -5 
is louder than a song with loudness -20 */

-- 3. Displaying the total number of records in a table
SELECT COUNT(*) -- Using COUNT function is faster
FROM raw_Py_Songs_tb;

-- Creating a Table to accept processed data from Python
DROP TABLE IF EXISTS clean_Py_Songs_tb;

 DESC clean_Py_Songs_tb;

SELECT COUNT(*) -- Using COUNT function is faster
FROM clean_Py_Songs_tb;
