📊 Case Study 6
CLIQUE BAIT COMPANY

📌 About the Dataset

This project is based on  Data Mart. The dataset belongs to CLIQUE BAIT, an online seafood store. This project addresses a real-world business scenario using advanced SQL techniques.


🗂 Dataset Overview & Description

The dataset consists of five tables:
The dataset provided in this case study is a Customer visits are logged in this events table at a cookie_id level and the event_type and page_id values can be used to join onto relevant satellite tables to obtain further information about each event.

The five tables are:

--The users table contains: user_id, cookie_id, start_date

--The Events table contains: visit_id, cookie_id, page_id, event_type, sequence_number, event_time

--The Event identifier table contains: event_type, event_name

--The campaign identifier table contains: campaign_id, products, campaign_name, start_date

--The page hierarchy table contains: page_id, page_name, product_category, product_id




For further details on the business context and requirements, please visit the [Case Study 6 webpage](https://8weeksqlchallenge.com/case-study-6/).

✔ The product and the category that are most ordered by customers

✔ The customers behaviors on the website of the company Clique bait

✔ The frequency of visit using the cookie_id from the website e.t.c

🛠 Tech Stack Used
SQL (PostgreSQL) – Data analysis and aggregation



📌 Key Analysis Performed

✅ Total and Percentage of visit by purchase

✅ Digital analysis of the 



📂 Data Source
The dataset and problem statements are sourced from Case Study #6: Data Mart, part of the 8-Week SQL Challenge.

🚀 How to execute this Data
1️⃣ 
Install PostgreSQL on your system.
Execute clique_bait.sql to create the database and tables.
Run clique_bait_2.sql to perform analysis.
In other to help Danny solve this problem using data, there are questions that needed to be addressed but before then data has to be clean.


✅ How many users are there?	

✅ How many cookies does each user have on average? 

✅ What is the unique number of visits by all users per month?

✅ What is the number of events for each event type?

✅ What is the percentage of visits which have a purchase event?

✅ What is the percentage of visits which view the checkout page but do not have a purchase event?

✅ What are the top 3 pages by number of views?

✅ What is the number of views and cart adds for each product category? 

✅ What are the top 3 products by purchases?



📢 Acknowledgment
Thanks to Danny Ma for curating the SQL Challenge.

