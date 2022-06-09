SELECT E.Equip_Name 'Equipment', A.AssetID, 
CAST(CASE WHEN A.IsAvailable = 1 THEN 'Yes' ELSE 'No' END AS VARCHAR(3)) 'Availability',
ISNULL(CONVERT(VARCHAR(20),A.DateOfAvailability,120),'Not Applicable') 'Next Availability'
FROM Asset A, Equipment E 
WHERE A.Equip_ID = E.EquipID 
AND A.Equip_ID = 'E001' 
AND A.AssetStatus = 1;
