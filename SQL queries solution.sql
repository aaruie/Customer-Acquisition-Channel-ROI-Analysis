DROP TABLE marketing;

CREATE TABLE marketing (
    id INT,
	c_date DATE,
	campaign_name VARCHAR(100),
	category VARCHAR(50),
	campaign_id BIGINT,
	impressions INT,
	mark_spent NUMERIC(10, 2),
	clicks INT,
	leads INT,
	orders INT,
	revenue NUMERIC (10, 2)
);

SELECT * FROM marketing;

--1. What is the total marketing investment across all campaigns? -

SELECT SUM(mark_spent) AS total_spend 
FROM marketing;

--2. How is the marketing budget distributed across different categories? --

SELECT category, SUM(mark_spent) AS total_spend
FROM marketing
GROUP BY category
ORDER BY total_spend DESC;

--3. Which campaign generates the highest revenue?--

SELECT campaign_name, SUM(revenue) AS total_revenue
FROM marketing
GROUP BY campaign_name
ORDER BY total_revenue DESC;

--4. Which campaigns are most effective at attracting user engagement (clicks)?--

SELECT campaign_name, 
SUM(clicks) * 1.0 / SUM(impressions) AS CTR
FROM marketing
GROUP BY campaign_name
ORDER BY CTR DESC;


-- 5. Which campaigns are most effective at converting clicks into leads?--

SELECT campaign_name,
SUM(leads) * 1.0 / SUM(clicks) AS lead_conversion_rate
FROM marketing
GROUP BY campaign_name;


--6. Which campaigns successfully convert clicks into actual purchases? --

SELECT campaign_name,
SUM(orders) * 1.0 / SUM(clicks) AS order_conversion_rate
FROM marketing
GROUP BY campaign_name;

--7. Which campaigns drive the highest number of customer conversions (orders)?--

SELECT campaign_name,
SUM(orders) AS TOTAL_ORDERS
FROM marketing
GROUP BY campaign_name
ORDER BY TOTAL_ORDERS DESC;

-- 8 Which campaigns acquire customers at the lowest cost (most efficient CAC)

SELECT campaign_name,
SUM(mark_spent) / NULLIF(SUM(orders),0) AS CAC
FROM marketing
GROUP BY campaign_name
ORDER BY CAC;


-- 9. Which campaigns deliver the highest return on investment (ROI)? --

SELECT campaign_name,
(SUM (revenue) - SUM(mark_spent)) * 1.0 / SUM(mark_spent) AS ROI
FROM marketing
GROUP BY campaign_name
ORDER BY ROI DESC;


-- 10. How do campaigns perform across the marketing funnel, and where are the major drop-offs?--

SELECT campaign_name,
SUM(impressions) AS impressions,
SUM(clicks) AS clicks,
SUM(leads) AS leads,
SUM(orders) AS orders
FROM marketing
GROUP BY campaign_name;

-- 11. Which campaigns generate the highest revenue per customer/order? --

SELECT campaign_name,
SUM(revenue) / NULLIF(SUM(orders),0) AS revenue_per_order
FROM marketing
GROUP BY campaign_name
ORDER BY revenue_per_order DESC;


--13. Which is the top-performing campaign within each marketing category? --

SELECT *
FROM 
(SELECT category,campaign_name,
 SUM(revenue) AS revenue,
 RANK() OVER (PARTITION BY category ORDER BY SUM(revenue) DESC) AS rnk
 FROM marketing
 GROUP BY category, campaign_name
) x
WHERE rnk = 1;


-- 14. How do campaigns rank based on overall profitability (ROI)? --

SELECT 
    campaign_name,
    (SUM(revenue) - SUM(mark_spent)) * 1.0 / SUM(mark_spent) AS ROI,
    RANK() OVER (ORDER BY (SUM(revenue) - SUM(mark_spent)) * 1.0 / SUM(mark_spent) DESC) AS roi_rank
FROM marketing
GROUP BY campaign_name;



--15. Which campaigns are wasting budget (high spend but low or negative ROI)?--

SELECT campaign_name, spend, ROI
FROM (
    SELECT 
        campaign_name,
        SUM(mark_spent) AS spend,
        (SUM(revenue) - SUM(mark_spent)) * 1.0 / SUM(mark_spent) AS ROI
    FROM marketing
    GROUP BY campaign_name
) x
WHERE spend > (SELECT AVG(mark_spent) FROM marketing)
AND ROI < 0;


--16. Are there any campaigns with unusually high CTR (potential outliers or anomalies)?--

SELECT campaign_name, CTR
FROM (
    SELECT 
        campaign_name,
        SUM(clicks) * 1.0 / SUM(impressions) AS CTR
    FROM marketing
    GROUP BY campaign_name
) x
WHERE CTR > (
    SELECT AVG(clicks * 1.0 / impressions) * 1.5 FROM marketing
);

-- 17. How can campaigns be classified based on profitability levels? --

SELECT 
    campaign_name,
    (SUM(revenue) - SUM(mark_spent)) * 1.0 / SUM(mark_spent) AS ROI,
    CASE
        WHEN (SUM(revenue) - SUM(mark_spent)) / SUM(mark_spent) > 1 THEN 'Highly Profitable'
        WHEN (SUM(revenue) - SUM(mark_spent)) / SUM(mark_spent) > 0 THEN 'Moderate'
        ELSE 'Loss Making'
    END AS campaign_status
FROM marketing
GROUP BY campaign_name;