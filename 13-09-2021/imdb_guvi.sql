create database imdb;
use imdb;
create table users(user_id int(5) primary key,user_name varchar(30),user_mail varchar(30));
create table movie( movie_id int(5) primary key,movie_name varchar(30));
create table review(review_id int(5)primary key,stars int(1),review_description varchar(100),user_id int(5),movie_id int(5),foreign key(user_id) references users(user_id),foreign key(movie_id) references movie(movie_id));
create table genere(genere_id int(5) primary key,genere_type varchar(30));
create table genere_movie(id int(5)primary key,movie_id int(5),genere_id int(5),foreign key(movie_id) references movie(movie_id),foreign key(genere_id)references genere(genere_id));
create table media(media_id int(1) primary key,media varchar(10));
create table media_movie(id int(5),media_id int(1),movie_id int(5), foreign key(media_id)references media(media_id),foreign key(movie_id) references movie(movie_id));
create table artist(artist_id int(5)primary key,artist_name varchar(30));
create table skill(skill_id int(5)primary key,skill_name varchar(20));
create table artist_skils(id int(5)primary key,artist_id int(5),skill_id int(5),foreign key(artist_id) references skill(skill_id),foreign key(skill_id)references skill(skill_id));
create table roles(role_id int(5)primary key,role_name varchar(20));
create table artist_role(id int(5)primary key,artist_id int(5),role_id int(5),foreign key(artist_id)references artist(artist_id),foreign key(role_id) references roles(role_id));
create table movie_artist_role(id int(5)primary key,movie_id int(5),artist_id int(5),role_id int(5),foreign key(artist_id)references artist(artist_id),foreign key(role_id) references roles(role_id),foreign key(movie_id) references movie(movie_id));
insert into users values (1,'Ashish','ashish@gmail.com'),(2,'Steve','steve@gmail.com'),(3,'Tony','tony@gmail.com'),(4,'Bruce','bruce@gmail.com'),(5,'Thor','thor@gmail.com');
insert into movie values(1,'movie1'),(2,'movie2'),(3,'movie3'),(4,'movie4'),(5,'movie5');
insert into review values(1,5,'Good',1,1),(2,4,'Best',2,2),(3,3,'Bad',2,3),(4,4,'Good',3,4),(5,5,'Best',4,5);
insert into genere values(1,'Thriller'),(2,'Action'),(3,'Suspense'),(4,'Comdey'),(5,'Drama');
insert into genere_movie values(1,1,2),(2,1,1),(3,2,3),(4,3,4),(5,5,3);
insert into artist values(1,'Artist1'),(2,'Artist2'),(3,'Artist3'),(4,'Artist4'),(5,'Artist5');
insert into skill values(1,'Dance'),(2,'Acting'),(3,'Comedy');
insert into artist_skils values(1,1,1),(2,2,2),(3,1,3),(4,3,2);
insert into roles values(1,'Hero'),(2,'Heroine'),(3,'Support'),(4,'Commedy');
insert into artist_role values(1,1,1),(2,1,4),(3,2,1),(4,3,4);
insert into movie_artist_role values(1,1,1,1),(2,2,2,2),(3,3,3,3),(4,1,4,4);
insert into media values(1,'Video'),(2,'Image'),(3,'Both');
insert into media_movie values(1,1,1),(2,2,2),(3,3,3);
insert into media_movie values(4,1,5),(5,2,4);
--  Qn1
select movie.movie_id,movie_name,media from movie   inner join media_movie on movie.movie_id=media_movie.movie_id inner join media on media.media_id=media_movie.media_id;
-- Qn2
select movie.movie_id,movie_name,media,stars,review_description from movie   inner join media_movie on movie.movie_id=media_movie.movie_id inner join media on media.media_id=media_movie.media_id inner join review on movie.movie_id=review.movie_id;
-- Qn3
select movie_name,artist_name,role_name from artist inner join movie_artist_role on artist.artist_id=movie_artist_role.artist_id inner join movie on movie.movie_id=movie_artist_role.movie_id inner join movie_artist_role on movie_artist_role.movie_id=roles.role_id;
-- Qn4
select user_name,movie_name,stars,review_description from review inner join  users on users.user_id=review.user_id inner join movie on review.movie_id=movie.movie_id where users.user_id=1;
-- Qn5
select artist_name,skill_name from artist inner join artist_skils on artist.artist_id=artist_skils.artist_id inner join skill on skill.skill_id=artist_skils.skill_id where artist.artist_id=1;
-- Qn6
select artist_name,role_name from roles inner join artist_role on roles.role_id=artist_role.role_id inner join artist on artist.artist_id=artist_role.artist_id where artist.artist_id=1;
