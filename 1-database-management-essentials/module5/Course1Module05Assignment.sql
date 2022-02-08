# ==========# SELECT Statement Problems# ==========# ----------# 1# ----------# For event requests, list the event number, event date (eventrequest.dateheld), and count of the event plans.  Only# include event requests in the result if the event request has more than one related event plan with a work date in# December 2018.SELECT ER.EventNo, DateHeld, COUNT(PlanNo) AS NumPlansFROM EventRequest ER         INNER JOIN EventPlan EP on ER.EventNo = EP.EventNoWHERE DateHeld BETWEEN '2018-12-01' AND '2018-12-31'GROUP BY ER.EventNo, DateHeldHAVING NumPlans > 1;# ----------# 2# ----------# List the plan number, event number, work date, and activity of event plans meeting the following two conditions: (1)# the work date is in December 2018 and (2) the event is held in the “Basketball arena”.  Your query must not use the# facility number (“F101”) of the basketball arena in the WHERE clause. Instead, you should use a condition on the# FacName column for the value of “Basketball arena”.SELECT PlanNo, EP.EventNo, WorkDate, ActivityFROM EventPlan EP         INNER JOIN EventRequest ER on EP.EventNo = ER.EventNo         INNER JOIN Facility F on ER.FacNo = F.FacNoWHERE (WorkDate BETWEEN '2018-12-01' AND '2018-12-31')  AND (F.FacName = 'Basketball arena');# ----------# 3# ----------# List the event number, event date, status, and estimated cost of events where there is an event plan managed by Mary# Manager and the event is held in the basketball arena in the period October 1 to December 31, 2018.  Your query must# not use the facility number (“F101”) of the basketball arena or the employee number (“E101”) of “Mary Manager” in the# WHERE clause. Thus, the WHERE clause should not have conditions involving the facility number or employee number# compared to constant values.SELECT ER.EventNo, DateHeld, Status, EstCostFROM EventRequest ER    INNER JOIN EventPlan EP on ER.EventNo = EP.EventNo    INNER JOIN Employee E on EP.EmpNo = E.EmpNo    INNER JOIN Facility F on ER.FacNo = F.FacNoWHERE E.EmpName = 'Mary Manager'    AND (WorkDate BETWEEN '2018-10-01' AND '2018-12-31')    AND F.FacName = 'Basketball arena';# ----------# 4# ----------# List the plan number, line number, resource name, number of resources (eventplanline.number), location name, time# start, and time end where the event is held at the basketball arena, the event plan has activity of activity of# “Operation”, and the event plan has a work date in the period October 1 to December 31, 2018.  Your query must not# use the facility number (“F101”) of the basketball arena in the WHERE clause. Instead, you should use a condition on# the FacName column for the value of “Basketball arena”.SELECT EPL.PlanNo, LineNo, ResName, EPL.NumberFld AS NumResources, LocName, TimeStart, TimeEndFROM EventPlanLine EPL    INNER JOIN ResourceTbl RT on EPL.ResNo = RT.ResNo    INNER JOIN Location L on EPL.LocNo = L.LocNo    INNER JOIN Facility F on L.FacNo = F.FacNo    INNER JOIN EventPlan EP on EPL.PlanNo = EP.PlanNoWHERE F.FacName = 'Basketball arena'    AND Activity = 'Operation'    AND (WorkDate BETWEEN '2018-10-01' AND '2018-12-31')# ==========# Database Modification Problems# ==========# 1# ----------#