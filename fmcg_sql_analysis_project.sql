#fmcg sql project
create database fmcg_sales;
use fmcg_sales;
CREATE  table sales_data(
Material_Number INT,
Material_Description VARCHAR(100),
Period INT,
Brand VARCHAR(50),
Size VARCHAR(20),
Pack VARCHAR(20),
Client VARCHAR(100),
Client_Type VARCHAR(200),
Volume DECIMAL(10,2),
Gross_Sales DECIMAL(15,2),
Discounts DECIMAL(15,2),
Net_Sales DECIMAL(15,2),
Cost_of_Goods_Sold DECIMAL(15,2),
Distribution DECIMAL(15,2),
Warehousing DECIMAL(15,2));
SHOW databases;
SELECT * FROM sales_data;
truncate table sales_data;

#  1 top 5 clinets
select Client , round(sum(Net_Sales),2) as Revenue
from sales_data
group by Client 
order by Revenue desc
limit 5;

# 2 top brand
select Brand, round(sum(Net_Sales),2) as Revenue
from sales_data
group by Brand
order by Revenue desc;

# 3 rev by client type 
select Client_Type , round(sum(Net_Sales),2) as Revenue
from sales_data
group by Client_Type
order by Revenue desc;

#4 sales by volume
select Brand, round(sum(Volume),2) as Total_Volume
from sales_data
group by Brand
order by Total_Volume desc;

# 5 discount  by brand
select Brand, 
round(sum(abs(DiscountS)),2) as Total_Discount
from sales_data
group by Brand
order by Total_Discount desc;

#6 LOGISTICS COST BY BRAND
SELECT
    Brand,
    ROUND(SUM(ABS(Distribution) + ABS(Warehousing)),2) AS Logistics_Cost
FROM sales_data
GROUP BY Brand
ORDER BY Logistics_Cost DESC;

# 7 most profitable brand 
SELECT
    Brand,
    ROUND(SUM(Net_Sales - ABS(Cost_of_Goods_Sold)),2) AS Profit
FROM sales_data
GROUP BY Brand
ORDER BY Profit DESC;

# 8 monthly sales trend 
SELECT
    Period,
    ROUND(SUM(Net_Sales),2) AS Revenue
FROM sales_data
GROUP BY Period
ORDER BY Period;


 