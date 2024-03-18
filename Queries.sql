CREATE TABLE rent (
    zpid INT,
    streetAddress VARCHAR(255),
    zipcode VARCHAR(10),
    city VARCHAR(100),
    state VARCHAR(100),
    latitude DECIMAL(10, 8),
    longitude DECIMAL(11, 8),
    price DECIMAL(18, 2),
    bathrooms DECIMAL(5, 2),
    bedrooms INT,
    livingArea DECIMAL(18, 2),
    rentZestimate DECIMAL(18, 2),
    homeDetailUrl VARCHAR(255)
);

SELECT *
FROM rent;

-- Geographical distribution of properties and price
SELECT latitude, longitude, price
FROM rent;

-- Finding the average rent price for each city
SELECT
    city,
    ROUND(AVG(price), 2) AS AverageRentPrice
FROM
    rent
WHERE
    price IS NOT NULL
GROUP BY
    city
ORDER BY
    AverageRentPrice DESC;

-- Finding the average price for different groupings of houses based on size (sqft)
SELECT 
    CASE
        WHEN livingArea > 100 AND livingArea <= 500 THEN 'Small'
        WHEN livingArea > 500 AND livingArea <= 1000 THEN 'Medium'
        WHEN livingArea > 1000 AND livingArea <= 2000 THEN 'Large'
        WHEN livingArea > 2000 THEN 'Extra Large'
    END AS LivingAreaRange,
    ROUND(AVG(price), 2) AS AveragePrice  -- Round the average price to two decimal places
FROM 
    rent
WHERE
    livingArea BETWEEN 200 AND 5000 -- Removing any null values by filtering
GROUP BY 
    CASE
        WHEN livingArea > 100 AND livingArea <= 500 THEN 'Small'
        WHEN livingArea > 500 AND livingArea <= 1000 THEN 'Medium'
        WHEN livingArea > 1000 AND livingArea <= 2000 THEN 'Large'
        WHEN livingArea > 2000 THEN 'Extra Large'
    END
	ORDER BY averageprice DESC;

-- Finding the difference between the rent estimate from Zillow and the actual price of rent listed
SELECT
    rentZestimate AS RentZestimate,
    price AS ActualPrice,
    rentZestimate - price AS PriceDifference,
    ROUND(
		CASE
       	 	WHEN price <> 0 THEN
            	((rentZestimate - price) / price) * 100
        	ELSE
           		 0
    END,
	2
		 ) AS PercentDifference
FROM
    rent
WHERE
    rentZestimate IS NOT NULL
    AND price IS NOT NULL;
