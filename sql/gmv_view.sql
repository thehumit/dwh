CREATE VIEW sales_summary AS
SELECT
    p.store_id,
    pr.category_id,
    SUM(pi.product_price * pi.product_count) AS sales_sum
FROM
    purchase_items pi
INNER JOIN purchases p ON pi.purchase_id = p.purchase_id
INNER JOIN products pr ON pi.product_id = pr.product_id
GROUP BY
    p.store_id,
    pr.category_id;
