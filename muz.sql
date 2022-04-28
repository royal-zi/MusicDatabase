create database mp3_bd;
use mp3_bd;


create table genres(
genre_id int not null primary key ,
genre_name varchar(30) not null
);
INSERT INTO genres (`genre_id`, `genre_name`) VALUES ('1', 'jazz');
INSERT INTO genres (`genre_id`, `genre_name`) VALUES ('2', 'hip-hop');
INSERT INTO genres (`genre_id`, `genre_name`) VALUES ('3', 'rock');
INSERT INTO genres (`genre_id`, `genre_name`) VALUES ('4', 'pop');
INSERT INTO genres (`genre_id`, `genre_name`) VALUES ('5', 'indie rock');
select * from genres;


create table countries(
country_id int not null primary key ,
country_name varchar(30) not null
);
INSERT INTO countries (`country_id`, `country_name`) VALUES ('1', 'USA');
INSERT INTO countries (`country_id`, `country_name`) VALUES ('2', 'Kazakhstan');
INSERT INTO countries (`country_id`, `country_name`) VALUES ('3', 'UK');
INSERT INTO countries (`country_id`, `country_name`) VALUES ('4', 'France');
INSERT INTO countries (`country_id`, `country_name`) VALUES ('5', 'Spanish');
select * from countries;


create table persons(
person_id int not null primary key,
person_name varchar(30) not null,
person_surname varchar(30),
birthday date,
sex enum('M','F'),
honorarium float 
);
INSERT INTO persons (`person_id`, `person_name`, `person_surname`, `birthday`, `sex`,   `honorarium`) VALUES ('1', 'Ed', 'Sheeran', '1985-05-16', 'M', '1000000');
INSERT INTO persons (`person_id`, `person_name`, `person_surname`, `birthday`, `sex`,   `honorarium`) VALUES ('2', 'Travis', 'Scott', '1990-02-15', 'M','1500000');
INSERT INTO persons (`person_id`, `person_name`, `person_surname`, `birthday`, `sex`,   `honorarium`) VALUES ('3', 'Kairat', 'Nurtas', '1991-04-13', 'M','500000');
INSERT INTO persons (`person_id`, `person_name`, `person_surname`, `birthday`, `sex`,  `honorarium`) VALUES ('4', 'Dua', 'Lipa', '1987-12-24', 'F',  '3000000');
INSERT INTO persons (`person_id`, `person_name`, `person_surname`, `birthday`, `sex`,   `honorarium`) VALUES ('5', 'Aikyn', 'Tolepbergen', '1986-08-31', 'M','400000');
INSERT INTO persons (`person_id`, `person_name`, `person_surname`, `birthday`, `sex`,   `honorarium`) VALUES ('6', 'Mukasan', 'Shahzadeev', '1990-02-15', 'M','1500000');
INSERT INTO persons (`person_id`, `person_name`, `person_surname`, `birthday`, `sex`,   `honorarium`) VALUES ('7', 'Dos', 'Dos', '1991-04-13', 'M','500000');
INSERT INTO persons (`person_id`, `person_name`, `person_surname`, `birthday`, `sex`,  `honorarium`) VALUES ('8', 'Saken', 'Maigaziev', '1987-12-24', 'F',  '3000000');
INSERT INTO persons (`person_id`, `person_name`, `person_surname`, `birthday`, `sex`,   `honorarium`) VALUES ('9', 'Meirambek', 'Besbayev', '1986-08-31', 'M','400000');
INSERT INTO persons (`person_id`, `person_name`, `person_surname`, `birthday`, `sex`,   `honorarium`) VALUES ('10', 'Kenzhebek', 'Zhanabilev', '1986-08-31', 'M','400000');
select * from persons;

create table artists(
artist_name varchar(45) not null,
artist_id int not null references persons(person_id)
	ON DELETE CASCADE
    ON UPDATE CASCADE,
genre_id int not null references genres(genre_id)
	ON DELETE CASCADE
    ON UPDATE CASCADE,
country_id int not null references countries(country_id)
	ON DELETE CASCADE
    ON UPDATE CASCADE
);
INSERT INTO artists (`artist_name`,`artist_id`, `genre_id`, `country_id`) VALUES ('Ed Sheeran','1', '1','1');
INSERT INTO artists (`artist_name`,`artist_id`, `genre_id`, `country_id`) VALUES ('Travis Scott','2', '1','3');
INSERT INTO artists (`artist_name`,`artist_id`, `genre_id`, `country_id`) VALUES ('Kairat Nurtas','3', '4','2');
INSERT INTO artists (`artist_name`,`artist_id`, `genre_id`, `country_id`) VALUES ('Dua Lipa','4', '4','1');
INSERT INTO artists (`artist_name`,`artist_id`, `genre_id`, `country_id`) VALUES ('Aikyn Tolepbergen','5', '4','2');
INSERT INTO artists (`artist_name`,`artist_id`, `genre_id`, `country_id`) VALUES ('Ed Sheeran','6', '1','1');
INSERT INTO artists (`artist_name`,`artist_id`, `genre_id`, `country_id`) VALUES ('Travis Scott','7', '1','3');
INSERT INTO artists (`artist_name`,`artist_id`, `genre_id`, `country_id`) VALUES ('Kairat Nurtas','8', '3','2');
INSERT INTO artists (`artist_name`,`artist_id`, `genre_id`, `country_id`) VALUES ('Dua Lipa','9', '3','1');
INSERT INTO artists (`artist_name`,`artist_id`, `genre_id`, `country_id`) VALUES ('Aikyn Tolepbergen','10', '3','2');
select * from artists;

create table groupss(
group_id int not null primary key,
group_name varchar(45) not null
);
INSERT INTO groupss (`group_id`, `group_name`) VALUES ( '1', 'Nur Mukasan');
INSERT INTO groupss (`group_id`, `group_name`) VALUES ( '2', 'Muzart');
select * from groupss;


create table artist_group(
group_id int not null references artists(artist_id)
ON DELETE CASCADE
    ON UPDATE CASCADE,
artist_id int not null references artists(artist_id)
);
INSERT INTO artist_group (`group_id`, `artist_id`) VALUES ( '1', '6');
INSERT INTO artist_group (`group_id`, `artist_id`) VALUES ( '2', '8');
INSERT INTO artist_group (`group_id`, `artist_id`) VALUES ( '1', '7');
INSERT INTO artist_group (`group_id`, `artist_id`) VALUES ( '2', '9');
INSERT INTO artist_group (`group_id`, `artist_id`) VALUES ( '2', '10');

select * from groupss;


create table songs(
song_id int not null primary key,
song_title varchar(30) not null,
song_duration float ,
song_star enum ("1","2","3")
);
INSERT INTO songs (`song_id`, `song_title`, `song_duration`, `song_star`) VALUES ( '3', 'song1', '1.12', '1');
INSERT INTO songs ( `song_id`, `song_title`, `song_duration`, `song_star`) VALUES ( '2', 'song2', '2.15', '1');
INSERT INTO songs ( `song_id`, `song_title`, `song_duration`, `song_star`) VALUES ( '5', 'song3', '3.00', '3');
INSERT INTO songs ( `song_id`, `song_title`, `song_duration`, `song_star`) VALUES ('1', 'song4', '3.18', '3');
INSERT INTO songs (`song_id`, `song_title`, `song_duration`, `song_star`) VALUES ('4', 'song5', '2.45', '2');
select * from songs;



create table albums(
album_id int not null primary key,
album_title varchar(30) not null,
album_year date,
album_song_count int,
artist_id int references artists(artist_id)
);
INSERT INTO albums (`album_id`, `album_title`, `album_year`, `album_song_count`) VALUES ('1', 'title_1', '2015-02-13', '12');
INSERT INTO albums (`album_id`, `album_title`, `album_year`, `album_song_count`) VALUES ('2', 'title_2', '2015-12-31', '11');
INSERT INTO albums (`album_id`, `album_title`, `album_year`, `album_song_count`) VALUES ('3', 'title_3', '2015-10-25', '9');
INSERT INTO albums (`album_id`, `album_title`, `album_year`, `album_song_count`) VALUES ('4', 'title_4', '2015-05-17', '20');
INSERT INTO albums (`album_id`, `album_title`, `album_year`, `album_song_count`) VALUES ('5', 'title_5', '2015-11-11', '15');
select * from albums;

create table album_songs(
album_id int not null references albums(album_id)
	ON DELETE CASCADE
    ON UPDATE CASCADE,
song_id int not null references songs(song_id)
	ON DELETE CASCADE
    ON UPDATE CASCADE
);
INSERT INTO album_songs (`album_id`, `song_id`) VALUES ('1', '1');
INSERT INTO album_songs (`album_id`, `song_id`) VALUES ('2', '3');
INSERT INTO album_songs (`album_id`, `song_id`) VALUES ('3', '5');
INSERT INTO album_songs (`album_id`, `song_id`) VALUES ('4', '4');
INSERT INTO album_songs (`album_id`, `song_id`) VALUES ('5', '2');
select * from album_songs;

create table events(
event_id int not null primary key,
event_name varchar(45) not null,
artist_id int not null references artists(artist_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
location varchar(45)
);
INSERT INTO events (`event_id`, `event_name`,`artist_id`, `location`) VALUES ('1', 'Concert','2', 'Saina 23');
INSERT INTO events (`event_id`, `event_name`,`artist_id`, `location`) VALUES ('2', 'Nauryz','4', 'Auezova 35');
INSERT INTO events (`event_id`, `event_name`,`artist_id`, `location`) VALUES ('3', 'Consecration','1', 'Abaya 456');
INSERT INTO events (`event_id`, `event_name`,`artist_id`, `location`) VALUES ('4', 'Opening','1', 'Dostyk 123');
INSERT INTO events (`event_id`, `event_name`,`artist_id`, `location`) VALUES ('5', 'Advertising','5', 'Satpayeva 189');

select * from events;


create table song_event(
event_id int not null references events(event_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
song_id int not null references songs(song_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);
INSERT INTO song_event (`event_id`, `song_id`) VALUES ('1', '3');
INSERT INTO song_event (`event_id`, `song_id`) VALUES ('2', '4');
INSERT INTO song_event (`event_id`, `song_id`) VALUES ('3', '1');
INSERT INTO song_event (`event_id`, `song_id`) VALUES ('4', '3');
INSERT INTO song_event (`event_id`, `song_id`) VALUES ('5', '1');
select * from song_event;