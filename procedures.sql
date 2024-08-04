--- Adding a New Booking
DELIMITER $$
CREATE PROCEDURE AddBooking(IN p_flight_id INT, IN p_passenger_id INT, IN p_booking_date DATE, IN p_seat_number VARCHAR(10))
BEGIN
    INSERT INTO bookings (flight_id, passenger_id, booking_date, seat_number) 
    VALUES (p_flight_id, p_passenger_id, p_booking_date, p_seat_number);
END$$
DELIMITER ;

--- Updating Flight Price
DELIMITER $$
CREATE PROCEDURE UpdateFlightPrice(IN p_flight_id INT, IN p_new_price DECIMAL(10, 2))
BEGIN
    UPDATE flights 
    SET price = p_new_price 
    WHERE flight_id = p_flight_id;
END$$
DELIMITER ;

--- Check Available Seats
DELIMITER $$
CREATE PROCEDURE CheckAvailableSeats(IN p_flight_id INT)
BEGIN
    SELECT seat_number
    FROM bookings 
    WHERE flight_id = p_flight_id;
END$$
DELIMITER ;
