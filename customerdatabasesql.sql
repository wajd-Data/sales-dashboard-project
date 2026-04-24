SELECT * FROM customer_analysis.customer_db;
SELECT *
FROM customer_db
LIMIT 10;

SELECT
COUNT(*) AS total_orders
FROM customer_db;
  -- Total Sales
Select
SUM(Sales) AS total_sales
FROM customer_db;

-- Sales by Category

SELECT 
Category,
 SUM(Sales) AS total_sales
FROM customer_db
group by Category
ORDER BY total_sales DESC;

      -- Data Filteration
      SELECT *
      FROM customer_db
      WHERE State = 'California';
      -- Customer Name and Sales Only
      SELECT
      Customer_Name,
      Sales
      FROM customer_db;
      
        -- Orders With Sales > 500
        SELECT *
        FROM customer_db
        WHERE Sales > 500;
        
         -- High Sales in California
         SELECT *
         FROM customer_db
         WHERE State= 'California'
         AND Sales > 500;
         
          -- Sort by Highest Sales 
          
          SELECT *
          FROM Customer_db
          ORDER BY Sales DESC; 
          
           -- Total Sales by Category
           SELECT 
           Category, SUM(Sales) AS total_sales
           FROM customer_db
           GROUP BY Category 
           ORDER BY total_sales DESC;
           
           
           SELECT COUNT(*)
           FROM customer_db;
           
           
           SELECT sum(Sales)
           FROM customer_db;
           
            -- Sales by State
            SELECT State, SUM(Sales) AS total_sales
            FROM customer_db
            GROUP BY State
            ORDER BY total_sales DESC;
            
          -- Total Sales by Region 
          SELECT Region, SUM(Sales) AS total_sales
          FROM customer_db
          GROUP BY Region
          ORDER BY total_sales DESC; 
          
           -- Count Orders by Customer Segment 
           SELECT Segment, COUNT(*) AS num_of_orders
           FROM customer_db
           GROUP BY Segment; 
           
           -- Total Sales by Customer Segment
           SELECT Segment, ROUND(SUM(Sales), 2 )AS total_sales
		, COUNT(*) AS total_orders
        FROM customer_db
        GROUP BY Segment
        ORDER BY total_sales DESC;
           
            -- Show Unique States
            SELECT DISTINCT  State
            FROM customer_db;
            
            -- Average Sales Value 
            SELECT AVG(Sales) AS avg_sales
            FROM customer_db;
            
            -- Highest Sale
            SELECT MAX(Sales) AS max_sale
            FROM customer_db;
            -- Lowest Sales 
              SELECT MIN(Sales) AS min_sale
            FROM customer_db;
            
            -- Number of Orders per State 
            SELECT State, COUNT(*) AS total_orders
            FROM customer_db
            GROUP BY State
            ORDER BY total_orders DESC;
            
            -- TOP 10 Customers with Highest Sales 
            SELECT Customer_Name, ROUND(SUM(Sales) , 2 ) AS total_sales, COUNT(*) AS total_orders
            FROM customer_db
            GROUP BY Customer_Name
            ORDER BY total_sales DESC
            LIMIT 10;
            
            -- Customer Value Segmentation 
            SELECT Customer_Name, ROUND(SUM(Sales), 2 ) AS total_sales,
            CASE 
            WHEN SUM(Sales) >= 10000 THEN 'HIGH'
            WHEN SUM(Sales) >= 5000 THEN 'MEDIUM'
            ELSE ' LOW '
            END AS customer_segment
            FROM customer_db
            GROUP BY Customer_Name
            ORDER BY total_sales DESC; 
            
            -- Number of Customer by Value Segment 
            SELECT customer_segment, COUNT(*) AS num_of_customers
            FROM ( 
            SELECT
            Customer_Name, 
            SUM(Sales) AS total_sales , 
            CASE 
            WHEN SUM(Sales)>= 10000 THEN 'HIGH'
            WHEN SUM(Sales) >= 5000 THEN 'MEDIUM'
            ELSE 'LOW'
            END AS customer_segment
            FROM customer_db
            GROUP BY Customer_Name)
            AS segmented_customer
            GROUP BY customer_segment
            ORDER BY num_of_customers DESC; 
            
            -- Customer Purchase Frequency 
            SELECT Customer_ID, Customer_Name, COUNT(DISTINCT Order_ID)AS purchase_frequency
            FROM customer_db
            GROUP BY Customer_ID, Customer_Name
            ORDER BY purchase_frequency DESC; 
            
            -- Average Order Value per Customer 
            SELECT Customer_ID, Customer_Name, ROUND(SUM(Sales) / COUNT(DISTINCT Order_ID), 2 )AS avg_order_value
            FROM customer_db
            GROUP BY Customer_ID, Customer_Name
            ORDER BY avg_order_value DESC;
            
          SELECT * FROM customer_db;
            
            
         