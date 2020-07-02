CREATE TRIGGER TotalPriceTriggerCreate
   ON ReciptContent
   AFTER INSERT,DELETE,UPDATE
AS 
BEGIN
    UPDATE Recipts SET TotalPrice=(SELECT SUM(price*Count) FROM ReciptContent WHERE Recipts.Id=ReciptContent.ReciptId GROUP BY ReciptId)
END