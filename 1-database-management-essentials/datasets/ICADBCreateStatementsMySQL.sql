CREATE TABLE Customer
(
    CustNo   VARCHAR(8)  NOT NULL,
    CustName VARCHAR(30) NOT NULL,
    Address  VARCHAR(50) NOT NULL,
    Internal CHAR(1)     NOT NULL,
    Contact  VARCHAR(35) NOT NULL,
    Phone    VARCHAR(11) NOT NULL,
    City     VARCHAR(30) NOT NULL,
    State    VARCHAR(2)  NOT NULL,
    Zip      VARCHAR(10) NOT NULL,
    CONSTRAINT PK_CUSTOMER PRIMARY KEY (CustNo)
);

CREATE TABLE Facility
(
    FacNo   VARCHAR(8)  NOT NULL,
    FacName VARCHAR(30) NOT NULL,
    CONSTRAINT PK_FACILITY PRIMARY KEY (FacNo),
    CONSTRAINT Unique_FacName UNIQUE (FacName)
);

CREATE TABLE Location
(
    LocNo   VARCHAR(8)  NOT NULL,
    FacNo   VARCHAR(8)  NOT NULL,
    LocName VARCHAR(30) NOT NULL,
    CONSTRAINT PK_LOCATION PRIMARY KEY (LocNo),
    CONSTRAINT FK_FACNO FOREIGN KEY (FacNo)
        REFERENCES Facility (FacNo)
);

# -----------------------------

CREATE TABLE Employee
(
    EmpNo      VARCHAR(8)  NOT NULL,
    EmpName    VARCHAR(30) NOT NULL,
    Department VARCHAR(30) NOT NULL,
    Email      VARCHAR(30) NOT NULL,
    Phone      VARCHAR(30) NOT NULL,
    CONSTRAINT PK_EMPLOYEE PRIMARY KEY (EmpNo)
);

CREATE TABLE ResourceTbl
(
    ResNo   VARCHAR(8)     NOT NULL,
    ResName VARCHAR(30)    NOT NULL,
    Rate    DECIMAL(13, 2) NOT NULL,
    CHECK (Rate > 0),
    CONSTRAINT PK_RESOURCETBL PRIMARY KEY (ResNo)
);

CREATE TABLE EventRequest
(
    EventNo     VARCHAR(8)     NOT NULL,
    DateHeld    DATE           NOT NULL,
    DateReq     DATE           NOT NULL,
    FacNo       VARCHAR(8)     NOT NULL,
    CustNo      VARCHAR(8)     NOT NULL,
    DateAuth    DATE,
    Status      VARCHAR(30)    NOT NULL,
    EstCost     DECIMAL(13, 2) NOT NULL,
    EstAudience INT            NOT NULL,
    BudNo       VARCHAR(30),
    CHECK (EstCost > 0),
    CONSTRAINT FK_ERFACNO FOREIGN KEY (FacNo)
        REFERENCES Facility (FacNo),
    CONSTRAINT FK_ERCUSTNO FOREIGN KEY (CustNo)
        REFERENCES Customer (CustNo),
    CHECK (Status in ('Pending', 'Approved', 'Denied')),
    CONSTRAINT PK_EVENTREQUEST PRIMARY KEY (EventNo)
);

CREATE TABLE EventPlan
(
    PlanNo   VARCHAR(8)  NOT NULL,
    EventNo  VARCHAR(8)  NOT NULL,
    WorkDate DATE        NOT NULL,
    Notes    VARCHAR(30),
    Activity VARCHAR(30) NOT NULL,
    EmpNo    VARCHAR(8),
    CONSTRAINT FK_EPEVENTNO FOREIGN KEY (EventNo)
        REFERENCES EventRequest (EventNo),
    CONSTRAINT FK_EPEMPNO FOREIGN KEY (EmpNo)
        REFERENCES Employee (EmpNo),
    CONSTRAINT PK_EVENTPLAN PRIMARY KEY (PlanNo)
);

CREATE TABLE EventPlanLine
(
    PlanNo    VARCHAR(8) NOT NULL,
    LineNo    INT        NOT NULL,
    TimeStart DATETIME   NOT NULL,
    TimeEnd   DATETIME   NOT NULL,
    NumberFld INT        NOT NULL,
    LocNo     VARCHAR(8) NOT NULL,
    ResNo     VARCHAR(8) NOT NULL,
    CHECK ( TimeStart < TimeEnd ),
    CONSTRAINT FK_EPLLOCNO FOREIGN KEY (LocNo)
        REFERENCES Location (LocNo),
    CONSTRAINT FK_EPLRESNO FOREIGN KEY (ResNo)
        REFERENCES ResourceTbl (ResNo),
    CONSTRAINT FK_EPLANNO FOREIGN KEY (PlanNo)
        REFERENCES EventPlan (PlanNo)
);
