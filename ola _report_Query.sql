create database ola;
use ola;
#retrive all succesfull bookings

create view Successful_Booking as
select * from bookings
where Booking_Status='Success';

select * from Successful_Booking;

1#FIND THE AVERAGE RIDE DISTANCE FOR EACH VEHICLE TYPE
  
create view ride_distance_for_each_vehicle as
select Vehicle_Type, avg(Ride_Distance) as 
avg_distance from bookings
group by Vehicle_Type;

select * from ride_distance_for_each_vehicle;

2#get the total no of cancelled rides by customers:
create view canceled_rides_by_customer as
select count(*) from bookings as total
where Booking_Status='Canceled by customer';
select * from canceled_rides_by_customer;

3#list top 5 customer who book the highest number of rides
create view Top_5customers as
select Customer_ID, count(Booking_ID) as total_rides
from bookings
group by Customer_ID
order by total_rides desc limit 5;
select * from Top_5customers;

4#get the number of rides cancelled by drivers due to personal and car related issue
create view rides_cancelled_by_drivers as
select count(*) from bookings
where Canceled_Rides_by_Driver='Personal & Car related issue';
select * from rides_cancelled_by_drivers;

5#find the maximum and minimum driver ratings for prime sedan bookings:
create view max_min_driver_rating as
select max(Driver_Ratings) as max_rating,
min(Driver_Ratings) as min_rating
from bookings where Vehicle_Type='Prime Sedan';
select * from max_min_driver_rating;

6#retrive all rides where payments was made using upi
select * from bookings
where Payment_Method='UPI';

7#find average customer rating per vehicle type:
select Vehicle_Type, avg(Customer_Rating) as avg_customer_rating
from bookings
group by Vehicle_Type;

8#calculate the booking value of rides completed successfully
select sum(Booking_Value) as total_successfull_value
from bookings
where Booking_Status='Success';

9#list all incomplete rides along with the reason:
select Booking_ID, Incomplete_Rides_Reason 
from bookings
where incomplete_Rides='Yes';
