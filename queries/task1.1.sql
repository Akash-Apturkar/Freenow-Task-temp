SELECT bc.id_business, 
bc.signup_date,
MIN(ce.invite_date),
MIN(ce.connection_date),
MIN(ca.ride_date)
FROM "Freenow_Business_Customer" bc
LEFT JOIN Freenow_Business_Customer_employees ce ON bc.id_business = ce.id_business
LEFT JOIN Freenow_Business_Customer_Activity ca ON bc.id_business = ca.id_business
where bc.id_business = '207940'

GROUP BY  bc.id_business, bc.signup_date