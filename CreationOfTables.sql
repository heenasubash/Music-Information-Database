CREATE database MusicInformation;

CREATE TABLE userLogin (
username VARCHAR(10) PRIMARY KEY,
nameLogin VARCHAR(40),
passwordLogin VARCHAR(10)
);

CREATE TABLE band(
username VARCHAR(20) PRIMARY KEY, 
FOREIGN KEY (username) references userLogin (username),
band_name VARCHAR(30),
grammy_num INT
);

CREATE TABLE solo(
username VARCHAR(20) PRIMARY KEY, 
FOREIGN KEY (username) references userLogin (username),
stage_name VARCHAR(30),
grammy_num INT
);

CREATE TABLE podcaster(
username VARCHAR(20) PRIMARY KEY, 
FOREIGN KEY (username) references userLogin (username),
podcast_num INT
);

CREATE TABLE album(
album_id INT PRIMARY KEY auto_increment,
album_name VARCHAR(20),
album_genre VARCHAR(10),
song_num INT,
release_date DATE 
);

CREATE TABLE single(
single_id INT PRIMARY KEY auto_increment,
single_name VARCHAR(20),
single_genre VARCHAR(10),
release_date DATE 
);

CREATE TABLE podcast(
podcast_id INT PRIMARY KEY auto_increment,
podcast_name VARCHAR(20),
podcast_subject VARCHAR(10)
);

CREATE TABLE song(
song_id INT PRIMARY KEY auto_increment,
song_name VARCHAR(50)
);

CREATE TABLE episode(
episode_id INT PRIMARY KEY auto_increment,
episode_name VARCHAR(50)
);

CREATE TABLE single_lyrics(
single_id INT PRIMARY KEY,
FOREIGN KEY (single_id) REFERENCES single (single_id),
lyrics_single TEXT
);

CREATE TABLE song_lyrics(
song_id INT PRIMARY KEY,
FOREIGN KEY (song_id) REFERENCES song (song_id),
lyrics_song TEXT
);

CREATE TABLE creates_ba(
username VARCHAR(20),
FOREIGN KEY (username) REFERENCES userlogin (username),
album_id INT,
FOREIGN KEY (album_id) REFERENCES album (album_id)
);

CREATE TABLE creates_bs(
username VARCHAR(20),
FOREIGN KEY (username) REFERENCES band (username),
single_id INT,
FOREIGN KEY (single_id) REFERENCES single (single_id)
);

CREATE TABLE creates_ba(
username VARCHAR(20),
FOREIGN KEY (username) REFERENCES band (username),
album_id INT,
FOREIGN KEY (album_id) REFERENCES album (album_id)
);

CREATE TABLE creates_ss(
username VARCHAR(20),
FOREIGN KEY (username) REFERENCES solo (username),
single_id INT,
FOREIGN KEY (single_id) REFERENCES single (single_id)
);

CREATE TABLE creates_sa(
username VARCHAR(20),
FOREIGN KEY (username) REFERENCES solo (username),
album_id INT,
FOREIGN KEY (album_id) REFERENCES album (album_id)
);

CREATE TABLE has(
album_id INT,
FOREIGN KEY (album_id) REFERENCES album (album_id),
song_id INT,
FOREIGN KEY (song_id) REFERENCES song (song_id)
);

CREATE TABLE pod_has(
podcast_id INT,
FOREIGN KEY (podcast_id) REFERENCES podcast (podcast_id),
episode_id INT,
FOREIGN KEY (episode_id) REFERENCES episode (episode_id)
);

CREATE TABLE has(
album_id INT,
FOREIGN KEY (album_id) REFERENCES album (album_id),
song_id INT,
FOREIGN KEY (song_id) REFERENCES song (song_id)
);

CREATE TABLE makes(
username VARCHAR(20),
FOREIGN KEY (username) REFERENCES podcaster (username),
podcast_id INT,
FOREIGN KEY (podcast_id) REFERENCES podcast (podcast_id)
);

CREATE TABLE song_play(
username VARCHAR(20),
FOREIGN KEY (username) REFERENCES userLogin (username),
song_id INT,
FOREIGN KEY (song_id) REFERENCES song (song_id),
no_songplay INT
);

CREATE TABLE single_play(
username VARCHAR(20),
FOREIGN KEY (username) REFERENCES userLogin (username),
single_id INT,
FOREIGN KEY (single_id) REFERENCES single (single_id),
no_singleplay INT
);

CREATE TABLE episode_play(
username VARCHAR(20),
FOREIGN KEY (username) REFERENCES userLogin (username),
episode_id INT,
FOREIGN KEY (episode_id) REFERENCES episode (episode_id),
no_episodeplay INT
);

INSERT INTO userLogin
VALUES('lorde', 'Ella Yelich O\'Connor', 'qwert');

INSERT INTO userLogin
VALUES('dualipa', 'Dua Lipa', 'dua123');

INSERT INTO userLogin
VALUES('taylor', 'Taylor Swift', 'tay123');

INSERT INTO userLogin
VALUES('camilla', 'Camilla Cabello', 'cam123');

INSERT INTO userLogin
VALUES('justin', 'Justin Bieber', 'qwerty');

INSERT INTO userLogin
VALUES('olivia', 'Olivia Rodrigo', 'olive123');

INSERT INTO userLogin
VALUES('adele', 'Adele Laurie Blue Adkins', 'adele123');

INSERT INTO userLogin
VALUES('edsheeran', 'Edward Christopher Sheeran', 'eddie123');

INSERT INTO userLogin
VALUES('theweeknd', 'Abel Makkonen Tesfaye', 'week123');

INSERT INTO userLogin
VALUES('drake', 'Aubrey Drake Graham', 'aub123');

INSERT INTO userLogin
VALUES('lilnasx', 'Montero Lamar Hill', 'nas123');

INSERT INTO userLogin
VALUES('hstyles', 'Harry Styles', 'harry123');

INSERT INTO userLogin
VALUES('zayn', 'Zayn Malik', 'zayn123');

INSERT INTO userLogin
VALUES('louistom', 'Louis Tomlinson', 'louis123');

INSERT INTO userLogin
VALUES('liamp', 'Liam Payne', 'liam123');

INSERT INTO userLogin
VALUES('niallhoran', 'Niall Horan', 'niall123');

INSERT INTO userLogin
VALUES('johnlen', 'John Lennon', 'jonny123');

INSERT INTO userLogin
VALUES('paulmc', 'Paul McCarteney', 'pau123');

INSERT INTO userLogin
VALUES('georgeharr', 'George Harrison', 'grg123');

INSERT INTO userLogin
VALUES('ringo', 'Ringo Starr', 'nas123');

INSERT INTO userLogin
VALUES('freddie', 'Freddie', 'fred123');

INSERT INTO userLogin
VALUES('brian', 'Brian May', 'bree123');

INSERT INTO userLogin
VALUES('johndeac', 'John Deacon', 'mygod123');

INSERT INTO userLogin
VALUES('rogertay', 'Roger Taylor', 'rogg123');

INSERT INTO userLogin
VALUES('angela', 'Angela Kinsey', 'angie123');

INSERT INTO userLogin
VALUES('jenna', 'Jenna Fischer', 'jen123');

INSERT INTO userLogin
VALUES('johng', 'John Green', 'heyo123');

INSERT INTO userLogin
VALUES('joer', 'Joe Rogan', 'rogg123');

INSERT INTO userLogin
VALUES('conan', 'Conan O\'Brien', 'coco123');

INSERT INTO userLogin
VALUES('michelle', 'Michelle Obama', 'podc123');

INSERT INTO band
VALUES('hstyles', 'One Direction', 0 );

INSERT INTO band
VALUES('zayn', 'One Direction', 0 );

INSERT INTO band
VALUES('louistom', 'One Direction', 0);

INSERT INTO band
VALUES('liamp', 'One Direction', 0);

INSERT INTO band
VALUES('niallhoran', 'One Direction', 0);

INSERT INTO band
VALUES('freddie', 'Queen', 1);

INSERT INTO band
VALUES('brian', 'Queen', 1);

INSERT INTO band
VALUES('johndeac', 'Queen', 1);

INSERT INTO band
VALUES('rogertay', 'Queen', 1);

INSERT INTO band
VALUES('johnlen', 'The Beatles', 7);

INSERT INTO band
VALUES('paulmc', 'The Beatles', 7);

INSERT INTO band
VALUES('georgeharr', 'The Beatles', 7);

INSERT INTO band
VALUES('ringo', 'The Beatles', 7);

INSERT INTO solo
VALUES('lorde', 'Lorde', 2);

INSERT INTO solo
VALUES('dualipa', 'Dua Lipa', 3);

INSERT INTO solo
VALUES('taylor', 'Taylor Swift', 11);

INSERT INTO solo
VALUES('camilla', 'Camilla Cabello', 0);

INSERT INTO solo
VALUES('justin', 'Justin Bieber', 2);

INSERT INTO solo
VALUES('olivia', 'Olivia Rodrigo', 7);

INSERT INTO solo
VALUES('adele', 'Adele', 15);

INSERT INTO solo
VALUES('edsheeran', 'Ed Sheeran', 4);

INSERT INTO solo
VALUES('theweeknd', 'The Weeknd', 5);

INSERT INTO solo
VALUES('drake', 'Drake', 4);

INSERT INTO solo
VALUES('lilnasx', 'Lil Nas X', 2);

INSERT INTO podcaster
VALUES('angela', 1);

INSERT INTO podcaster
VALUES('jenna', 1);

INSERT INTO podcaster
VALUES('johng', 1);

INSERT INTO podcaster
VALUES('joer', 1);

INSERT INTO podcaster
VALUES('conan', 1);

INSERT INTO podcaster
VALUES('michelle', 1);

ALTER TABLE podcast
modify podcast_name VARCHAR(40);

ALTER TABLE podcast
modify podcast_subject VARCHAR(30);

ALTER TABLE single
modify single_name VARCHAR(40);

INSERT INTO album(album_name,album_genre,song_num,release_date)
VALUES ('Red','Country',16,'2012-10-22');

INSERT INTO album(album_name,album_genre,song_num,release_date)
VALUES ('Future Nostalgia','Pop',11,'2020-03-27');

INSERT INTO album(album_name,album_genre,song_num,release_date)
VALUES ('21','Pop',11,'2011-01-24');

INSERT INTO album(album_name,album_genre,song_num,release_date)
VALUES ('1989','Synth-Pop',13,'2014-10-27');

INSERT INTO album(album_name,album_genre,song_num,release_date)
VALUES ('Up all night','Pop',18,'2011-10-18');

INSERT INTO album(album_name,album_genre,song_num,release_date)
VALUES ('Pure Heroine','Electro',15,'2013-09-27');

INSERT INTO album(album_name,album_genre,song_num,release_date)
VALUES ('SOUR','Pop',11,'2021-06-21');

INSERT INTO album(album_name,album_genre,song_num,release_date)
VALUES ('Starboy','R&B',18,'2016-10-25');

INSERT INTO single(single_name,single_genre,release_date)
VALUES ('Flames','EDM','2019-11-15');

INSERT INTO single(single_name,single_genre,release_date)
VALUES ('Thank god it\'s christmas','pop','1984-11-26');

INSERT INTO single(single_name,single_genre,release_date)
VALUES ('Baby','pop','2010-01-18');

INSERT INTO podcast(podcast_name,podcast_subject)
VALUES ('Conan\'O Brien needs a friend','Conversation');

INSERT INTO podcast(podcast_name,podcast_subject)
VALUES ('Office Ladies','Conversation');

INSERT INTO podcast(podcast_name,podcast_subject)
VALUES ('The Anthropocene Reviewed','Commentary');

INSERT INTO podcast(podcast_name,podcast_subject)
VALUES ('The Joe Rogan Experience','Conversation');

INSERT INTO song(song_name)
VALUES ('Future Nostalgia');

INSERT INTO song(song_name)
VALUES ('Don\'t start now');

INSERT INTO song(song_name)
VALUES ('Cool');

INSERT INTO song(song_name)
VALUES ('Physical');

INSERT INTO song(song_name)
VALUES ('Levitating');

INSERT INTO song(song_name)
VALUES ('Pretty please');

INSERT INTO song(song_name)
VALUES ('Hallucinate');

INSERT INTO song(song_name)
VALUES ('Love Again');

INSERT INTO song(song_name)
VALUES ('Break my heart');

INSERT INTO song(song_name)
VALUES ('Good in Bed');

INSERT INTO song(song_name)
VALUES ('Boys will be boys');

INSERT INTO episode(episode_name)
VALUES ('Happy Holidays and A Look Back on Christmas Party');

INSERT INTO episode(episode_name)
VALUES ('Cafe Disco');

INSERT INTO episode(episode_name)
VALUES ('Auld Lang Syne');

INSERT INTO episode(episode_name)
VALUES ('Notes App and Sports Rivalries');

INSERT INTO episode(episode_name)
VALUES ('Steven E. Koonin');

INSERT INTO episode(episode_name)
VALUES ('Tony Woods');

INSERT INTO episode(episode_name)
VALUES ('They Do: Talking Marriage with Conan\' O Brien');

INSERT INTO episode(episode_name)
VALUES ('Across Generations: Michelle Obama and her mentees');

INSERT INTO song_play
VALUES ('camilla', 2,19);

INSERT INTO song_play
VALUES ('brian', 3,17);

INSERT INTO song_play
VALUES ('justin', 3,19);

INSERT INTO song_play
VALUES ('johndeac', 4,54);

INSERT INTO song_play
VALUES ('liamp', 5,17);

INSERT INTO song_play
VALUES ('camilla', 6,67);

INSERT INTO song_play
VALUES ('johnlen', 7,34);

INSERT INTO song_play
VALUES ('joer', 8,87);

INSERT INTO song_play
VALUES ('camilla', 9,19);

INSERT INTO song_play
VALUES ('hstyles', 10,19);

INSERT INTO song_play
VALUES ('dualipa', 11,10);

INSERT INTO episode_play
VALUES ('dualipa', 1,10);

INSERT INTO episode_play
VALUES ('camilla', 2,10);

INSERT INTO episode_play
VALUES ('brian', 3,10);

INSERT INTO episode_play
VALUES ('adele', 4,10);

INSERT INTO episode_play
VALUES ('camilla', 4,10);

INSERT INTO episode_play
VALUES ('hstyles', 5,10);

INSERT INTO episode_play
VALUES ('johnlen', 6,20);

INSERT INTO episode_play
VALUES ('johndeac', 7,10);

INSERT INTO episode_play
VALUES ('johndeac', 2,72);

INSERT INTO episode_play
VALUES ('johndeac', 1,34);


INSERT INTO has
VALUES(2,1);
INSERT INTO has
VALUES(2,2);
INSERT INTO has
VALUES(2,3);
INSERT INTO has
VALUES(2,4);
INSERT INTO has
VALUES(2,5);
INSERT INTO has
VALUES(2,6);
INSERT INTO has
VALUES(2,7);
INSERT INTO has
VALUES(2,8);
INSERT INTO has
VALUES(2,9);
INSERT INTO has
VALUES(2,10);
INSERT INTO has
VALUES(2,11);

INSERT INTO pod_has
VALUES (1,7);
INSERT INTO pod_has
VALUES (1,8);
INSERT INTO pod_has
VALUES (2,1);
INSERT INTO pod_has
VALUES (2,2);
INSERT INTO pod_has
VALUES (3,3);
INSERT INTO pod_has
VALUES (3,4);
INSERT INTO pod_has
VALUES (4,5);
INSERT INTO pod_has
VALUES (4,6);


INSERT INTO single_lyrics
VALUES(5,'Oh whoa
Oh whoa
Oh whoa
You know you love me, I know you care
Just shout whenever and I\'ll be there
You are my love, you are my heart
And we will never, ever, ever be apart
Are we an item? Girl, quit playing
We\'re just friends, what are you saying?
Said, "There\'s another" and look right in my eyes
My first love broke my heart for the first time and I was like
Baby, baby, baby, oh
Like baby, baby, baby, no
Like baby, baby, baby, oh
Thought you\'d always be mine, mine
Baby, baby, baby, oh
Like baby, baby, baby, no
Like baby, baby, baby, oh
Thought you\'d always be mine, mine
Oh, for you I would have done whatever
And I just can\'t believe we ain\'t together
And I wanna play it cool, but I\'m losin\' you
I\'ll buy you anything, I\'ll buy you any ring
And I\'m in pieces, baby, fix me
And just shake me \'til you wake me from this bad dream
I\'m going down, down, down, down
And I just can\'t believe my first love won\'t be around and I\'m like
Baby, baby, baby, oh
Like baby, baby, baby, no
Like baby, baby, baby, oh
Thought you\'d always be mine, mine
Baby, baby, baby, oh
Like baby, baby, baby, no
Like baby, baby, baby, oh
Thought you\'d always be mine, mine
Luda!
When I was 13, I had my first love
There was nobody that compared to my baby
And nobody came between us or could ever come above
She had me going crazy
Oh, I was star-struck
She woke me up daily, don\'t need no Starbucks
She made my heart pound
It skip a beat when I see her in the street and
At school on the playground but I really wanna see her on the weekend
She knows she got me dazing
\'Cause she was so amazing
And now my heart is breaking but I just keep on saying
Baby, baby, baby, oh
Like baby, baby, baby, no
Like baby, baby, baby, oh
Thought you\'d always be mine, mine
Baby, baby, baby, oh
Like baby, baby, baby, no
Like baby, baby, baby, oh
Thought you\'d always be mine, mine
I\'m gone (yeah, yeah, yeah, yeah, yeah, yeah)
Now I\'m all gone (yeah, yeah, yeah, yeah, yeah, yeah)
Now I\'m all gone (yeah, yeah, yeah, yeah, yeah, yeah)
Now I\'m all gone (gone, gone, gone)
I\'m gone');

insert into song_lyrics 
values (2,'If you don\'t wanna see me
Did a full 180, crazy
Thinking \'bout the way I was
Did the heartbreak change me? Maybe
But look at where I ended up
I''m all good already
So moved on, it\'s scary
I\'m not where you left me at all, so
If you don\'t wanna see me dancing with somebody
If you wanna believe that anything could stop me
Don\'t show up, don\'t come out
Don\'t start caring about me now
Walk away, you know how
Don\'t start caring about me now
Aren\'t you the guy who tried to
Hurt me with the word "goodbye"?
Though it took some time to survive you
I\'m better on the other side
I\'m all good already
So moved on, it\'s scary
I\'m not where you left me at all, so
If you don\'t wanna see me dancing with somebody
If you wanna believe that anything could stop me
Don\'t show up, don\'t come out
Don\'t start caring about me now
Walk away, you know how
Don\'t start caring about me now (\'bout me now, \'bout me)
Oh, oh
Don\'t come out, out, out
Don\'t show up, up, up
Don\'t start now (oh)
Oh, oh
Don\'t come out, out
I\'m not where you left me at all, so
If you don\'t wanna see me dancing with somebody
If you wanna believe that anything could stop me
Don\'t show up (don\'t show up), don\'t come out (don\'t come out)
Don\'t start caring about me now (\'bout me now)
Walk away (walk away), you know how (you know how)
Don\'t start caring about me now (so)
Oh, oh
Don\'t come out, out, out
Don\'t show up, up, up
Walk away, walk away (so)
Oh, oh
Don\'t come out, out, out
Don\'t show up, up, up
Walk away, walk away, oh');

SELECT * FROM song;

INSERT INTO song_lyrics
VALUES (3,'Guess I never had a love like this
Hit me harder than I ever expected
We been up all goddamn night, all night, all night
Keep it going \’til we see the sunlight
And the colour of the sky looking nice-o-nice
You know, you know, you know
Baby, I could see us in the real life
You know, you know you got
Got me losin\’ all my cool
\’Cause I\’m burnin\’ up on you
In control of what I do
And I love the way you move
We\’ll get the heat and the thrill
Gives you more than any pill
Never runnin\’ out of juice
When it\’s only me and you
You got me, you got me losin\’ all my cool
Cool, cool, cool, cool, cool
Cool, cool, cool, cool, cool
I guess we\’re ready for the summer
Cool, cool, cool, cool, cool
Cool, cool, cool, cool, cool
I like us better when we\’re intertwined
The way you touch me got me losin\’ my senses (ah-ah)
Put your love with your lips on mine, on mine, on mine
You got me workin\’ up an appetite-tite
And the colour of the sky looking nice-o-nice
You know, you know, you know
Baby, I could see us in the real life
You now, you know you got
Got me losin\’ all my cool
\’Cause I\’m burnin\’ up on you
In control of what I do
And I love the way you move
We\’ll get the heat and the thrill
Gives you more than any pill
Never runnin\’ out of juice
When it\’s only me and you
You got me, you got me losin\’ all my cool
Skintight
I\’ll show you heaven, there\’s nothing better
I\’ll give it to you all night
You know, you know, you know
Got me losin\’ all my cool
Yeah, you like the way I move
In control of what I do
And my love makes you brand new
Got me losin\’ all my cool
\’Cause I\’m burnin\’ up on you
In control of what I do
And I love the way you move
We\’ll get the heat and the thrill
Gives you more than any pill
Never runnin\’ out of juice
When it\’s only me and you
Cool, cool, cool, cool, cool
Cool, cool, cool, cool, cool
Cool, cool, cool, cool, cool
Cool, cool, cool, cool, cool
Cool, cool, cool, cool, cool
Cool, cool, cool, cool, cool (hey, cool)
Cool, cool, cool, cool, cool
Cool, cool, cool, cool, cool (yeah)
I guess we\’re ready for the summer
Cool, cool, cool, cool, cool (ah-ah, ah-ah)
You got me, you got me losin\’ all my cool (hey)
Cool, cool, cool, cool, cool
I guess we\’re ready for the summer
Cool, cool, cool, cool, cool (ah-ah, hey)
You got me, you got me losin\’ all my cool
Cool, cool, cool, cool, cool (ah-ah, ah-ah, ah-ah)
I guess we\’re ready for the summer (hey, cool)
You got me, you got me losin\’ all my cool (ah-ah, hey)
I guess we\’re ready for the summer (ah-ah, hey)
You got me, you got me losin\’ all my cool (ah-ah, hey)
Cool, cool, cool, cool, cool
I guess we\’re ready for the summer
Cool, cool, cool, cool, cool (hey)
You got me, you got me losin\’ all my cool
Cool, cool, cool, cool, cool (hey)
I guess we\’re ready for the summer
Cool, cool, cool, cool, cool
You got me, you got me losin\’ all my cool (ah-ah, hey)
I guess we\’re ready for the summer (ah-ah, hey)
You got me, you got me losin\’ all my cool (ah-ah, hey)
I guess we\’re ready for the summer (ah-ah, hey)
You got me, you got me losin\’ all my cool (ah-ah, hey)
I guess we\’re ready for the summer (ah-ah, hey)
You got me losin\’ all my cool
I guess we\’re ready for the summer (ah-ah, hey)
You got me, you got me losin\’ all my cool (ah-ah, ah-ah, ah-ah)
I guess we\’re ready for the summer
You got me, you got me losin\’ all my cool');

INSERT INTO song_lyrics
VALUES (4,'Common love isn\’t for us
We created something phenomenal
Don\’t you agree?
Don\’t you agree?
You got me feeling diamond rich
Nothing on this planet compares to it
Don\’t you agree?
Don\’t you agree?
Who needs to go to sleep when I got you next to me?
All night, I\’ll riot with you
I know you got my back, and you know I got you
So come on (come on)
Come on (come on)
Come on (come on)
Let\’s get physical
Lights out, follow the noise
Baby, keep on dancing like you ain\’t got a choice
So come on (come on)
Come on (come on)
Come on
Let\’s get physical
Adrenaline keeps on rushing in
Love the simulation we\’re dreaming in
Don\’t you agree?
Don\’t you agree?
I don\’t wanna live another life
\’Cause this one\’s pretty nice
Living it up
Who needs to go to sleep when I got you next to me?
All night, I\’ll riot with you
I know you got my back, and you know I got you
So come on (come on)
Come on (come on)
Come on (come on)
Let\’s get physical
Lights out, follow the noise
Baby, keep on dancing like you ain\’t got a choice
So come on (come on)
Come on (come on)
Come on
Let\’s get physical
Hold on just a little tighter
Come on, hold on, tell me if you\’re ready
Come on (come on, come on)
Baby, keep on dancing
Let\’s get physical
Hold on just a little tighter
Come on, hold on, tell me if you\’re ready
Come on (come on, come on)
Baby, keep on dancing
Let\’s get physical
All night, I\’ll riot with you
I know you got my back, and you know I got you
So come on
Come on
Come on
Let\’s get physical
Lights out, follow the noise
Baby, keep on dancing like you ain\’t got a choice
So come on (come on)
Come on (come on)
Come on
Let\’s get physical (physical, physical)
Let\’s get physical (physical, physical)
Physical (physical, physical)
Let\’s get physical (physical, physical)
Come on, phy-phy-phy-physical');

select * from single_play;

INSERT INTO single_play
VALUES ('camilla', 1,19);

INSERT INTO single_play
VALUES ('brian', 2,17);

INSERT INTO single_play
VALUES ('justin', 1,19);

INSERT INTO single_play
VALUES ('johndeac', 4,54);

INSERT INTO single_play
VALUES ('liamp', 5,17);

INSERT INTO single_play
VALUES ('camilla', 1,67);

INSERT INTO single_play
VALUES ('johnlen', 2,34);

INSERT INTO single_play
VALUES ('joer', 5,87);

INSERT INTO single_play
VALUES ('camilla', 4,19);

INSERT INTO single_play
VALUES ('hstyles', 3,19);

INSERT INTO single_play
VALUES ('dualipa', 2,10);

INSERT INTO single_play
VALUES ('dualipa', 1,10);

INSERT INTO creates_bs
VALUES ('brian',3);

INSERT INTO creates_bs
VALUES ('freddie',3);

INSERT INTO creates_bs
VALUES ('rogertay',3);

INSERT INTO creates_bs
VALUES ('johndeac',3);

INSERT INTO solo 
VALUES ('zayn','Zayn Malik',0);

INSERT INTO creates_ss
VALUES ('zayn',2);

INSERT INTO creates_ss
VALUES ('camilla',4);

INSERT INTO creates_ss
VALUES ('justin',5);

INSERT INTO creates_sa
VALUES ('dualipa',2);

INSERT INTO creates_sa
VALUES ('olivia',7);

INSERT INTO song(song_name)
VALUES ("Brutal");

INSERT INTO song(song_name)
VALUES ("Traitor");

INSERT INTO song(song_name)
VALUES ("Drivers License");

INSERT INTO song(song_name)
VALUES ("1 Step Forward, 3 Steps Back");

INSERT INTO song(song_name)
VALUES ("Deja Vu");

INSERT INTO song(song_name)
VALUES ("Good 4 U");

INSERT INTO song(song_name)
VALUES ("Enough for You");

INSERT INTO song(song_name)
VALUES ("Happier");

INSERT INTO song(song_name)
VALUES ("Jealousy, Jealousy");

INSERT INTO song(song_name)
VALUES ("Favorite Crime");

INSERT INTO song(song_name)
VALUES ("Hope Ur OK");

INSERT INTO has
VALUES(7,12);

INSERT INTO has
VALUES(7,13);

INSERT INTO has
VALUES(7,14);

INSERT INTO has
VALUES(7,15);

INSERT INTO has
VALUES(7,16);
INSERT INTO has
VALUES(7,17);
INSERT INTO has
VALUES(7,18);
INSERT INTO has
VALUES(7,19);
INSERT INTO has
VALUES(7,20);
INSERT INTO has
VALUES(7,21);
INSERT INTO has
VALUES(7,22);


































