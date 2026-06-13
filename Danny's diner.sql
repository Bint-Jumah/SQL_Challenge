CREATE TABLE sales (
"customer_id" VARCHAR,
"order_date" DATE,
"product_id" INT
)

INSERT INTO sales
("customer_id", "order_date", "product_id")
VALUES
('A','2021-01-01', '1'),
('A','2021-01-01', '2'),
('A','2021-01-07', '2'),
('A','2021-01-10', '3'),
('A','2021-01-11', '3'),
('A','2021-01-11', '3'),
('B','2021-01-01', '2'),
('B','2021-01-02', '2'),
('A','2021-01-04', '1'),
('B','2021-01-11', '1'),
('B','2021-01-16', '3'),
('B','2021-02-01', '3'),
('C','2021-01-01', '3'),
('C','2021-01-01', '3'),
('C','2021-01-07', '1');

CREATE TABLE menu (
"product_id" INT,
"product_name" VARCHAR,
"price" INT
)

INSERT INTO menu
 ("product_id","product_name","price")
 VALUES
 ('1','sushi','10'),
 ('2','curry','15'),
 ('3','ramen','12');

CREATE TABLE members (
"customer_id" VARCHAR,
"join_date" DATE
)

INSERT INTO members
("customer_id", "join_date")
VALUES
('A','2021-01-07'),
('B','2021-01-09');

SELECT * FROM sales;
SELECT * FROM menu;
SELECT * FROM members;

---CASE STUDY QUESTION---
--1. What is the total amount each customer spent at the restaurant--
SELECT S.customer_id, SUM (M.price) AS total_spent
FROM sales S
JOIN menu M
ON S.product_id = M.product_id
GROUP BY S.customer_id
ORDER BY total_spent DESC;

--2. How many days has each customer visited the restaurant--
SELECT customer_id, COUNT (order_date) AS no_days_visited
FROM sales
GROUP BY customer_id
ORDER BY no_days_visited DESC

--3. What was the first item from the menu purchased by each customer--
SELECT M.product_name, S.customer_id,M.price,S.order_date
FROM sales S
JOIN menu M
ON S.product_id = M.product_id
WHERE order_date='2021-01-01';
--4. What is the most purchased item from the menu and how many times was it purchased by all customers--
SELECT S.product_id, M.product_name, COUNT(S.product_id) AS total_purchase
FROM sales S
JOIN menu M
ON S.product_id = M.product_id
GROUP BY M.product_name,S.product_id
ORDER BY total_purchase DESC
LIMIT 1;

--5. Which item was the most popular for each customer--
SELECT customer_id,product_name, purchase_count
FROM(
SELECT S.customer_id, M.product_name, COUNT (*) AS purchase_count,
RANK()OVER(PARTITION BY S.customer_id ORDER BY COUNT (*)DESC) AS rnk
FROM sales S
JOIN menu M
ON S.product_id = M.product_id
GROUP BY S.customer_id, M.product_name
)
WHERE rnk=1;
 
--6. Which item was purchased first by the customer after they become a member--
SELECT S.customer_id,M.product_name, S.order_date
FROM sales S
JOIN menu M
ON S.product_id = M.product_id
JOIN members N
ON S.customer_id = N.customer_id
WHERE S.order_date >= N.join_date
AND S.order_date =(
SELECT MIN( SA.order_date)
FROM sales SA
WHERE SA.customer_id = S.customer_id
AND SA.order_date >= N.join_date
);
--7. Which item was purchased just before the customer become a member --
SELECT S.customer_id,M.product_name, S.order_date
FROM sales S
JOIN menu M
ON S.product_id = M.product_id
JOIN members N
ON S.customer_id = N.customer_id
WHERE S.order_date < N.join_date
AND S.order_date =(
SELECT MIN( SA.order_date)
FROM sales SA
WHERE SA.customer_id = S.customer_id
AND SA.order_date < N.join_date
);
--8. What is the total items and amount spent for each member before they become a member--
SELECT S.customer_id,M.product_name, S.order_date,
SUM(M.price) AS Total_Spent
FROM sales S
JOIN menu M
ON S.product_id = M.product_id
JOIN members N
ON S.customer_id = N.customer_id
WHERE S.order_date < N.join_date
AND S.order_date =(
SELECT MIN( SA.order_date)
FROM sales SA
WHERE SA.customer_id = S.customer_id
AND SA.order_date < N.join_date
)
GROUP BY S.customer_id,M.product_name, S.order_date
ORDER BY Total_Spent DESC;
--9. If each $1 spent equates to 10 points and sushi has a 2x points
--multiplier- how many points would each customer have--
SELECT S.customer_id, SUM(M.price *10*
CASE WHEN M.product_name='sushi' THEN 2 ELSE 1 END)AS total_points
FROM sales S
JOIN menu M
ON S.product_id = M.product_id
GROUP BY S.customer_id
ORDER BY total_points DESC;
--10. In the first week after a customer joins the program 
--(including their join date) they earn 2x points on all items, 
--not just sushi- how many points do customer Aand B have at the 
--end of january--
SELECT S.customer_id, SUM(M.price *10*
CASE WHEN S.order_date BETWEEN N.join_date 
AND N.join_date + INTERVAL '6 days'
THEN 2 
WHEN LOWER (M.product_name)= 'sushi'
THEN 2 ELSE 1 END)AS total_points
FROM sales S
JOIN menu M
ON S.product_id = M.product_id
JOIN members N
ON S.customer_id = N.customer_id 
WHERE S.customer_id IN ('A','B')
AND S.order_date<= '2021-01-31'
GROUP BY S.customer_id
ORDER BY total_points DESC;
--done--
