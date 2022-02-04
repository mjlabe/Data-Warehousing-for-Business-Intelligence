# 1
# ----------
# List the event number, date held, customer number, customer name, facility number, and facility name of 2018 events
# placed by Boulder customers.

SELECT EventNo, DateHeld, C.CustNo, CustName, F.FacNo, FacName
FROM EventRequest
    INNER JOIN Customer C on EventRequest.CustNo = C.CustNo
    INNER JOIN Facility F on EventRequest.FacNo = F.FacNo
WHERE DateHeld BETWEEN '2018-01-01' AND '2018-12-31'
    AND C.City = 'Boulder';

# 2
# ----------
# List the customer number, customer name, event number, date held, facility number, facility name, and estimated
# audience cost per person (EstCost / EstAudience) for events held on 2018, in which the estimated cost per person is
# less than $0.2

SELECT C.CustNo, CustName, EventNo, DateHeld, F.FacNo, FacName, (EstCost / EstAudience) AS CostPerPerson
FROM EventRequest
    INNER JOIN Customer C on EventRequest.CustNo = C.CustNo
    INNER JOIN Facility F on EventRequest.FacNo = F.FacNo
WHERE DateHeld BETWEEN '2018-01-01' AND '2018-12-31'
    AND (EstCost / EstAudience) < 0.2;

# 3
# ----------
# List the customer number, customer name, and total estimated costs for Approved events. The total amount of events is
# the sum of the estimated cost for each event. Group the results by customer number and customer name.

SELECT C.CustNo, CustName, SUM(EstCost) AS TotalEstCosts
FROM EventRequest
    INNER JOIN Customer C on EventRequest.CustNo = C.CustNo
WHERE Status = 'Approved'
GROUP BY C.CustNo, CustName

# 4
# ----------
# Insert yourself as a new row in the Customer table.
# SELECT CustNo FROM Customer ORDER BY CustNo DESC LIMIT 1;
INSERT INTO Customer (CustNo, CustName, Address, Internal, Contact, Phone, City, State, Zip)
    VALUES ('C107', 'Marc', 'Home', 'N', 'Jen', '716', 'Buffalo', 'NY', '90210');
