
CREATE DATABASE IF NOT EXISTS reto7;
USE reto7;

CREATE TABLE users(
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(40) NOT NULL,
    surname VARCHAR(40) NOT NULL,
    email VARCHAR(50) NOT NULL UNIQUE,
    phone INT NOT NULL,
    password VARCHAR(255) NOT NULL,
    is_seller BOOLEAN DEFAULT FALSE,
    rating FLOAT,
    created_at TIMESTAMP DEFAULT current_timestamp
);

CREATE TABLE transactions(
	id INT AUTO_INCREMENT PRIMARY KEY,
    seller_id INT NOT NULL,
    buyer_id INT NOT NULL,
    bought_at TIMESTAMP DEFAULT current_timestamp,
	payment ENUM('card', 'transfer', 'paypal', 'bizum', 'PAD'),
    comments VARCHAR(200),
    class ENUM('booked', 'paid', 'on_delivery', 'delivered'),
    FOREIGN KEY (seller_id) REFERENCES users(id),
    FOREIGN KEY (buyer_id) REFERENCES users(id)
);


CREATE TABLE items(
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    description VARCHAR(200),
    transaction_id INT NOT NULL,
    price INT NOT NULL,
    FOREIGN KEY (transaction_id) REFERENCES transactions(id)
);

CREATE TABLE reviews(
	id INT AUTO_INCREMENT PRIMARY KEY,
    item_id INT NOT NULL,
    seller_id INT NOT NULL,
    buyer_id INT NOT NULL,
    score INT NOT NULL,
    review_text VARCHAR(500),
    FOREIGN KEY (item_id) REFERENCES items(id),
    FOREIGN KEY (seller_id) REFERENCES users(id),
    FOREIGN KEY (buyer_id) REFERENCES users(id)
);

