CREATE TABLE Users
(UserID Char(4) Not Null,
Username VarChar(45) Not Null,
Email VarChar(45) Not Null,
Usertype INT Not Null
PRIMARY KEY (UserID))

CREATE TABLE Category
(CatNo INT Not Null,
Category VarChar(45) Not Null,
PRIMARY KEY(CatNo))

CREATE TABLE Sub_Category
(SubcatNo INT Not Null,
SubCategory VarChar(100) Not Null,
PRIMARY KEY(SubcatNo))

CREATE TABLE Equipment
(EquipID Char(4) Not Null,
Equip_Name VarChar(100) Not Null,
Category INT Not Null,
SubCategory INT Not Null,
Cost Decimal Not Null
PRIMARY KEY (EquipID)
FOREIGN KEY (Category) REFERENCES Category (CatNo),
FOREIGN KEY (SubCategory) REFERENCES Sub_Category (SubCatNo))

CREATE TABLE Asset_Status
(StatusNo INT Not Null,
AssetStatus VarChar(45) Not Null
PRIMARY KEY(StatusNo))

CREATE TABLE Asset
(AssetID Char(7) Not Null,
DateOfPurchase Smalldatetime Not Null,
AssetStatus INT Not Null,
Equip_ID Char(4) Not Null,
IsAvailable INT Not Null,
DateOfAvailability Smalldatetime Null
PRIMARY KEY (AssetID)
FOREIGN KEY (AssetStatus) REFERENCES Asset_Status (StatusNo),
FOREIGN KEY (Equip_ID) REFERENCES Equipment (EquipID))

CREATE TABLE Loan_Type
(TypeNo INT Not Null,
LoanType VarChar(35) Not Null
PRIMARY KEY(TypeNo))

CREATE TABLE Loan_Status
(StatusNo INT Not Null,
LoanStatus VarChar(15) Not Null
PRIMARY KEY(StatusNo))

CREATE TABLE Loan
(LoanID Char(12) Not Null,
Asset_ID Char(7) Not Null,
BorrowerID Char(4) Not Null,
ApproverID Char(4) Null,
LoanStatus INT Not Null,
TypeOfLoan INT Not Null,
Purpose VarChar(155) Not Null,
DateOfRequest Smalldatetime Not Null,
DateOfApproval Smalldatetime Null,
DateOfCollection Smalldatetime Null,
DueDate Smalldatetime Null,
DateOfReturn Smalldatetime Null
PRIMARY KEY (LoanID)
FOREIGN KEY (Asset_ID) REFERENCES Asset (AssetID),
FOREIGN KEY (BorrowerID) REFERENCES Users (UserID),
FOREIGN KEY (LoanStatus) REFERENCES Loan_Status (StatusNo),
FOREIGN KEY (TypeOfLoan) REFERENCES Loan_Type (TypeNo))

