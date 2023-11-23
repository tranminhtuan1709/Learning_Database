use classicmodels;

/* 1. Lấy ra 50 ký tự đầu tiên của phần mô tả sản phẩm, đặt tên là ‘Title of products’ */
SELECT 
    SUBSTRING(textDescription, 1, 50) AS 'Tiltle of products'
FROM
    productlines;

/* 2. Đưa ra mô tả về các nhân viên theo định dạng ‘Fullname, jobTitle.’ */
SELECT 
    CONCAT(firstName,
            ' ',
            lastName,
            ', ',
            jobTitle,
            '.') AS 'Description of employees'
FROM
    employees;

/* 3. Thay thế toàn bộ tên nhóm hàng ‘Cars’ thành ‘Automobiles’ */
UPDATE products 
SET 
    productLine = REPLACE(productLine,
        'Cars',
        'Automobile')
WHERE
    productLine = 'Cars';

/* 4. Tìm 5 đơn hàng được vận chuyển sớm nhất so với ngày yêu cầu hẹn */
SELECT 
    requiredDate,
    shippedDate,
    (requiredDate - shippedDate) AS 'Earliest'
FROM
    orders
WHERE
    (requiredDate - shippedDate) IS NOT NULL
ORDER BY Earliest DESC
LIMIT 5;

/* 5. Đưa ra các đơn đặt hàng trong tháng 5 năm 2005 và có ngày chuyển hàng đến chưa xác định. */
SELECT
    orderDate, shippedDate
FROM
    orders
WHERE
    EXTRACT(YEAR FROM orderDate) = 2005
        AND EXTRACT(MONTH FROM orderDate) = 5
        AND shippedDate IS NULL;
