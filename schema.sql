CREATE TABLE MusicAlbum {
    id bigint generated always as identity primary key,    
    name VARCHAR(100) NOT NULL,
    on_spotify BOOLEAN NOT NULL,
    publish_date INT NOT NULL
}

CREATE TABLE genre {
    id INT NOT NULL PRIMARY KEY,    
    name VARCHAR(100) NOT NULL,
}