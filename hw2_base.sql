CREATE DATABASE IF NOT EXISTS hw2_base;
USE hw2_base;
DROP TABLE IF EXISTS sales;
DROP TABLE IF EXISTS orders;

-- 1. Создаем табличку “sales” и заполняем ее данными

CREATE TABLE IF NOT EXISTS sales
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATE,
    count_product INT
);

INSERT INTO sales (order_date, count_product)
VALUES
	('2022-01-01', 156),
    ('2022-01-02', 180),
	('2022-01-03', 21),
    ('2022-01-04', 124),
    ('2022-01-05', 341);
	
SELECT * FROM sales;

-- 2. Сгруппируем значения количества в 3 сегменте — меньше 100, 100-300 и больше 300.

SELECT 
	id,
    IF(count_product < 100, 'Маленький заказ', 
		IF(count_product >= 100 AND count_product <= 300, 'Средний заказ','Большой заказ'))
	AS quantity
FROM sales; 

-- 3.  Создадим таблицу “orders”, заполним ее значениями. Покажим “полный” статус заказа, используя оператор CASE

CREATE TABLE IF NOT EXISTS orders (
  id INT PRIMARY KEY AUTO_INCREMENT,
  employee_id VARCHAR(10),
  amount DECIMAL(10, 2),
  order_status VARCHAR(10)
);

INSERT INTO orders (employee_id, amount, order_status)
VALUES ('e03', 15.00, 'open'),
       ('e01', 25.50, 'open'),
       ('e05', 100.70, 'closed'),
       ('e02', 22.18, 'open'),
       ('e04', 9.50, 'cancelled');   

SELECT
  id,
  employee_id,
  amount,
  order_status,
  CASE
    WHEN order_status = 'open' THEN 'Order is in open state'
    WHEN order_status = 'closed' THEN 'Order is closed'
    WHEN order_status = 'cancelled' THEN 'Order is cancelled'
    ELSE 'unknown status'
  END AS full_order_status
FROM orders;    
