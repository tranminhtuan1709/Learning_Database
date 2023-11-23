use classicmodels;

-- 1. Sử dụng truy vấn con đưa ra các sản phẩm có đơn đặt hàng trong tháng 3/2005

SELECT productName
FROM products
WHERE products.productCode IN (
    SELECT orderdetails.productCode
	FROM orderdetails
	WHERE orderdetails.orderNumber IN (
        SELECT orders.orderNumber
		FROM orders
		WHERE
			YEAR(orders.orderDate) = 2005 AND
            MONTH(orders.orderDate) = 3
		)
	);

-- 2. Tương tự như câu hỏi 1 nhưng dùng phép nối bảng thay vì sử dụng truy vấn con
SELECT
	products.productCode
FROM products
INNER JOIN orderdetails ON products.productCode = orderdetails.productCode
INNER JOIN orders ON orderdetails.orderNumber = orders.orderNumber
WHERE
	YEAR(orders.orderDate) = 2005 AND
    MONTH(orders.orderDate) = 3;
