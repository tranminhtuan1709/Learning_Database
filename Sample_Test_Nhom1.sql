use classicmodels;

-- Cau 1
CREATE TABLE new_oderdetails AS (
	SELECT *
    FROM orderdetails
    WHERE quantityOrdered = 50
);

-- Cau 2
SELECT
	customers.customerNumber,
    customers.customerName
FROM customers
LEFT JOIN orders ON customers.customerNumber = orders.customerNumber
WHERE orderNumber IS NULL;

SELECT
	customers.customerNumber,
    customers.customerName
FROM customers
WHERE customers.customerNumber NOT IN(
	SELECT orders.customerNumber
    FROM orders
);

-- Cau 3
SELECT DISTINCT
	products.productName,
    products.productCode,
    MSRP,
    priceEach
FROM products
JOIN orderdetails ON
	products.productCode = orderdetails.productCode AND
    priceEach <= 0.8 * MSRP;
    
-- Cau 4
SELECT
	temp1.productCode,
    COUNT(*) AS "SL"
FROM (
	SELECT
		orders.orderNumber,
		products.productCode
	FROM orders
	JOIN orderdetails ON orderdetails.orderNumber = orders.orderNumber
	JOIN products ON orderdetails.productCode = products.productCode
) AS temp1
GROUP BY temp1.productCode
HAVING SL = (
	SELECT COUNT(*)
    FROM orders
);

-- Cau 5
SELECT DISTINCT
	customers.customerNumber,
    customers.customerName
FROM customers
JOIN orders ON orders.customerNumber = customers.customerNumber
JOIN orderdetails ON orderdetails.orderNumber = orders.orderNumber
WHERE orderdetails.productCode IN (
	SELECT productCode
	FROM (
		SELECT
			productCode,
			COUNT(*) AS "SL1"
		FROM orderdetails
		GROUP BY productCode
		HAVING SL1 = (
			SELECT MAX(SL2)
			FROM (
				SELECT
					COUNT(*) AS "SL2"
				FROM orderdetails
				GROUP BY productCode
			) AS temp1
		)
    ) AS temp2
);







