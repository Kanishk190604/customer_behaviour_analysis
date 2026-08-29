select * from customer
limit 20;
SELECT item_purchased
FROM customer
LIMIT 5;
--Q1 what is the revenew by eacg gender
select gender , SUM(purchase_amount) as revenue
from customer 
group by gender;
--Q2 which ustomers used a discount but still spent more than average purchase amoount
select customer_id ,purchase_amount
from customer
where discount_applied = 'Yes' and purchase_amount >=(select AVG(purchase_amount)from customer);
--Q3) which are the top 5 products with the highest average review rating ?
select item_purchased , ROUND(AVG(review_rating:: numeric),2) as "Average Product Rating"
FROM customer
group by item_purchased 
order by avg(review_rating) desc
limit 5 ;
--Q)4 Compare the average Purchase Amounts between Standard and Express Shipping .
select shipping_type,
AVG(purchase_amount)
from customer
where shipping_type in ('Standard','Express')
group by shipping_type;

--Q4)Do subscriberd customers spend more ? Compare average spend and total revenue between subscribers and non-subscribers
select subscription_status,
COUNT (customer_id) as total_customers,
ROUND(AVG(purchase_amount),2) as avg_spend,
ROUND(SUM(purchase_amount),2) as total_revenue
from customer
group by subscription_status
order by total_revenue ,avg_spend desc;
--Q)5 which 5 products have the highest percentage of purchases with discounted price
SELECT 
    item_purchased,
    ROUND(
        SUM(CASE WHEN discount_applied = 'Yes' THEN 1 ELSE 0 End)::numeric
        / COUNT(*) * 100,
        2
    ) AS discount_rate
FROM customer
GROUP BY item_purchased
ORDER BY discount_rate DESC
limit 5;

--Q6) Segment customers into New,Returning and Loyal based on their total number of previous purchases
with customer_type as (
select customer_id,previous_purchases,
CASE
When previous_purchases =1 THEN 'New'
When previous_purchases Between 2 AND 10 THEN 'Returning'
Else 'Loyal'
End AS customer_segment
from customer
)
select customer_segment, count(*) as "Number of Customers"
from customer_type
group by customer_segment;

--Q)8 What are the top 3 most purchased product within each category?
With item_counts as (
select category ,
item_purchased,
COUNT(customer_id)as total_orders,
ROW_NUMBER() over(partition by category order by count (customer_id) DESC)as item_rank
from customer
group by category ,item_purchased)
select item_rank,category,item_purchased,total_orders
from  item_counts
where item_rank<=3;
--Q8)Are customers who are repat buyers also likely to subscribe?
select subscription_status,
count (customer_id) as repeat_buyers
from customer
where previous_purchases> 5
group by subscription_status;
--Q9)What is the revenue contibution of each age group?
select age_group,
SUM(purchase_amount)as total_revenue
from customer
group by age_group
order by total_revenue desc;



