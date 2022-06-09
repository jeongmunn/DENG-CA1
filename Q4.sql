SELECT U.Email, L.LoanID, L.Asset_ID, E.Equip_Name, 
DATEDIFF(day, (FORMAT (GETDATE(), 'yyyy-MM-dd HH:mm:ss')),L.DueDate) 'Days Overdue'
FROM Loan L, Asset A, Equipment E, Users U
WHERE L.BorrowerID = U.UserID
AND L.Asset_ID = A.AssetID
AND A.Equip_ID = E.EquipID
AND L.DueDate IS NOT NULL AND L.DueDate > (FORMAT (GETDATE(), 'yyyy-MM-dd HH:mm:ss'))
AND L.DateOfReturn IS NULL ;