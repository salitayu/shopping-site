CREATE DATABASE shop;

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(150) NOT NULL,
    firstname VARCHAR(150) NULL,
    lastname VARCHAR(150) NULL,
    email VARCHAR(254) NULL,
    password VARCHAR(150) NULL,
    is_guest BOOLEAN NOT NULL,
    is_superuser BOOLEAN NOT NULL,
    last_login TIMESTAMP WITH TIME ZONE NOT NULL,
    date_joined TIMESTAMP WITH TIME ZONE NOT NULL
);

CREATE TABLE category (
    id SERIAL PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    description TEXT NOT NULL,
    slug VARCHAR(100) NOT NULL,
    image TEXT NOT NULL
);

CREATE TABLE stock (
    id SERIAL PRIMARY KEY,
    size VARCHAR(3) NULL,
    storage VARCHAR(3) NULL,
    quantity INTEGER NULL
);

CREATE TABLE item (
    id SERIAL PRIMARY KEY,
    category_id INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    stock_id INT NOT NULL,
    description TEXT NOT NULL,
    price NUMERIC NOT NULL,
    image TEXT NOT NULL,
    slug VARCHAR(100) NOT NULL,
    CONSTRAINT fk_category_item FOREIGN KEY(category_id) REFERENCES category(id),
    CONSTRAINT fk_stock_item FOREIGN KEY(stock_id) REFERENCES stock(id)
);

CREATE TABLE review (
    id SERIAL PRIMARY KEY,
    item_id INTEGER NOT NULL,
    rating FLOAT NOT NULL,
    title VARCHAR(150),
    message TEXT NULL,
    CONSTRAINT fk_review_item FOREIGN KEY(item_id) REFERENCES item(id)
);

CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users(id) NOT NULL,
    start_date TIMESTAMP WITH TIME ZONE NOT NULL,
    ordered_date TIMESTAMP WITH TIME ZONE NOT NULL,
    ordered BOOLEAN NOT NULL
);

CREATE TABLE order_item (
    id SERIAL PRIMARY KEY,
    order_id INTEGER REFERENCES orders(id),
    amount INTEGER NOT NULL,
    item_id INTEGER NOT NULL,
    CONSTRAINT fk_item_orderitem FOREIGN KEY(order_id) REFERENCES item(id)
);

CREATE TABLE user_details (
    id SERIAL PRIMARY KEY NOT NULL,
    user_id INTEGER REFERENCES users(id) NOT NULL,
    address_line1 VARCHAR(200) NOT NULL,
    address_line2 VARCHAR(200) NULL,
    city VARCHAR(100) NOT NULL,
    state VARCHAR(2) NOT NULL,
    zip VARCHAR(5) NOT NULL,
    phone VARCHAR(10) NOT NULL,
    email VARCHAR(254) NOT NULL,
    additional_info TEXT NOT NULL
);
