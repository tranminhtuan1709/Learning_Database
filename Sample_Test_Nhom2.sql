USE classicmodels;
-- Cau 1
CREATE TABLE IF NOT EXISTS new_employees AS SELECT * FROM employees;

-- Cau 2
SELECT
	employeeNumber as "Mã số",
    firstName as "Họ",
    lastName as "Tên"
FROM
	employees
WHERE employeeNumber NOT IN(
	SELECT salesRepEmployeeNumber
    FROM customers
    WHERE salesRepEmployeeNumber = employeeNumber
);

SELECT
    employeeNumber as "Mã số",
    firstName as "Họ",
    lastName as "Tên"
FROM employees
LEFT JOIN customers ON salesRepEmployeeNumber = employeeNumber
WHERE salesRepEmployeeNumber IS NULL;

-- Cau 3
SELECT
	products.productCode as "Mã sản phẩm",
    products.productName as "Tên sản phẩm",
    SUM(priceEach * quantityOrdered - buyPrice * quantityOrdered) as "Lợi nhuận"
FROM orderdetails
JOIN products ON products.productCode = orderdetails.productCode
GROUP BY orderdetails.productCode;

-- Cau 4
SELECT
	customerNumber AS "Mã khách hàng",
	customerName AS "Tên khách hàng"
FROM customers
WHERE customerNumber IN(
	SELECT DISTINCT customerNumber
	FROM (
		SELECT productCode, customerNumber
		FROM orders
		JOIN orderdetails ON
			orders.orderNumber = orderdetails.orderNumber AND
            productCode IN (
				SELECT productCode FROM (
					SELECT productCode, COUNT(*) as "SL"
					FROM orderdetails
					GROUP BY productCode
					HAVING SL > 1
				) AS temp1
			)
		) AS temp2
);

-- Cau 5
SELECT
	employeeNumber AS "Mã nhân viên",
    firstName AS "Họ",
    lastName AS "Tên",
    reportsTo AS "Người quản lý"
FROM employees
WHERE reportsTo IN(
	SELECT reportsTo
	FROM (
		SELECT
			COUNT(*) AS "SL1",
			reportsTo
		FROM employees
		WHERE reportsTo IS NOT NULL
		GROUP BY reportsTo
		HAVING SL1 = (
			SELECT MAX(SL2)
			FROM (
				SELECT
					COUNT(*) AS "SL2",
					reportsTo
				FROM employees
				WHERE reportsTo IS NOT NULL
				GROUP BY reportsTo
			) AS temp1
		)
	) AS temp2
);






