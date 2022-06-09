-- for asset that has no loan
SELECT DISTINCT A.AssetID, E.Equip_Name, 
(DATEDIFF(day, A.DateOfPurchase,(FORMAT (GETDATE(), 'yyyy-MM-dd HH:mm:ss'))))
 'Number of days the asset has not been borrowed'
FROM Asset A, Equipment E, Loan L
WHERE E.EquipID = A.Equip_ID
AND A.AssetID NOT IN (SELECT A.AssetID FROM Asset A, Loan L WHERE A.AssetID = L.Asset_ID)
AND A.IsAvailable = 1
AND (DATEDIFF(day, A.DateOfPurchase,(FORMAT (GETDATE(), 'yyyy-MM-dd HH:mm:ss')))) > 90
UNION
-- for asset that has loan
SELECT A.AssetID, E.Equip_Name, 
(DATEDIFF(day, (FORMAT (GETDATE(), 'yyyy-MM-dd HH:mm:ss')),L.DueDate))
 'Number of days the asset has not been borrowed'
FROM Asset A, Equipment E, Loan L
WHERE E.EquipID = A.Equip_ID
AND A.AssetID = L.Asset_ID
AND A.IsAvailable = 1
AND (DATEDIFF(day, (FORMAT (GETDATE(), 'yyyy-MM-dd HH:mm:ss')),L.DueDate)) > 90