CREATE TABLE artists(
    name VARCHAR(255),
    id INT PRIMARY KEY,
    popularity INT,
    followers INT
);

CREATE TABLE albums(
    id INT PRIMARY KEY,
    name VARCHAR(255),
    album_group VARCHAR(255),
    album_type VARCHAR(255),
    release_date VARCHAR(255),
    popularity INT
);
CREATE TABLE genres(
    name VARCHAR(255) PRIMARY KEY
);
CREATE TABLE tracks(
    id INT PRIMARY KEY,
    disc_number INT,
    duration INT,	
    name VARCHAR(255),
    preview_url VARCHAR(1000),
    track_number INT,
    popularity INT,
    is_playable BOOLEAN

);
CREATE TABLE audio_features(
    id INT PRIMARY KEY,
    acousticness FLOAT,
    analysis_url VARCHAR(1000),
    danceability FLOAT,
    duration INT,
    energy FLOAT,
    instrumentalness FLOAT,
    track_key INT,
    liveness INT,
    loudness FLOAT,
    speechiness FLOAT,
    tempo FLOAT,
    time_signature INT,
    valence FLOAT,
    FOREIGN KEY (id) REFERENCES tracks(id)
);



CREATE TABLE r_albums_artists(
    album_id INT,
    artist_id INT,
    PRIMARY KEY(album_id, artist_id),
    FOREIGN KEY (album_id) REFERENCES albums(id),
    FOREIGN KEY (artist_id) REFERENCES artists(id)
);

CREATE TABLE r_albums_tracks(
    album_id INT,
    track_id INT,
    PRIMARY KEY(album_id, track_id),
    FOREIGN KEY (album_id) REFERENCES albums(id),
    FOREIGN KEY (track_id) REFERENCES tracks(id)
);

CREATE TABLE r_artist_genre(
    genre_name VARCHAR(255),  
    artist_id INT,
    PRIMARY KEY(genre_name, artist_id),
    FOREIGN KEY (genre_name) REFERENCES genres(name),
    FOREIGN KEY (artist_id) REFERENCES artists(id)
);

CREATE TABLE r_track_artist(
    track_id INT,
    artist_id INT,
    PRIMARY KEY(track_id, artist_id),
    FOREIGN KEY (track_id) REFERENCES tracks(id),
    FOREIGN KEY (artist_id) REFERENCES artists(id)
);