USE classicmodels;

-- Cau 1
CREATE TABLE new_products AS (
	SELECT *
    FROM products
    WHERE productLine = "Classic Cars"
);

-- Cau 2
SELECT
	products.productCode,
    products.productName
FROM products
LEFT JOIN orderdetails ON orderdetails.productCode = products.productCode
WHERE orderdetails.orderNumber IS NULL;

SELECT
	products.productCode,
    products.productName
FROM products
WHERE products.productCode NOT IN (
	SELECT productCode
    FROM orderdetails
);

-- Cau 3
SELECT
	products.productCode,
    products.productName,
    priceEach,
    buyPrice
FROM products
JOIN orderdetails
ON
	orderdetails.productCode = products.productCode AND
    priceEach >= 2 * buyPrice;

-- Cau 4
SELECT
	customerNumber,
    customerName
FROM customers
WHERE customerNumber IN (
	SELECT DISTINCT
		customerNumber
	FROM payments
	WHERE paymentDate IN (
		SELECT
			paymentDate
		FROM payments
		GROUP BY paymentDate
		HAVING COUNT(*) = 1
	)
);

-- Cau 5
SELECT
	customerNumber,
    customerName
FROM customers
WHERE customerNumber IN (
	SELECT
	customerNumber
	FROM orders
	WHERE orderNumber IN (
		SELECT
			orderNumber
		FROM orderdetails
		GROUP BY orderNumber
		HAVING SUM(priceEach * quantityOrdered) = (
			SELECT MAX(total)
			FROM (
				SELECT SUM(priceEach * quantityOrdered) AS "total"
				FROM orderdetails
				GROUP BY orderNumber
			) AS temp1
		)
	)
);

