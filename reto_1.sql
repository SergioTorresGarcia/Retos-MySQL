CREATE DATABASE reto1;

CREATE TABLE users(
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(40),
    email VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT current_timestamp,
    updated_at TIMESTAMP DEFAULT current_timestamp ON UPDATE  current_timestamp
);

CREATE TABLE lists(
	id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(40) NOT NULL,
    description VARCHAR(200),
    user_id INT,  -- el que crea la lista
    created_at TIMESTAMP DEFAULT current_timestamp,
    updated_at TIMESTAMP DEFAULT current_timestamp ON UPDATE  current_timestamp,
    
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE tasks(
	id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(40) NOT NULL,
    description VARCHAR(200),
    user_id INT,  -- más UNIQUE si es una relación de 'uno a uno'
    list_id INT,  -- más UNIQUE si es una relación de 'uno a uno'
    status ENUM('pending', 'in_process', 'done'),
    created_at TIMESTAMP DEFAULT current_timestamp,
    updated_at TIMESTAMP DEFAULT current_timestamp ON UPDATE  current_timestamp,
    
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (list_id) REFERENCES lists(id)
);

CREATE TABLE list_user(
	id INT AUTO_INCREMENT PRIMARY KEY,
    list_id INT,
    user_id INT,
    created_at TIMESTAMP DEFAULT current_timestamp,
    updated_at TIMESTAMP DEFAULT current_timestamp ON UPDATE  current_timestamp,
    
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (list_id) REFERENCES lists(id)
);
