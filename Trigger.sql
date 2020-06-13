
CREATE TRIGGER ReciptContentCreate
ON ReciptContent
AFTER INSERT,DELETE
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE Recipts Set 

	Recipts.TotalPrice=content.totalprice
	FROM (
		SELECT SUM(price) as totalprice,ReciptId
		FROM ReciptContent) AS content
	WHERE 
		content.ReciptId = Recipts.Id
END