SELECT LoanID, DateOfCollection 'Collection Date', 
ISNULL(CONVERT(VARCHAR(20),DueDate,120),'No Due Date') 'Due Date'
FROM Loan
WHERE BorrowerID = 'U004'
AND LoanStatus = 5 ;