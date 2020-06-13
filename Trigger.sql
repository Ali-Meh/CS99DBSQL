
CREATE TRIGGER ReciptContentCreate
ON ReciptContent
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE Recipts Set 
	TotalPrice=Select
END