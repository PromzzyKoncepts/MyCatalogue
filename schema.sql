
CREATE TABLE game_table (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY, 
  name TEXT NOT NULL,
  multiplayer BOOLEAN NOT NULL, 
  last_played_at DATE);
  
CREATE TABLE authors( 
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY, 
  first_name TEXT NOT NULL,
  Last_name TEXT NOT NULL);


CREATE TABLE music_album {
    id bigint generated always as identity primary key,    
    name VARCHAR(100) NOT NULL,
    on_spotify BOOLEAN NOT NULL,
    publish_date INT NOT NULL
}

CREATE TABLE genre {
    id INT NOT NULL PRIMARY KEY,    
    name VARCHAR(100) NOT NULL,
}

CREATE TABLE item(
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  genre_id INT REFERENCES genre(id) ON DELETE CASCADE,
  author_id INT REFERENCES author(id) ON DELETE CASCADE,
  label_id INT REFERENCES label(id) ON DELETE CASCADE,
  publish_date DATE NOT NULL,
  archived BOOLEAN NOT NULL
);

DROP TABLE IF EXISTS book;

CREATE TABLE book(
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  publisher TEXT NOT NULL,
  cover_state VARCHAR(20) NOT NULL,
  publish_date INT NOT NULL,
  author VARCHAR(70) NOT NULL,
  title VARCHAR(100) NOT NULL,
  archived? BOOLEAN NOT NULL
);

DROP TABLE IF EXISTS label;

CREATE TABLE label(
  id INT REFERENCES book(id),
  title TEXT(70),
  color VARCHAR
)

