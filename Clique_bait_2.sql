SELECT *
FROM clique_bait.event_identifier;

SELECT * FROM reviews WHERE comment &@~ 'good|excellent|amazing';


SELECT *
FROM clique_bait.campaign_identifier;

SELECT *
FROM clique_bait.users;

SELECT *
FROM clique_bait.events;


--How many users are there?

SELECT COUNT (DISTINCT user_id) as no_of_users
FROM clique_bait.users;


--How many cookies does each user have on average?

SELECT user_id, COUNT(cookie_id) AS total_cookies_owned
FROM clique_bait.users
GROUP BY user_id
ORDER BY user_id, total_cookies_owned;


--What is the unique number of visits by all users per month?

WITH tab_1 AS (
	SELECT 
		user_id, 
		cookie_id, 
		EXTRACT(MONTH FROM start_date) AS month_
	FROM clique_bait.users
	GROUP BY user_id, month_, cookie_id
)
SELECT user_id, month_, COUNT(month_) AS total_users_per_month
FROM tab_1
GROUP BY user_id, month_
ORDER BY user_id, total_users_per_month, month_;


--What is the number of events for each event type?

SELECT event_type, COUNT(event_type) AS no_event_type
FROM clique_bait.events
GROUP BY  event_type
ORDER BY event_type, no_event_type;


--What is the percentage of visits which have a purchase event?

SELECT  ROUND(
        (COUNT(CASE WHEN event_type = 3 THEN visit_id END) * 100.0) 
        / COUNT(visit_id), 
    2) AS purchase_percentage
FROM clique_bait.events;


--What is the percentage of visits which view the checkout page but do not have a purchase event?

SELECT 
    ROUND(
        (COUNT(CASE WHEN event_type = 5 AND event_type != 3 THEN visit_id END) * 100.0) 
        / NULLIF(COUNT(CASE WHEN event_type = 5 AND event_type != 3 THEN visit_id END), 0),
    2) AS percentage_checkout_no_purchase
FROM clique_bait.events;


--What are the top 3 pages by number of views?

SELECT page_name, COUNT(visit_id) AS view_count
FROM  clique_bait.events e
JOIN clique_bait.page_hierarchy h
ON e.page_id = h.page_id
GROUP BY page_name
ORDER BY view_count DESC
LIMIT 3;


--What is the number of views and cart adds for each product category?

SELECT product_category,
       SUM(CASE WHEN event_name = 'Page View' THEN 1 ELSE 0 END) AS views_count,
       SUM(CASE WHEN event_name = 'Add to Cart' THEN 1 ELSE 0 END) AS cart_adds_count
FROM clique_bait.events e
JOIN clique_bait.event_identifier i
ON e.event_type = i.event_type
JOIN clique_bait.page_hierarchy h
ON e.page_id = h.page_id
WHERE product_category IS NOT NULL
GROUP BY product_category;


--What are the top 3 products by purchases?

SELECT product_id, 
       product_category, 
       COUNT(*) AS purchase_count
FROM clique_bait.events e
JOIN clique_bait.page_hierarchy h
ON  e.page_id = h.page_id
WHERE event_type = 3
GROUP BY product_id, product_category
ORDER BY purchase_count DESC
LIMIT 3;
