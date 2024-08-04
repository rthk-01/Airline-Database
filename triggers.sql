--- Trigger to Update Booking date
DELIMITER $$
CREATE TRIGGER BeforeInsertBooking
BEFORE INSERT ON bookings
FOR EACH ROW
BEGIN
    SET NEW.booking_date = NOW();
END$$
DELIMITER ;

--- Trigger to Prevent Booking for Past Flights
DELIMITER $$
CREATE TRIGGER CheckFlightDateBeforeBooking
BEFORE INSERT ON bookings
FOR EACH ROW
BEGIN
    DECLARE flightDate DATETIME;

    SELECT departure_time INTO flightDate
    FROM flights
    WHERE flight_id = NEW.flight_id;

    IF flightDate < NOW() THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot book a flight that has already departed.';
    END IF;
END $$
DELIMITER ;

--- Trigger to Update Flight Duration
DELIMITER $$
CREATE TRIGGER UpdateFlightDuration
BEFORE UPDATE ON flights
FOR EACH ROW
BEGIN
    IF OLD.departure_time <> NEW.departure_time OR OLD.arrival_time <> NEW.arrival_time THEN
        SET NEW.duration = TIMESTAMPDIFF(MINUTE, NEW.departure_time, NEW.arrival_time);
    END IF;
END$$
DELIMITER ;

--- Trigger to Log Changes to Flight Prices
CREATE TABLE price_changes (
    change_id INT AUTO_INCREMENT PRIMARY KEY,
    flight_id INT,
    old_price DECIMAL(10, 2),
    new_price DECIMAL(10, 2),
    change_date DATETIME,
    FOREIGN KEY (flight_id) REFERENCES flights(flight_id)
);
DELIMITER $$
CREATE TRIGGER LogPriceChange
AFTER UPDATE ON flights
FOR EACH ROW
BEGIN
    IF OLD.price <> NEW.price THEN
        INSERT INTO price_changes (flight_id, old_price, new_price, change_date)
        VALUES (NEW.flight_id, OLD.price, NEW.price, NOW());
    END IF;
END$$
DELIMITER ;
