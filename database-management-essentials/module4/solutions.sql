# 1
SELECT CustNo, CustName, Phone, City
FROM intercollegiate_athletic_database.Customer;

#2
SELECT CustNo, CustName, Phone, City, State
FROM intercollegiate_athletic_database.Customer
WHERE State = "CO";

#3
SELECT *
FROM EventRequest
WHERE EstCost > 4000
ORDER BY DateHeld;

#4
SELECT EventNo, DateHeld, EstAudience, Status
FROM EventRequest
WHERE (EstAudience > 9000 AND Status = "approved")
   OR (Status = "pending" AND EstAudience > 7000);

#5
SELECT EventNo, DateHeld, Customer.CustNo, CustName, City
FROM EventRequest
         INNER JOIN Customer on EventRequest.CustNo = Customer.CustNo
WHERE Customer.City = "Boulder"
  AND DateHeld BETWEEN '2018-12-01' AND '2018-12-31';

#6
SELECT PlanNo, AVG(NumberFld) as AvgNumberFld
FROM EventPlanLine
WHERE LocNo = "L100"
GROUP BY PlanNo;

#7
SELECT PlanNo,
       AVG(NumberFld) as AvgNumberFld,
       COUNT(*) AS NoLines
FROM EventPlanLine
WHERE LocNo = "L100"
GROUP BY PlanNo
HAVING COUNT(*)>1
