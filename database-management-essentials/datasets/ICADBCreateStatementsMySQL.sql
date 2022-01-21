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
        REFERENCES FACILITY (FacNo)
);

CREATE TABLE Employee
(

CREATE TABLE ResourceTbl
(

CREATE TABLE EventPlan
(

CREATE TABLE EventPlanLine
(

