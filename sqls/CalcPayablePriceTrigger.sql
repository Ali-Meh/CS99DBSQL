CREATE TRIGGER PayablePriceTriggerCreate
   ON  Recipts
   AFTER UPDATE
AS 
BEGIN
    UPDATE Recipts SET PayablePrice=(TotalPrice-(SELECT ISNULL((SELECT Amount FROM Coupons WHERE Coupons.Id=Recipts.CouponId), 0)))
END




