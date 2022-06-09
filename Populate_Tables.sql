-- Populate All Tables

-- Users 
-- Type 1 : User ( starts with U )
-- Type 2 : Asset Owner ( starts with A )
INSERT INTO Users
VALUES
('U001','James','james@gmail.com',1),
('U002','Royce','Royce@gmail.com',1),
('A001','Selina','SelinaG@gmail.com',2),
('A002','Shawn','ShawnMendes@gmail.com',2),
('U003','Camila','CamilaC@gmail.com',1),
('U004','Gerald','Geraldhjk@gmail.com',1),
('A003','Skylar','Skylartjw@gmail.com',1),
('A004','Taylor','TaylorS@gmail.com',2)

-- Category
INSERT INTO Category
VALUES
(1,'Laptops and Accessories'),
(2,'AI Development Kit')

-- Sub_Category
INSERT INTO Sub_Category
VALUES
(1,'WIN Laptop ( For students & General )'),
(2,'Tablet PC ( For students & General )'),
(3,'JETBOT')

-- Equipment
INSERT INTO Equipment
VALUES
('E001','DELL XPS 13 Laptop',1,1,1599.0),
('E002','DELL XPS 2-in-1 Tablet',1,2,2799.1),
('E003','SPARKFUN Jetbot AI kit',2,3,869.0),
('E004','NVIDIA Jetson Developer kit',2,3,939.5)

-- Asset_Status
INSERT INTO Asset_Status
VALUES
-- Asset can be loaned by user, but does not imply it is available for loan.
(1,'Ready For Loan'),
-- Assets cannot be borrowed. It might be reserved by school event.
(2,'Reserved'),
-- Item is not available for loan. It may have been sent for repair or time for stocktake.
(3,'Freeze From Loan'),
-- Asset is no more functional and not available for loan.
(4,'Write Off')


-- Asset
-- Availability 1 : Available 
-- Availability 2 : Unavailable
INSERT INTO Asset
VALUES
-- Ready for loan , Unavailable , Loaned
('E001/01','2021-08-10 12:00:00',1,'E001',2,'2022-01-24 13:00:00'),
-- Ready for loan , Available , No Loan > 90 days
('E001/02','2021-08-10 12:00:00',1,'E001',1,NULL),
-- Reserved , Unavailable
('E001/03','2021-08-10 12:00:00',2,'E001',2,NULL),
-- Ready for loan , Available
('E002/01','2021-08-01 12:00:00',1,'E002',1,NULL),
-- Ready for loan , Unavailable , Overdue
('E002/02','2021-08-18 12:00:00',1,'E002',2,NULL),
-- Ready for loan , Available
('E002/03','2021-11-21 12:00:00',1,'E002',1,NULL),
-- Write off , Unavailable
('E003/01','2021-11-21 12:00:00',4,'E003',2,NULL),
-- Write off , Unavailable
('E003/02','2021-12-10 12:00:00',4,'E003',2,NULL),
-- Ready for loan , Available ,  No Loan
('E003/03','2021-11-18 12:00:00',1,'E003',1,NULL),
-- Ready for loan , Unavailable , Overdue
('E004/01','2021-11-01 12:00:00',1,'E004',2,NULL),
-- Write off , Unavailable
('E004/02','2021-09-18 12:00:00',4,'E004',2,NULL),
-- Freeze from loan , Unavailable
('E004/03','2019-08-10 12:00:00',3,'E004',2,NULL)

-- Loan Status
INSERT INTO Loan_Status
VALUES
-- Loan request submitted
(1,'Pending'),
-- Loan request has been approved.
(2,'Approved'),
-- Loan request has been rejected.
(3,'Rejected'),
-- Item is not collected within 3 days.
(4,'Cancelled'),
-- Item has been collected.
(5,'Loaned'),
-- Item has been returned.
(6,'Returned')

-- Loan_Type
INSERT INTO Loan_Type
VALUES
-- Asset is loaned for a specific duration. User specifies the start and end date of loan during loan request.
(1,'Open Date'),
-- User wants to borrow the equipment for maximum of 3 days. No approval is required for this loan.
(2,'3-Day Loan'),
-- Asset is allocated to a staff when he joins the school and needs to return back when he ends his appointment. This loan has no due date.
(3,'End of Appointment')

-- Loan
-- 'LoanID', 'Asset_ID' , 'BorrowerID' , 'ApproverID' , LoanStatus , TypeOfLoan , 'Purpose' , 'DateRequest' , 'DateApproval' , 'DateCollection' , 'DueDate' , 'DateReturn' 
INSERT INTO Loan
VALUES
-- Loan have not approve 
('LU001E001/02','E001/02','U001',NULL,1,1,'Assignment purpose','2021-12-02 12:00:00',NULL,NULL,'2021-12-24 12:00:00',NULL),
-- Loan approved 
('LU002E001/01','E001/01','U002','A001',2,1,'Assignment purpose','2021-12-06 12:00:00','2021-12-07 12:00:00',NULL,'2021-01-24 12:00:00',NULL),
-- Loan rejected
('LU003E001/01','E001/01','U003','A004',3,1,'Assignment purpose','2021-12-06 12:00:00',NULL,NULL,NULL,NULL),
-- Loan cancelled 
('LU004E002/01','E002/01','U004','A003',4,1,'Assignment purpose','2021-12-07 12:00:00','2021-12-07 18:00:00',NULL,'2021-12-30 12:00:00',NULL),
-- Loaned overdue
('LU005E002/02','E002/02','U003',NULL,5,2,'Assignment purpose','2021-12-08 12:00:00',NULL,'2021-12-08 16:00:00','2021-12-11 16:00:00',NULL),
-- Loan returned
('LU006E004/03','E004/03','U001',NULL,6,2,'Assignment purpose','2021-12-04 12:00:00',NULL,'2021-12-04 12:00:00','2021-12-07 12:00:00','2021-12-06 12:00:00'),
-- Loan overdue
('LU007E004/01','É004/01','U004','A002',5,1,'Assignment purpose','2021-11-11 12:00:00','2021-11-11 18:00:00','2021-11-12 12:00:00','2021-11-30 12:00:00',NULL)
