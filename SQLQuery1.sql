

--What is the average close value of deals across different sectors?
SELECT sector, AVG(close_value) AS avg_close_value
FROM accounts AS a
LEFT JOIN Sales_pipeline AS s
ON a.account= s.account
GROUP BY sector

--How does the close value of deals vary between companies of different sizes (based on employee count)?
SELECT a.sector, COUNT(a.Employees) AS Num_employee, 
AVG(s.close_value) AS avg_close_value
FROM accounts AS a
LEFT JOIN Sales_pipeline AS s
ON a.account= s.account
GROUP BY a.sector

--Which product series has generated the highest total revenue from closed deals?

SELECT p.product, SUM(s.close_value) AS total_close_value, SUM(a.revenue) AS total_account_revenue
FROM products AS p
 JOIN sales_pipeline AS s ON p.product = s.product
JOIN accounts AS a ON s.account = a.account
GROUP BY p.product;

--How does the revenue of a company correlate with the average deal size they close?
WITH corr_revenue AS (
SELECT AVG(a.revenue) AS Avg_revenue,
AVG(s.Close_value) AS avg_close_value
FROM accounts AS a
JOIN Sales_pipeline AS s
ON a.account = s.account
)
SELECT *
FROM corr_revenue

--Which sales agent has closed the most deals in the technology sector?
WITH sale_agent_Most_deal AS (
SELECT SA.sales_agent,
COUNT(s.close_date) AS Close_deal
FROM Sales_teams AS SA
LEFT JOIN sales_pipeline AS s
ON SA.sales_agent = s.sales_agent
WHERE s.close_date IS NOT NULL
GROUP BY SA.sales_agent
)
SELECT *
FROM sale_agent_Most_deal
ORDER BY Close_deal DESC;

--What is the relationship between the sales price of a product and the close value of deals in which it was involved?
WITH corr_Product AS (
SELECT AVG(p.sales_price) AS Avg_sales_price,
AVG(s.Close_value) AS avg_close_value
FROM products AS p
LEFT JOIN Sales_pipeline AS s
ON p.product = s.product
)
SELECT *
FROM corr_Product

SELECT p.sales_price, AVG(DATEDIFF(DAY,sp.close_date, sp.engage_date)) AS avg_closure_time
FROM sales_pipeline sp
JOIN products p ON sp.product = p.product
GROUP BY p.sales_price;

--How does the number of employees in a company impact the success rate (Won vs. Lost) of its deals?
SELECT SUM(employees) AS num_employees,
deal_stage
FROM accounts AS a
LEFT JOIN sales_pipeline AS s
ON a.account = s.account
GROUP BY deal_stage

--Which accounts have the highest close values, and what are their primary sectors?
SELECT a.account AS Name_account, 
sector,
SUM(Close_value)AS total_close_value
FROM accounts AS a
LEFT JOIN sales_pipeline AS s
ON a.account = s.account
GROUP BY a.account, sector
ORDER BY total_close_value DESC;

--What is the average time taken to close deals in different sectors?
SELECT sector,
AVG(DATEDIFF(HOUR, engage_date, close_date)) AS avg_time_close_deal
FROM accounts AS a
LEFT JOIN sales_pipeline AS s
ON a.account = s.account
GROUP BY sector
How do deal closure times vary between products with different sales prices?
--Which sales agent has the highest average deal value in the medical sector?
SELECT sp.sales_agent, AVG(sp.close_value) AS avg_close_value
FROM sales_pipeline sp
JOIN accounts a ON sp.account = a.account
WHERE a.sector = 'medical'
GROUP BY sp.sales_agent
ORDER BY avg_close_value DESC

--What is the distribution of deal stages for accounts in the retail sector?
SELECT sp.deal_stage, COUNT(*) AS count
FROM sales_pipeline sp
JOIN accounts a ON sp.account = a.account
WHERE a.sector = 'retail'
GROUP BY sp.deal_stage;

--How does the year a company was established affect its success rate in closing deals?
SELECT year_established, deal_stage, COUNT(*)AS count
FROM accounts AS a
LEFT JOIN sales_pipeline AS s
ON a.account = s.account
GROUP BY year_established, deal_stage

--Which product has the highest number of closed deals, and what is its average close value?

WITH product_Most_deal AS (
SELECT p.product,
COUNT(s.close_date) AS Close_deal,
AVG(close_value)AS avg_close_value
FROM products AS p
 JOIN sales_pipeline AS s
ON p.product = s.product
WHERE s.close_date IS NOT NULL
GROUP BY p.product
)
SELECT *
FROM product_Most_deal
ORDER BY Close_deal DESC;

--How does the close value of deals differ between subsidiary companies and independent companies?
SELECT subsidiary_of,
SUM(close_value) AS total_close_value
FROM dbo.accounts AS a
LEFT JOIN sales_pipeline AS s
ON a.account =s.account
WHERE subsidiary_of IS NOT NULL 
GROUP BY subsidiary_of
--What is the average close value for deals involving products from the GTX series?
SELECT p.product,
series,
AVG(close_value) AS avg_close_Value
FROM products AS p
LEFT JOIN sales_pipeline AS s
ON p.product = s.product
GROUP BY p.product,series;

--Which office location has the highest total close value of deals?
SELECT office_location,
SUM(close_value) AS total_close
FROM accounts AS a
LEFT JOIN sales_pipeline AS s
ON a.account = s.account
GROUP BY office_location
ORDER BY total_close DESC;

--How does the deal stage distribution vary across different sectors?
SELECT deal_stage, COUNT(*) AS num,
sector
FROM sales_pipeline AS s
RIGHT JOIN accounts AS a
ON s.account = a.account
GROUP BY deal_stage, sector;

--What is the total close value of deals for companies established before the year 2000?
SELECT SUM(close_value) AS Total_close_value,
a.account 
FROM sales_pipeline AS s
RIGHT JOIN accounts AS a
ON s.account = a.account
WHERE year_established < 2000
GROUP BY a.account;

--Which product has the highest close value in deals involving companies in the software sector?
SELECT p.product, 
SUM(close_value) AS total_close_value
FROM products AS p
LEFT JOIN sales_pipeline AS s
ON p.product = s.product
LEFT JOIN accounts AS a
ON s.account = a.account
WHERE sector = 'software'
GROUP BY p.product;

--How do the close values of deals compare between companies with different revenue ranges?
SELECT a.revenue, AVG(sp.close_value) AS avg_close_value
FROM sales_pipeline sp
JOIN accounts a ON sp.account = a.account
GROUP BY a.revenue;

--What is the impact of office location on the success rate of deals?
SELECT a.office_location, sp.deal_stage, COUNT(*) AS count
FROM sales_pipeline sp
JOIN accounts a ON sp.account = a.account
GROUP BY a.office_location, sp.deal_stage;

--Which sales agent has the highest total close value for deals involving the MG series products?
SELECT SA.sales_agent, 
SUM(close_value) AS total_close_value
FROM sales_teams AS SA
LEFT JOIN sales_pipeline AS s
ON SA.sales_agent = s.sales_agent
RIGHT JOIN products AS p
ON s.product = p.product
WHERE series = 'MG'
GROUP BY SA.sales_agent;

--How does the average close value of deals vary between different office locations?
SELECT a.office_location, AVG(sp.close_value) AS avg_close_value
FROM sales_pipeline sp
JOIN accounts a ON sp.account = a.account
GROUP BY a.office_location;

--What is the relationship between the number of employees in a company and the sales price of the products they deal in?
SELECT a.employees, sales_price, COUNT(*) AS num
FROM accounts AS a
LEFT JOIN sales_pipeline AS s
ON a.account = s.account
RIGHT JOIN products AS p
ON s.product = p.product
GROUP BY a.employees, sales_price;

--Which subsidiary companies have the highest close values, and in what sectors do they operate?
SELECT a.account, a.sector, SUM(sp.close_value) AS total_close_value, a.subsidiary_of
FROM sales_pipeline sp
JOIN accounts a ON sp.account = a.account
WHERE a.subsidiary_of IS NOT NULL
GROUP BY a.account, a.sector, a.subsidiary_of
ORDER BY total_close_value DESC

--How does the average deal closure time differ between sectors?
SELECT a.sector, AVG(DATEDIFF(DAY, sp.engage_date, close_date)) AS avg_closure_time
FROM sales_pipeline sp
JOIN accounts a ON sp.account = a.account
GROUP BY a.sector;

--What is the total close value for deals involving products with sales prices above $1000?
SELECT p.product, 
SUM(close_value) AS Total_value
FROM products AS p
JOIN sales_pipeline AS s
ON p.product = s.product
WHERE sales_price > 1000
GROUP BY p.product;

--Which account has the highest close value in deals involving products from the GTX series, and what is its sector?
SELECT a.account, a.sector, SUM(sp.close_value) AS total_close_value
FROM sales_pipeline sp
JOIN accounts a ON sp.account = a.account
JOIN products p ON sp.product = p.product
WHERE p.series = 'GTX'
GROUP BY a.account, a.sector
ORDER BY total_close_value DESC;

