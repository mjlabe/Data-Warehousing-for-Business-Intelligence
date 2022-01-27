#1
SELECT DISTINCT City, State, Zip
FROM Customer;

#2
SELECT EmpName, Department, Phone, Email
FROM Employee
WHERE Phone LIKE "3-%";

#3
SELECT *
FROM ResourceTbl
WHERE RATE >= 10
  AND RATE <= 20
ORDER BY Rate;

#4
SELECT EventNo, DateAuth, Status
FROM EventRequest
WHERE Status IN ("approved", "denied")
  AND YEAR(DateAuth) = 2018
  AND MONTH(DateAuth) = 7;

#5
SELECT LocNo, LocName
FROM Location INNER JOIN Facility ON Location.FacNo = Facility.FacNo
WHERE FacName = "Basketball arena";

#6
SELECT EventPlan.PlanNo, COUNT(*) AS EventCount, SUM(EPL.NumberFld) AS NumResources
FROM EventPlan
INNER JOIN EventPlanLine EPL on EventPlan.PlanNo = EPL.PlanNo
INNER JOIN ResourceTbl RT on EPL.ResNo = RT.ResNo
GROUP BY EventPlan.PlanNo
