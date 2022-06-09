SELECT C.Category, COUNT(A.AssetID) 'Number Of Assets'
FROM Equipment E, Asset A, Category C
WHERE A.Equip_ID = E.EquipID
AND C.CatNo = E.Category
AND A.AssetStatus NOT IN (4)
GROUP BY C.Category;