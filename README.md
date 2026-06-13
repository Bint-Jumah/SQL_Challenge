# Danny's Diner SQL Case Study

## Overview

This project contains my SQL solutions to the **Danny's Diner Case Study**, one of the challenges from the **8 Week SQL Challenge** created by Danny Ma.

The objective of this case study is to analyze customer purchasing behavior, membership trends, revenue generation, and loyalty points using SQL queries. The project demonstrates practical SQL skills including data manipulation, joins, aggregations, subqueries, window functions, and conditional logic.

## Dataset Description

The case study consists of three tables:

### Sales

Contains customer purchase transactions.

| Column      | Description                |
| ----------- | -------------------------- |
| customer_id | Unique customer identifier |
| order_date  | Date of purchase           |
| product_id  | Purchased product          |

### Menu

Contains menu item details.

| Column       | Description               |
| ------------ | ------------------------- |
| product_id   | Unique product identifier |
| product_name | Name of menu item         |
| price        | Price of item             |

### Members

Contains loyalty program membership information.

| Column      | Description                |
| ----------- | -------------------------- |
| customer_id | Unique customer identifier |
| join_date   | Membership start date      |


## Business Questions Solved

The SQL queries answer the following business questions:

1. What is the total amount each customer spent at the restaurant?
2. How many days has each customer visited the restaurant?
3. What was the first item purchased by each customer?
4. What is the most purchased item on the menu and how many times was it purchased?
5. Which item was the most popular for each customer?
6. Which item was purchased first after becoming a member?
7. Which item was purchased just before becoming a member?
8. What were the total items and amount spent before becoming a member?
9. How many loyalty points did each customer earn with the sushi bonus?
10. How many points did customers A and B earn by the end of January under the promotional points system?

## SQL Concepts Used

This project demonstrates the use of:

* INNER JOIN
* GROUP BY
* Aggregate Functions (SUM, COUNT)
* ORDER BY
* Subqueries
* CASE Statements
* Window Functions (RANK)
* Date Filtering
* Conditional Aggregation

## Key Learning Outcomes

Through this case study, I strengthened my understanding of:

* Relational database analysis
* Customer behavior analytics
* Revenue and sales reporting
* Loyalty program calculations
* Writing efficient SQL queries for business problems
* Using window functions to rank and analyze data

## Tools Used

* PostgreSQL
  
