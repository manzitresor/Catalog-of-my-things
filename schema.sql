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
publisher VARCHAR(50),
cover_state VARCHAR(50)
);

CREATE TABLE Label(
id INT GENERATED ALWAYS AS IDENTITY,
title VARCHAR(50),
color VARCHAR(50)
PRIMARY KEY(id)
);
