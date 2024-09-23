--q4.1
/* no, because we still have VA records in the other tables */

--q4.2
/* no, because no state has / fips of 80*/

--4.3
/* Pretty good, not the best, could be improved */

--4.5
/* yes, perfect */ 

--4.6
-- Step 1: Find the most recent year from the income table
WITH recent_year AS (
    SELECT MAX(year) AS latest_year
    FROM income
)

-- Step 2: Find the state with the highest income in the most recent year
SELECT n.name, i.income, i.year
FROM income i
JOIN name n ON i.fips = n.fips
JOIN recent_year r ON i.year = r.latest_year
ORDER BY i.income DESC
LIMIT 1;

/* it works */ 


--4.7
-- Step 1: Get population data for Virginia for the past 5 years
WITH va_population AS (
    SELECT year, pop
    FROM population
    WHERE fips = '51'
    ORDER BY year DESC
    LIMIT 6
)

-- Step 2: Calculate the population growth rate for each year
SELECT 
    curr.year AS current_year,
    prev.year AS previous_year,
    curr.pop AS current_population,
    prev.pop AS previous_population,
    ROUND(((curr.pop - prev.pop) * 100.0) / prev.pop, 2) AS growth_rate_percentage
FROM va_population curr
JOIN va_population prev ON curr.year = prev.year + 1
ORDER BY curr.year DESC;

/* I modified the promt to give a more accuate guidance and address the problem with accurancy */

--4.8
/* no, it does not always have an accurate response to the promts. Oftentime the code is not correct or ChatGPT misunderstood what I prompted.

