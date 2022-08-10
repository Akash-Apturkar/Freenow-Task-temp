WITH cte_1 AS (
SELECT  a1.id_ride, a1.ride_value, SUM(a2.ride_value) as cum_sum

FROM (SELECT * FROM Freenow_Business_Customer_Activity where id_business = '207940')  a1
inner join  (SELECT * FROM Freenow_Business_Customer_Activity where id_business = '207940') a2 
ON a1.id_ride >= a2.id_ride

GROUP BY a1.id_ride,a1.ride_value
order by a1.id_ride
)
SELECT id_business,id_ride, ride_date AS date_100EUR_crossed 
FROM Freenow_Business_Customer_Activity 
where id_ride = (SELECT min(id_ride) FROM cte_1 WHERE cum_sum > 100 )

