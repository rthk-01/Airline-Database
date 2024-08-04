CREATE TABLE airports (
    airport_id INT PRIMARY KEY,
    name VARCHAR(255),
    city VARCHAR(255),
    country VARCHAR(255),
    timezone VARCHAR(255)
);


CREATE TABLE bookings (
    booking_id INT PRIMARY KEY,
    flight_id INT,
    passenger_id INT,
    booking_date DATE,
    seat_number VARCHAR(10),
    FOREIGN KEY (flight_id) REFERENCES flights(flight_id),
    FOREIGN KEY (passenger_id) REFERENCES passengers(passenger_id)
);


CREATE TABLE flights (
    flight_id INT PRIMARY KEY,
    airline VARCHAR(255),
    source VARCHAR(255),
    destination VARCHAR(255),
    departure_time DATETIME,
    arrival_time DATETIME,
    duration INT,
    price DECIMAL(10, 2)
);


CREATE TABLE passengers (
    passenger_id INT PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    email VARCHAR(255),
    phone_number VARCHAR(20)
);
