/*============================
Description: This script is used to update the ctCategory info and add the data to corresponding columns.

Author: Bailey Strum

Date: 12/6/16  --- 2:04pm

Change History:

==============================*/

USE communityThriveDB;
GO
CREATE PROCEDURE sp_UpdateCategory
	@categoryID int,
	@dateAdded datetime,
	@parentID int,
	@isUserDefined bit,
	@isDeleted bit,
	@catDescription varchar(500)
AS
BEGIN 
	SET NOCOUNT ON;

	DECLARE @v_error VARCHAR(255),
	@v_errorNo INT

	BEGIN TRY

		UPDATE ctCategory
		SET @parentID = parentID, @isUserDefined = isUserDefined,  @isDeleted = isDeleted, @catDescription = catDescription
		WHERE @categoryID = categoryID or @dateAdded = dateAdded

	END TRY
	BEGIN CATCH 

		SELECT @v_error = ERROR_MESSAGE()
		SELECT @v_errorNo = ERROR_NUMBER()

		RAISERROR('Database error occured %s',16,1,@v_error)
		RETURN -20000

	END CATCH
END
GO