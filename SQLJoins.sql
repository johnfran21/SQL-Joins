/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
 
 SELECT products.Name as "Product Name" , categories.Name as "Category Name"
 FROM products
 INNER JOIN categories
 ON products.CategoryID = categories.CategoryID
 WHERE categories.Name = "Computers";
 
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
 
 SELECT products.Name, products.Price, products.Rating
 FROM products
 INNER JOIN reviews
 ON products.ProductID = reviews.ProductID
 WHERE reviews.Rating = 5;
 
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */

SELECT employees.FirstName, employees.EmployeeID, Sum(sales.Quantity) as total
FROM employees
INNER JOIN sales
on employees.EmployeeID = sales.EmployeeID
GROUP BY sales.EmployeeID
ORDER BY total DESC
LIMIT 2;

/* joins: find the name of the department, and the name of the category for Appliances and Games */

SELECT categories.Name as "Category Name", departments.Name as "Department Name"
FROM categories
LEFT JOIN departments
ON categories.DepartmentID = departments.DepartmentID
WHERE categories.Name = "Appliances" OR categories.Names = "Games";

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
 
 SELECT products.Name as "Product Name",
 Sum(sales.Quanity) as "Total Units Sold",
 Sum(sales.Quanity * sales.PricePerUnit) as "How much money made"
 FROM products
 INNER JOIN sales
 on products.ProductID = sales.ProductID
 WHERE products.Name LIKE "%Hotel%California%";

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */

SELECT products.Name, reviews.Reviewer, reviews.Rating, reviews.Comment
FROM products
INENR JOIN reviews
ON products.ProductID = reviews.ProductID
WHERE products.Name LIKE "%Visio%" AND review.Ratings = (SELECT MIN(rating) from reviews);

-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */