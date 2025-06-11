DROP DATABASE ONLINE_FOOD;

CREATE DATABASE ONLINE_FOOD;

USE ONLINE_FOOD;


CREATE TABLE `customers`(
    `customer_id` INT PRIMARY KEY,
    `first_name` VARCHAR(255) NOT NULL,
    `middle_name` VARCHAR(255) NOT NULL,
    `last_name` VARCHAR(255) NOT NULL,
    `birthdate` DATE NOT NULL,
    `phone` INT NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `city` VARCHAR(255) NOT NULL,
    `town` VARCHAR(255) NOT NULL,
    `street` VARCHAR(255) NOT NULL
);
CREATE TABLE `employees`(
    `employee_id` INT PRIMARY KEY,
    `first_name` VARCHAR(255) NOT NULL,
    `middle_name` VARCHAR(255) NOT NULL,
    `last_name` VARCHAR(255) NOT NULL,
    `birthdate` DATE NOT NULL,
    `phone` INT NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `city` VARCHAR(255) NOT NULL,
    `town` VARCHAR(255) NOT NULL,
    `street` VARCHAR(255) NOT NULL,
    `paid_hours` INT NOT NULL,
    `salary` INT NOT NULL
);
CREATE TABLE `restaurants`(
    `restaurant_id` INT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL,
    `city` VARCHAR(255) NOT NULL,
    `town` VARCHAR(255) NOT NULL,
    `street` VARCHAR(255) NOT NULL,
    `open_hour` TIME NOT NULL,
    `close_hour` TIME NOT NULL
);
CREATE TABLE `delivery_persons`(
    `delivery_person_id` INT PRIMARY KEY,
    `first_name` VARCHAR(255) NOT NULL,
    `middle_name` VARCHAR(255) NOT NULL,
    `last_name` VARCHAR(255) NOT NULL,
    `birthdate` DATE NOT NULL,
    `phone` INT NOT NULL,
    `city` VARCHAR(255) NOT NULL,
    `town` VARCHAR(255) NOT NULL,
    `street` VARCHAR(255) NOT NULL,
    `paid_hours` INT NOT NULL,
    `salary` INT NOT NULL,
    `vehicle` VARCHAR(255) NOT NULL
);
CREATE TABLE `meals`(
    `meal_id` INT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL,
    `type` VARCHAR(255) NOT NULL,
    `price` INT NOT NULL,
    `amount` INT NOT NULL
);
CREATE TABLE `orders`(
    `order_id` INT PRIMARY KEY,
    `customer_id` INT NOT NULL,
    `delivery_person_id` INT NOT NULL,
    `restaurant_id` INT NOT NULL,
    `date` DATETIME NOT NULL,
    `price_before_discount` INT NOT NULL,
    `discount` INT NOT NULL,
    `payment_method` VARCHAR(255) NOT NULL,
    FOREIGN KEY(`customer_id`) REFERENCES `customers`(`customer_id`),
    FOREIGN KEY(`delivery_person_id`) REFERENCES `delivery_persons`(`delivery_person_id`),
    FOREIGN KEY(`restaurant_id`) REFERENCES `restaurants`(`restaurant_id`)
);
CREATE TABLE `orders_meals`(
    `order_id` INT NOT NULL,
    `meal_id` INT NOT NULL,
    `amount` INT NOT NULL,
    PRIMARY KEY(`order_id`, `meal_id`),
    FOREIGN KEY(`order_id`) REFERENCES `orders`(`order_id`),
    FOREIGN KEY(`meal_id`) REFERENCES `meals`(`meal_id`)
);