/* Database schema to keep the structure of entire database. */

CREATE DATABASE catalog_keeper;

/* Create games table. */

CREATE TABLE games( 
    id INT GENERATED ALWAYS AS IDENTITY,
    publisher VARCHAR(250),
    cover_state VARCHAR(250),
    author_id INT REFERENCES author(id),
    publish_date DATE,
    archived boolean,
    PRIMARY KEY (id),
 );

/* Create author table. */

 CREATE TABLE author(id INT GENERATED ALWAYS AS IDENTITY, first_name VARCHAR(250), last_name VARCHAR(250), PRIMARY KEY (id));

CREATE TABLE Book(
id INT GENERATED ALWAYS AS IDENTITY,
publisher VARCHAR(50),
cover_state VARCHAR(50)
FOREIGN KEY(id) REFERENCES Item(id)
);

CREATE TABLE Label(
id INT GENERATED ALWAYS AS IDENTITY,
title VARCHAR(50),
color VARCHAR(50)
PRIMARY KEY(id)
FOREIGN KEY(id) REFERENCES Item(id)
);

CREATE TABLE Genres (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE Items(
    id SERIAL PRIMARY KEY,
    genre_id INT REFERENCES genres(id),
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255),
    source VARCHAR(255),
    label VARCHAR(255),
    publish_date DATE
)

CREATE TABLE MusicAlbum (
  id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  item_id INTEGER,
  on_spotify BOOLEAN,
  publish_date DATE,
  title VARCHAR(255) NOT NULL,
  artist VARCHAR(255) NOT NULL,
  FOREIGN KEY(item_id) REFERENCES Item(id)
);

CREATE INDEX musicalbum_index_item_id ON MusicAlbum(item_id)
CREATE INDEX items_genre_index_id ON MusicAlbum(genre_id)
CREATE INDEX label_index_id ON Label(id)
CREATE INDEX book_index_id ON Book(id)