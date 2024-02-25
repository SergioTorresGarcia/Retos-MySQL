
CREATE DATABASE IF NOT EXISTS reto6;
USE reto6;

CREATE TABLE users(
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(40) NOT NULL,
    surname VARCHAR(40) NOT NULL,
    email VARCHAR(50) NOT NULL UNIQUE,
    phone INT NOT NULL,
    password VARCHAR(255) NOT NULL,
    is_active BOOLEAN DEFAULT TRUE,
    points INT DEFAULT 0,
    created_at TIMESTAMP DEFAULT current_timestamp
);


CREATE TABLE bookings(
	id INT AUTO_INCREMENT PRIMARY KEY,
	
    user_id INT NOT NULL,
    booked_at TIMESTAMP DEFAULT current_timestamp,
	stop_over INT DEFAULT 0,
    check_in_luggage BOOLEAN DEFAULT FALSE,
    has_priority BOOLEAN DEFAULT FALSE,
    special_needs VARCHAR(200),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE flights(
	id INT AUTO_INCREMENT PRIMARY KEY,
    origin VARCHAR(20) NOT NULL,
    destination VARCHAR(20) NOT NULL,
    date TIMESTAMP,
    duration INT NOT NULL,
	class ENUM('economy', 'business', 'first-class'),
    booking_id INT NOT NULL,
    FOREIGN KEY (booking_id) REFERENCES bookings(id)
);

CREATE TABLE notifications(
	id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    booking_id INT NOT NULL,
    message VARCHAR(500),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (booking_id) REFERENCES bookings(id)
);

