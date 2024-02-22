
CREATE DATABASE IF NOT EXISTS reto4;
USE reto4;

CREATE TABLE products(
	id INT AUTO_INCREMENT PRIMARY KEY,
    ref_num INT NOT NULL UNIQUE,
    name VARCHAR(40) NOT NULL,
    size VARCHAR(40) NOT NULL,
    weight VARCHAR(40) NOT NULL,
    is_fragile BOOLEAN DEFAULT FALSE,
    tracking_id INT NOT NULL,
    in_stock BOOLEAN DEFAULT TRUE,
    registered_at TIMESTAMP DEFAULT current_timestamp,
    updated_at TIMESTAMP DEFAULT current_timestamp ON UPDATE  current_timestamp
);

CREATE TABLE trackings(
	id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    building VARCHAR(50) NOT NULL,
    shelf VARCHAR(20) NOT NULL,
    note VARCHAR(200),
    stock_status ENUM('low', 'ok', 'high'),
    ammount INT NOT NULL,
    on_trend BOOLEAN,
    in_need BOOLEAN
);

CREATE TABLE product_tracking(
	id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    tracking_id INT NOT NULL,
    
    FOREIGN KEY (product_id) REFERENCES products(id),
    FOREIGN KEY (tracking_id) REFERENCES trackings(id)
    );
    

CREATE TABLE orders(
	id INT AUTO_INCREMENT PRIMARY KEY,
    order_number TIMESTAMP NOT NULL,
    instructions VARCHAR(500),
    status ENUM('placed', 'in_progress', 'ready', 'dispatched'),
    placed_at TIMESTAMP DEFAULT current_timestamp,
    dispatched_at TIMESTAMP DEFAULT current_timestamp ON UPDATE  current_timestamp
);

CREATE TABLE order_product(
	id INT AUTO_INCREMENT PRIMARY KEY,
    description VARCHAR(200),
    product_id INT,
    order_id INT,

    FOREIGN KEY (product_id) REFERENCES products(id),
    FOREIGN KEY (order_id) REFERENCES orders(id)
);
