

CREATE DATABASE reto2;
USE reto2;

CREATE TABLE users(
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(40) NOT NULL,
    surname VARCHAR(40) NOT NULL,
    email VARCHAR(50) NOT NULL UNIQUE,
    phone INT,
    password VARCHAR(255) NOT NULL,
    points INT DEFAULT 0,
    created_at TIMESTAMP DEFAULT current_timestamp,
    updated_at TIMESTAMP DEFAULT current_timestamp ON UPDATE  current_timestamp
);

CREATE TABLE restaurants(
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    description VARCHAR(200),
    is_open BOOLEAN DEFAULT TRUE,
    rating FLOAT,
    created_at TIMESTAMP DEFAULT current_timestamp,
    updated_at TIMESTAMP DEFAULT current_timestamp ON UPDATE  current_timestamp
);

CREATE TABLE bookings(
	id INT AUTO_INCREMENT PRIMARY KEY,
    date_hour TIMESTAMP NOT NULL,
    num_persons INT NOT NULL,
    any_comment VARCHAR(200),
    user_id INT,
    restaurant_id INT,
    created_at TIMESTAMP DEFAULT current_timestamp,
    updated_at TIMESTAMP DEFAULT current_timestamp ON UPDATE  current_timestamp,
    has_reviewed BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (restaurant_id) REFERENCES restaurants(id)
);

CREATE TABLE reviews(
	id INT AUTO_INCREMENT PRIMARY KEY,
    comment VARCHAR(500),
    score INT NOT NULL,
    user_id INT,
    restaurant_id INT,
    booking_id INT,
    created_at TIMESTAMP DEFAULT current_timestamp,
    updated_at TIMESTAMP DEFAULT current_timestamp ON UPDATE  current_timestamp,
    
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (restaurant_id) REFERENCES restaurants(id),
    FOREIGN KEY (booking_id) REFERENCES bookings(id)
);
