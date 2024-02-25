
CREATE DATABASE IF NOT EXISTS reto8;
USE reto8;

CREATE TABLE users(
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(40) NOT NULL,
    surname VARCHAR(40) NOT NULL,
    email VARCHAR(50) NOT NULL UNIQUE,
    phone INT NOT NULL,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT current_timestamp
);

CREATE TABLE lists(
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    description VARCHAR(200),
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE films(
	id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(50) NOT NULL,
    genre ENUM('drama', 'comedy', 'horror', 'action', 'sci-fi', 'thriler/crime', 'documentary', 'other'),
    year INT NOT NULL,
    director VARCHAR(50) NOT NULL,
    cast VARCHAR(500) NOT NULL,
    plot VARCHAR(500) NOT NULL,
    list_id INT,
    FOREIGN KEY (list_id) REFERENCES lists(id)
);

CREATE TABLE reviews(
	id INT AUTO_INCREMENT PRIMARY KEY,
    film_id INT NOT NULL,
    user_id INT NOT NULL,
    score INT NOT NULL,
    review_text VARCHAR(500),
    created_at TIMESTAMP DEFAULT current_timestamp,
    FOREIGN KEY (film_id) REFERENCES films(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE recommendations(
	id INT AUTO_INCREMENT PRIMARY KEY,
    film_id INT NOT NULL,
    user_id INT NOT NULL,
    why_recommended ENUM('fav_genre', 'already_watched', 'popular'),
    FOREIGN KEY (film_id) REFERENCES films(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

