-- Aggregate Functions --

USE cinema_booking_system;

SHOW TABLES;

SELECT * FROM reserved_seat;

SELECT * FROM rooms;

SELECT SUM(no_seats) FROM rooms;

SELECT * FROM films;

SELECT name, MAX(length_min) FROM films;

SELECT  name, MIN(length_min) FROM films;

SELECT AVG(length_min) FROM films;

SELECT AVG(length_min) FROM films
WHERE length_min > 120;

SELECT COUNT(*) FROM bookings
WHERE customer_id = 10;

SELECT COUNT(*) FROM screenings s
JOIN films f on s.film_id = f.id
WHERE f.name = 'Blade Runner 2049';

SELECT COUNT(DISTINCT(customer_id)) FROM bookings;

SELECT * FROM bookings;

SELECT COUNT(id) FROM bookings;

SELECT customer_id, screening_id, COUNT(id) FROM bookings
GROUP BY customer_id, screening_id
ORDER BY customer_id;

SELECT f.name, s.start_time, c.first_name, c.last_name, COUNT(b.id) FROM films f
JOIN screenings s ON f.id = s.film_id
JOIN bookings b ON s.id = b.screening_id
JOIN customers c ON b.customer_id = c.id
GROUP BY f.name, c.last_name, c.first_name, s.start_time
ORDER BY s.start_time; 

SELECT * FROM bookings;

SELECT customer_id, screening_id, COUNT(id) FROM bookings
GROUP BY customer_id, screening_id
HAVING customer_id = 10;

SELECT b.customer_id, COUNT(rs.id) FROM bookings b
INNER JOIN reserved_seat rs ON b.id = rs.booking_id
GROUP BY b.customer_id; 

SELECT f.name, f.length_min, COUNT(s.id) FROM films f
INNER JOIN screenings s ON f.id = s.film_id
GROUP BY f.name, f.length_min
HAVING f.length_min > 120; 
