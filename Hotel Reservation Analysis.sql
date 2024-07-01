-- Loading the dataset
SELECT * FROM hotel_reservation_db.hotelreservationdataset;

-- Total number of reservations in the dataset:
SELECT COUNT(*) AS total_reservations
FROM hotelreservationdataset;

-- Most popular meal plan among guests:
SELECT type_of_meal_plan, COUNT(*) AS count
FROM hotelreservationdataset
GROUP BY type_of_meal_plan
ORDER BY count DESC
LIMIT 1;

-- Average price per room for reservations involving children:
SELECT AVG(avg_price_per_room) AS avg_price_per_room
FROM hotelreservationdataset
WHERE no_of_children > 0;

-- Number of reservations made for the year 2018:
SELECT COUNT(*) AS reservations_2018
FROM hotelreservationdataset
WHERE YEAR(STR_TO_DATE(arrival_date, '%d-%m-%Y')) = 2018;

-- Most commonly booked room type:
SELECT room_type_reserved, COUNT(*) AS count
FROM hotelreservationdataset
GROUP BY room_type_reserved
ORDER BY count DESC
LIMIT 1;

-- Number of reservations falling on a weekend:
SELECT COUNT(*) AS weekend_reservations
FROM hotelreservationdataset
WHERE no_of_weekend_nights > 0;

-- Highest and lowest lead time for reservations:
SELECT MAX(lead_time) AS highest_lead_time, MIN(lead_time) AS lowest_lead_time
FROM hotelreservationdataset;

-- Most common market segment type for reservations:
SELECT market_segment_type, COUNT(*) AS count
FROM hotelreservationdataset
GROUP BY market_segment_type
ORDER BY count DESC
LIMIT 1;

-- Number of reservations with a booking status of "Confirmed":
SELECT COUNT(*) AS confirmed_reservations
FROM hotelreservationdataset
WHERE booking_status = 'Not_Canceled';

-- Total number of adults and children across all reservations:
SELECT SUM(no_of_adults) AS total_adults, SUM(no_of_children) AS total_children
FROM hotelreservationdataset;

-- Average number of weekend nights for reservations involving children:
SELECT AVG(no_of_weekend_nights) AS avg_weekend_nights
FROM hotelreservationdataset
WHERE no_of_children > 0;

-- Number of reservations made in each month of the year:
SELECT MONTH(STR_TO_DATE(arrival_date, '%d-%m-%Y')) AS month, COUNT(*) AS reservations_count
FROM hotelreservationdataset
GROUP BY month
ORDER BY month;

-- Average number of nights (both weekend and weekday) spent by guests for each room type:
SELECT room_type_reserved, 
       AVG(no_of_weekend_nights + no_of_week_nights) AS avg_total_nights
FROM hotelreservationdataset
GROUP BY room_type_reserved;

-- Most common room type and average price for reservations involving children:
SELECT room_type_reserved, 
       COUNT(*) AS count, 
       AVG(avg_price_per_room) AS avg_price_per_room
FROM hotelreservationdataset
WHERE no_of_children > 0
GROUP BY room_type_reserved
ORDER BY count DESC
LIMIT 1;

-- Market segment type generating the highest average price per room:
SELECT market_segment_type, 
       AVG(avg_price_per_room) AS avg_price_per_room
FROM hotelreservationdataset
GROUP BY market_segment_type
ORDER BY avg_price_per_room DESC
LIMIT 1;
