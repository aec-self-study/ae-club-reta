select cast(o.created_at as date) as sold_at
,p.name as product_name
 ,p.category as product_category
,sum(pr.price) as amount

 from `analytics-engineers-club.coffee_shop.orders` o

left join `analytics-engineers-club.coffee_shop.order_items` oi on o.id=oi.order_id

left join `analytics-engineers-club.coffee_shop.products` p on oi.product_id=p.id

left join `analytics-engineers-club.coffee_shop.product_prices` pr on p.id=pr.product_id
group by 1,2,3