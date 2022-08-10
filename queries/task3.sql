WITH cte_1  AS  (
SELECT bc.id_business, 
bc.signup_date,
business_type,
method,
MIN(date(ce.invite_date))  AS first_invite,
MIN(date(ce.connection_date))  AS first_connect
FROM "Freenow_Business_Customer" bc
LEFT JOIN Freenow_Business_Customer_employees ce ON bc.id_business = ce.id_business


GROUP BY  bc.id_business, bc.signup_date,business_type,method
)
SELECT business_type, method, 
avg(julianday(first_invite) - julianday(signup_date))  AS days_to_invite, 
avg( julianday(first_connect) - julianday(signup_date))  AS days_to_connect 
FROM cte_1 GROUP BY business_type, method