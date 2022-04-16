-- How many times does ‘Baby’ occur in the song ‘Baby’?
SELECT lyrics_single ,ROUND(
(LENGTH(lyrics_single) - LENGTH(REPLACE(lyrics_single,"baby","")))/LENGTH("baby")
)
AS count
FROM single_lyrics;

-- Using Stored Functions
SELECT countTheWords(lyrics_song, "baby") AS count FROM song_lyrics;

-- How many plays does the song 'Cool' have?
SELECT @id:= song_id
FROM song
WHERE song_name = 'Cool';

SELECT SUM(no_songplay) as plays 
FROM song_play 
WHERE song_id = @id;

-- using stored procedures
call songplay1(@id);

-- How many plays does the album 'Future Nostalgia' have?
SELECT @al_id:= album_id
FROM album
WHERE album_name = 'Future Nostalgia';

SELECT SUM(no_songplay) AS Plays
FROM song_play 
WHERE song_id IN (SELECT song_id 
FROM has 
WHERE album_id =  @al_id);

CALL songplay IN (SELECT song_id 
FROM has 
WHERE album_id =  @al_id);

-- What is the most played 'Conversation' podcast?
SELECT Plays,podcast.podcast_name
FROM podcast
INNER JOIN
(SELECT SUM(no_episodeplay) AS Plays, pod_has.podcast_id AS pod_id
FROM episode_play  
INNER JOIN pod_has ON episode_play.episode_id = pod_has.episode_id 
WHERE episode_play.episode_id IN (SELECT episode_id  FROM pod_has  WHERE podcast_id IN
(SELECT podcast_id FROM podcast WHERE podcast_subject = 'Conversation')) 
GROUP BY(pod_has.podcast_id)) t
ON podcast.podcast_id = t.pod_id
ORDER BY(Plays) DESC;

-- What is newest song released?
SELECT song.song_name, release_date
FROM song
INNER JOIN 
(SELECT album.release_date, has.song_id 
FROM album
INNER JOIN has ON album.album_id = has.album_id) T2
ON song.song_id = T2.song_id
ORDER BY (release_date) DESC;

-- What is the oldest album in the database?
SELECT album.album_name, album.release_date
FROM album
ORDER BY (release_date);

-- Which song has the phrase “Physical”?
SELECT song.song_name,song_lyrics.lyrics_song 
FROM song_lyrics 
INNER JOIN song ON song.song_id = song_lyrics.song_id
WHERE lyrics_song LIKE '%physical%';

-- Who is the artist most and least grammmys?
-- MOST
SELECT artist_name, grammy_num FROM 
(SELECT band_name AS artist_name,grammy_num FROM band
UNION
SELECT stage_name,grammy_num FROM solo) t3
WHERE  grammy_num=(SELECT MAX(grammy_num) FROM (SELECT band_name AS artist_name,grammy_num FROM band
UNION
SELECT stage_name,grammy_num FROM solo) t3);

-- LEAST
SELECT artist_name, grammy_num FROM 
(SELECT band_name AS artist_name,grammy_num FROM band
UNION
SELECT stage_name,grammy_num FROM solo) t3
WHERE  grammy_num=(SELECT MIN(grammy_num) FROM (SELECT band_name AS artist_name,grammy_num FROM band
UNION
SELECT stage_name,grammy_num FROM solo) t3);

-- List the artists who made the most played pop singles
SELECT artist_name,Plays,single_name FROM
(SELECT username,band_name AS artist_name,grammy_num FROM band
UNION
SELECT username,stage_name,grammy_num FROM solo) t3
INNER JOIN
(SELECT username,T7.Plays,T7.single_name FROM
(SELECT * FROM creates_bs UNION SELECT * FROM creates_ss)T6
INNER JOIN
(SELECT single.single_id,single.single_name,t5.Plays FROM single
INNER JOIN
(SELECT SUM(no_singleplay) AS Plays, single_play.single_id 
FROM single_play  
GROUP BY(single_play.single_id))t5 
ON single.single_id = t5.single_id
WHERE single_genre = 'pop')T7
ON T6.single_id = T7.single_id)t8
ON t3.username = t8.username
ORDER BY (Plays) DESC;

-- Who created the song 'deja vu'?
SELECT artist_name FROM (SELECT username,band_name AS artist_name,grammy_num FROM band
UNION
SELECT username,stage_name,grammy_num FROM solo) t3 WHERE t3.username IN(
SELECT username FROM (SELECT * FROM creates_ba UNION SELECT * FROM creates_sa)T6
WHERE album_id IN(SELECT album_id FROM has WHERE song_id IN
(SELECT song_id FROM song WHERE song_name = 'Deja Vu')));

DELIMITER &&
CREATE PROCEDURE test(IN stringI VARCHAR(10))
BEGIN 
SELECT * FROM userLogin;
END &&

