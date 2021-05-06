-- Näkymä, jossa tilausrivi näkyy selkokielisenä
SELECT product.name, order_detail.quantity, product.unit, product.price, order_detail.quantity * product.price AS subtotal
FROM product INNER JOIN order_detail ON product.product_id = order_detail.product_id