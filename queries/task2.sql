SELECT country,
business_type,
singup_process_type,
COUNT(a.id_business),
SUM(ride_value)

FROM Freenow_Business_Customer a
LEFT JOIN Freenow_Business_Customer_Activity b ON a.id_business = b.id_business
GROUP BY country,
business_type,
singup_process_type

ORDER BY country,
business_type,
singup_process_type, SUM(ride_value)
