create table if not exists musical_genres (
	id_genres serial primary key,
	genres varchar(40) not null
);

create table if not exists musician (
	id_musician serial primary key,
	name_musician varchar(60) not null
);

create table if not exists genres_musician (
	genres_id integer references musical_genres(id_genres),
	musician_id integer references musician(id_musician),
	constraint gen_mus primary key(genres_id, musician_id)
);

create table if not exists albums (
	id_albums serial primary key,
	album_title varchar(40) not null,
	year_release integer not null check(year_release > 1900)
);

create table if not exists musician_albums (
	musician_id integer references musician(id_musician),
	albums_id integer references albums(id_albums),
	constraint mus_alb primary key(musician_id, albums_id)
);

create table if not exists collection (
	id_collection serial primary key,
	collection_tracks varchar(40) not null,
	year_release integer not null check(year_release > 1900)
);

create table if not exists tracks (
	albums_id integer primary key references albums(id_albums),
	collection_id integer not null references collection(id_collection),
	name_tracks varchar(40) not null,
	track_duration integer not null check(track_duration > 0)
);