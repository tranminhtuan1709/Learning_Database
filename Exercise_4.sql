create database if not exists Exercise_4;
use classicmodels;

/* 1. Dùng toán tử IN để đưa ra thông tin của các khách hàng sống tại thành phố Nantes và Lyon */
SELECT 
    *
FROM
    customers
WHERE
    city IN ('Nantes' , 'Lyon');
/* 2. BETWEEN để tìm các đơn hàng đã được chuyển trong khoảng thời gian từ '2003/01/10' đến '2003/03/10' */
SELECT 
    orderNumber, orderDate, shippedDate, customerNumber
FROM
    orders
WHERE
    shippedDate BETWEEN '2003-01-10' AND '2003/03/10';
    
/* 3. Sử dụng LIKE để đưa ra thông tin về các nhóm hàng hóa có chứa từ 'CARS' */
SELECT 
    *
FROM
    productLines
WHERE
    productLine LIKE '%CARS%';

/* 4. Truy vấn 10 sản phẩm có số lượng trong kho là lớn nhất */
SELECT 
    *
FROM
    products
ORDER BY quantityInStock
LIMIT 10;

/* 5. Đưa ra danh sách các sản phẩm và thêm thuộc tính là tiền hàng tồn của sản phẩm */
SELECT 
    productCode,
    productName,
    quantityInStock,
    buyPrice,
    (quantityInStock * buyPrice) AS tienhangton
FROM
    products;