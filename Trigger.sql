CREATE TRIGGER ReciptContentCreate
   ON  ReciptContent
   AFTER INSERT,DELETE,UPDATE
AS 
BEGIN
    UPDATE Recipts SET TotalPrice=(SELECT SUM(price) FROM ReciptContent WHERE Recipts.Id=ReciptContent.ReciptId GROUP BY ReciptId)
END