use classicmodels;

-- 1. Đưa ra tên các thành phố và số lượng khách hàng tại từng thành phố

SELECT 
    city, COUNT(*) AS Number_of_customer
FROM
    customers
GROUP BY city;

-- 2. Đưa ra số lượng các đơn đặt hàng trong tháng 3/2005

SELECT 
    *, COUNT(*) AS Number_of_order
FROM
    orders
GROUP BY orderNumber
HAVING EXTRACT(YEAR FROM orderDate) = 2005
    AND EXTRACT(MONTH FROM orderDate) = 3;

-- 3. Đưa ra số lượng các đơn đặt hàng trong từng tháng của năm 2005

SELECT 
    COUNT(*), MONTH(orderDate) AS Month_in_2005
FROM
    orders
WHERE
    EXTRACT(YEAR FROM orderDate) = 2005
GROUP BY Month_in_2005;

-- 4. Đưa ra 10 mã đơn đặt hàng có giá trị lớn nhất

SELECT 
    orderNumber, SUM(quantityOrdered * priceEach) AS Total
FROM
    orderdetails
GROUP BY orderNumber
ORDER BY Total DESC
LIMIT 10;

-- 5. Đưa ra mã nhóm hàng và tổng số lượng hàng hóa còn trong kho của nhóm hàng đó

SELECT 
    productLine, SUM(quantityInStock) AS total_remain
FROM
    products
GROUP BY productLine;