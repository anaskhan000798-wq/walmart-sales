SELECT 
    Unemployment,
    AVG(weekly_sales)
FROM walmartt
GROUP BY Unemployment
ORDER BY Unemployment;

SELECT 
    Fuel_Price,
    AVG(weekly_sales)
FROM walmartt
GROUP BY Fuel_Price
ORDER BY Fuel_Price;

SELECT 
    cpi,
    AVG(weekly_sales)
FROM walmartt
GROUP BY cpi
ORDER BY cpi;


select Extract(year from date) as year, sum(weekly_sales) as totalsales
from walmartt
group by year
order by totalsales desc
limit 1;


SELECT 
    EXTRACT(year from date) as year,
    SUM(weekly_sales) as totalsales
FROM walmartt
GROUP BY year
ORDER BY totalsales desc
limit 1;

SELECT 
    EXTRACT(YEAR FROM date) AS year,
    AVG(temperature) AS avg_temp,
    MIN(temperature) AS min_temp,
    MAX(temperature) AS max_temp
FROM walmartt
WHERE EXTRACT(YEAR FROM date) = (
    SELECT EXTRACT(YEAR FROM date)
    FROM walmartt
    GROUP BY EXTRACT(YEAR FROM date)
    ORDER BY SUM(weekly_sales) DESC
    LIMIT 1
)
GROUP BY year;