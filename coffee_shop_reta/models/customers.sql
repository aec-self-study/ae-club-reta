{{ config(
    materialized='table'
)}}

select c.id
,c.name
,c.email
,min(o.created_at) as first_order_at
,count(distinct o.id) as number_of_orders
 from `analytics-engineers-club.coffee_shop.customers` c

left join `analytics-engineers-club.coffee_shop.orders` o on c.id=o.customer_id
group by 1,2,3