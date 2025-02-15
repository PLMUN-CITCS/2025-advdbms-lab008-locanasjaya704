USE BookstoreDB;

-- Example Query 1: Customer orders and book titles
SELECT c.Name AS CustomerName, o.OrderDate, b.Title AS BookTitle, od.Quantity
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Books b ON od.ISBN = b.ISBN;

-- Example Query 2: Update book price
UPDATE Books SET Price = 8.99 WHERE ISBN = '9781234567890';
SELECT * FROM Books WHERE ISBN = '9781234567890';  -- Verify the update

-- Example Query 3: Delete order detail
DELETE FROM OrderDetails WHERE OrderID = 1 AND ISBN = '9780321765723';
SELECT * FROM OrderDetails WHERE OrderID = 1;  -- Verify the deletion

-- Example Query 4: Books by author
SELECT a.Name AS AuthorName, b.Title AS BookTitle
FROM Authors a
JOIN BookAuthors ba ON a.AuthorID = ba.AuthorID
JOIN Books b ON ba.ISBN = b.ISBN;

-- Example Query 5: Customers who ordered books by a specific author
SELECT c.Name AS CustomerName
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Books b ON od.ISBN = b.ISBN
JOIN BookAuthors ba ON b.ISBN = ba.ISBN
JOIN Authors a ON ba.AuthorID = a.AuthorID
WHERE a.Name = 'Douglas Adams'; -- Change author name as needed

--  Add more queries to explore the data.  Try different JOINs, WHERE clauses,
--  GROUP BY, ORDER BY, aggregate functions (COUNT, SUM, AVG), etc.