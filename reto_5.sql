
CREATE DATABASE IF NOT EXISTS reto5;
USE reto5;

CREATE TABLE users(
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(40) NOT NULL,
    surname VARCHAR(40) NOT NULL,
    email VARCHAR(50) NOT NULL UNIQUE,
    phone INT NOT NULL,
    password VARCHAR(255) NOT NULL,
    height INT NOT NULL,
    weight INT NOT NULL,
    BMI INT NOT NULL,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT current_timestamp
);

CREATE TABLE activities(
	id INT AUTO_INCREMENT PRIMARY KEY,
    type VARCHAR(40) NOT NULL,
    status ENUM('solo', 'with PT', 'group', 'class'),
    duration INT NOT NULL DEFAULT 30,
    user_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE trainings(
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(40) NOT NULL,
    type VARCHAR(40) NOT NULL,
    duration INT NOT NULL DEFAULT '30',
    intensity ENUM('light', 'average', 'hard', 'extreme') NOT NULL,
    need_equipment BOOLEAN DEFAULT FALSE,
    satisfaction INT NOT NULL,
    registered_at TIMESTAMP DEFAULT current_timestamp,
    user_id INT NOT NULL,
	FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE recommendations(
	id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    activity_id INT NOT NULL,
    note VARCHAR(200),
    suggested TIMESTAMP DEFAULT current_timestamp,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (activity_id) REFERENCES activities(id)
);

