
CREATE DATABASE IF NOT EXISTS reto9;
USE reto9;

CREATE TABLE users(
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(40) NOT NULL,
    email VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    genre ENUM ('male', 'female', 'prefer not to answer') NOT NULL,
    looking_for ENUM('male', 'female', 'both', 'any'),
    age INT,
    status ENUM('single', 'in a relationship', 'married'),
    location VARCHAR(30),
    description VARCHAR(300),
    picture BLOB,
    created_at TIMESTAMP DEFAULT current_timestamp
);

CREATE TABLE messages(
	id INT AUTO_INCREMENT PRIMARY KEY,
    user_from INT NOT NULL,
    user_to INT NOT NULL,
    time TIMESTAMP DEFAULT current_timestamp,
	message VARCHAR(500),
    FOREIGN KEY (user_from) REFERENCES users(id),
    FOREIGN KEY (user_to) REFERENCES users(id)
);


CREATE TABLE dates(
	id INT AUTO_INCREMENT PRIMARY KEY,
    user_proposing INT NOT NULL,
    user_accepting INT NOT NULL,
    time TIMESTAMP NOT NULL,
    location VARCHAR(100) NOT NULL,
	comment VARCHAR(300),
    FOREIGN KEY (user_proposing) REFERENCES users(id),
    FOREIGN KEY (user_accepting) REFERENCES users(id)
);

CREATE TABLE comments(
	id INT AUTO_INCREMENT PRIMARY KEY,
    user_commenting INT NOT NULL,
    user_commented INT NOT NULL,
	comment VARCHAR(500),
    score INT,
    created_at TIMESTAMP DEFAULT current_timestamp NOT NULL,
    FOREIGN KEY (user_commenting) REFERENCES users(id),
    FOREIGN KEY (user_commented) REFERENCES users(id)
);

