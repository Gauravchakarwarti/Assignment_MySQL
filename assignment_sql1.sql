-- Table 1: SalesPeople 

-- Snum is Primary key

-- Sname is Unique constraint

-- Snum Sname City Comm

-- 1001 Peel. London .12

-- 1002  Serres Sanjose .13

-- 1004 Motika London .11

-- 1007 Rifkin Barcelona .15

-- 1003 Axelrod Newyork .10


-- Table 2: Customers

-- Cnum is Primary Key

-- City has not null constraint .

-- Snum is foreign key constraint refers Snum column of SalesPeople table.

-- Cnum Cname City Snum

-- 2001  Hoffman London 1001

-- 2002  Giovanni Rome 1003

-- 2003  Liu Sanjose 1002

-- 2004  Grass Berlin 1002

-- 2006 Clemens London 1001

-- 2008 Cisneros Sanjose 1007

-- 2007 Pereira Rome 1004


-- Table 3: Orders

-- Onum is Primary key

-- Cnum is foreign key refers to Cnum column of Customers table. Snum is foreign key refers Snum column of SalesPeople table.

-- Onum Amt Odate Cnum Snum

-- 3001 18.69 3-10-1990 2008 1007

-- 3003 767.19 3-10-1990 2001 1001

-- 3002 1900.10 3-10-1990 2007 1004

-- 3005  5160.45 3-10-1990 2003 1002

-- 3006  1098.16 3-10-1990 2008 1007

-- 3009 1713.23 4-10-1990 2002 1003

-- 3007  75.75 4-10-1990 2004 1002

-- 3008  4273.00 5-10-1990 2006 1001

-- 3010  1309.95 6-10-1990 2004 1002

-- 3011  9891.88 6-10-1990 2006 1001


-- On the basis of above tables perform given below questions

--      Count the number of Salesperson whose name begin with ‘a’/’A’.
--      Display all the Salesperson whose all orders worth is more than Rs. 2000.
--      Count the number of Salesperson belonging to Newyork.
--      Display the number of Salespeople belonging to London and belonging to Paris.
--     Display the number of orders taken by each Salesperson and their date of orders.



SELECT COUNT(*)
FROM SalesPeople
WHERE UPPER(Sname) LIKE 'A%';
SELECT S.Snum, S.Sname
FROM SalesPeople S
WHERE NOT EXISTS (
    SELECT O.Snum
    FROM Orders O
    WHERE O.Snum = S.Snum
    GROUP BY O.Snum
    HAVING SUM(O.Amt) <= 2000
);
SELECT COUNT(*)
FROM SalesPeople
WHERE City = 'Newyork';
SELECT City, COUNT(*) as NumSalespeople
FROM SalesPeople
WHERE City IN ('London', 'Paris')
GROUP BY City;
SELECT S.Sname, O.Snum, COUNT(O.Onum) AS NumOrders, MIN(O.Odate) AS FirstOrderDate, MAX(O.Odate) AS LastOrderDate
FROM SalesPeople S
LEFT JOIN Orders O ON S.Snum = O.Snum
GROUP BY S.Sname, O.Snum;
