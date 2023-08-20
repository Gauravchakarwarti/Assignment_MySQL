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
