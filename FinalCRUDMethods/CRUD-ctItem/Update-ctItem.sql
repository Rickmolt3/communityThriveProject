/*============================
Description: This script is used to update the ctItem info and add the data to corresponding columns.

Author: Bailey Strum

Date: 12/6/16  --- 2:04pm

Change History:

==============================*/

USE communityThriveDB;
GO
CREATE PROCEDURE sp_UpdateItem
--ALTER PROCEDURE sp_UpdateItem
	@itemID int,
	@itemName varchar(255),
	@itemPrice int,
	@itemDescription varchar(255),
	@itemUPC int,
	@iventoryID int,
	@categoryID int

AS
BEGIN 
	SET NOCOUNT ON;

	DECLARE @v_error VARCHAR(255),
	@v_errorNo INT

	BEGIN TRY

		UPDATE ctItem
		SET  
			itemName = @itemName, 
			itemPrice = @itemPrice, 
			itemDescription = @itemDescription, 
			itemUPC = @itemUPC, 
			iventoryID = @iventoryID, 
			categoryID = @categoryID
		WHERE itemID = @itemID


	END TRY
	BEGIN CATCH 

		SELECT @v_error = ERROR_MESSAGE()
		SELECT @v_errorNo = ERROR_NUMBER()

		RAISERROR('Database error occured %s',16,1,@v_error)
		RETURN -20000

	END CATCH
END
GO