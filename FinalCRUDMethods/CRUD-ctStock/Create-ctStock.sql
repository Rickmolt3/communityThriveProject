/*============================
Description: This script is used to generate the ctStock info and add the data to corresponding columns.

Author: Bailey Strum

Date: 12/6/16  --- 4:17pm

Change History:

==============================*/

USE communityThriveDB;
GO
CREATE PROCEDURE sp_CreateStock
	@stockID int,
	@itemID int,
	@quantity int,
	@locationCode varchar(50),
	@categoryID int,
	@inventoryID int

AS
BEGIN 
	SET NOCOUNT ON;

	DECLARE @v_error VARCHAR(255),
	@v_errorNo INT

	BEGIN TRY

		INSERT ctStock(stockID,itemID,quantity,locationCode,categoryID,inventoryID)
		VALUES (@stockID,@itemID,@quantity,@locationCode,@categoryID,@inventoryID)

	END TRY
	BEGIN CATCH 

		SELECT @v_error = ERROR_MESSAGE()
		SELECT @v_errorNo = ERROR_NUMBER()

		RAISERROR('Database error occured %s',16,1,@v_error)
		RETURN -20000

	END CATCH
END
GO