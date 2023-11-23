use classicmodels;

-- 1. Đưa ra thông tin về các nhân viên và tên văn phòng nơi họ làm việc

SELECT
	employeeNumber,
	firstName,
    lastName,
    email,
    addressLine1 AS Office_Name
FROM
	employees
INNER JOIN offices
ON
	employees.officeCode = offices.officeCode;

-- 2. Đưa ra thông tin về tên khách hàng và tên các sản phẩm họ đã mua

SELECT
	customerName,
    productName
FROM
	customers
INNER JOIN orders
ON
	orders.customerNumber = customers.customerNumber
INNER JOIN orderdetails
ON
	orderdetails.orderNumber = orders.orderNumber
INNER JOIN products
ON
	products.productCode = orderdetails.productCode;

-- 3. Đưa ra thông tin về các mặt hàng chưa có ai đặt mua

SELECT
	products.productCode,
    products.productName
FROM
	products
INNER JOIN orderdetails
ON
	products.productCode NOT IN(orderdetails.productCode);
    
-- 4. Đưa ra thông tin về các đơn hàng trong tháng 3/2005 (gồm orderDate, requiredDate, Status) và tổng giá trị của mỗi đơn hàng

SELECT
	orders.orderNumber,
    orders.orderDate,
    orders.requiredDate,
    SUM(orderdetails.quantityOrdered * orderdetails.priceEach) AS Gia_tri_don_hang
FROM
	orders
INNER JOIN orderdetails
ON
	orders.orderNumber = orderdetails.orderNumber AND
	MONTH(orders.orderDate) = 3 AND
	YEAR(orders.orderDate) = 2005
GROUP BY
	orders.orderNumber;

-- 5. Đưa ra thông tin về các dòng sản phẩm và số lượng sản phẩm của dòng sản phẩm đó. Sắp xếp theo thứ tự số lượng giảm dần

SELECT
	productlines.productLine,
    COUNT(products.productCode) AS So_luong_san_pham
FROM
	productlines
INNER JOIN products
ON
	productlines.productLine = products.productLine
GROUP BY 
	productlines.productLine
ORDER BY
	So_luong_san_pham DESC;
