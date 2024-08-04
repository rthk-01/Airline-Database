INSERT INTO airports (airport_id, name, city, country, timezone) VALUES
(1, 'Airport A', 'City A', 'Country A', 'GMT+0'),
(2, 'Airport B', 'City B', 'Country B', 'GMT+1'),
(3, 'Airport C', 'City C', 'Country C', 'GMT+2'),
(4, 'Airport D', 'City D', 'Country D', 'GMT+3'),
(5, 'Airport E', 'City E', 'Country E', 'GMT+4');


INSERT INTO bookings (booking_id, flight_id, passenger_id, booking_date, seat_number) VALUES
(1, 1, 1, '2023-06-25', 'A1'),
(2, 2, 2, '2023-06-26', 'B2'),
(3, 3, 3, '2023-06-27', 'C3'),
(4, 4, 4, '2023-06-28', 'D4'),
(5, 5, 5, '2023-06-29', 'E5');


INSERT INTO flights (flight_id, airline, source, destination, departure_time, arrival_time, duration, price) VALUES
(1, 'AirLine A', 'City A', 'City B', '2023-06-27 08:00:00', '2023-06-27 10:00:00', 120, 250.00),
(2, 'AirLine B', 'City A', 'City D', '2023-06-28 14:30:00', '2023-06-28 16:30:00', 120, 180.50),
(3, 'AirLine C', 'City A', 'City C', '2023-06-29 12:00:00', '2023-06-29 14:00:00', 120, 320.75),
(4, 'AirLine A', 'City A', 'City D', '2023-06-30 16:00:00', '2023-06-30 18:00:00', 120, 200.00),
(5, 'AirLine B', 'City D', 'City E', '2023-07-01 09:30:00', '2023-07-01 11:30:00', 120, 150.50);


INSERT INTO passengers (passenger_id, first_name, last_name, email, phone_number) VALUES
(1, 'John', 'Doe', 'johndoe@example.com', '123-456-7890'),
(2, 'Jane', 'Smith', 'janesmith@example.com', '987-654-3210'),
(3, 'Michael', 'Johnson', 'michaeljohnson@example.com', '456-789-0123'),
(4, 'Emily', 'Brown', 'emilybrown@example.com', '789-012-3456'),
(5, 'Daniel', 'Taylor', 'danieltaylor@example.com', '012-345-6789');
