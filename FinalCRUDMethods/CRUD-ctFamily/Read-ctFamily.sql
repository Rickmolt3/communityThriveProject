/*============================
Description: This script is used to read the ctFamily info and read the data to corresponding columns.

Author: Bailey Strum

Date: 12/6/16  --- 1:56pm

Change History:

==============================*/

USE communityThriveDB;
GO
CREATE PROCEDURE sp_ReadFamily
	
	@familyID int,
	@recipientID int,
	@gender int,
	@age int,
	@isSpouse bit

AS
BEGIN 
	SET NOCOUNT ON;

	DECLARE @v_error VARCHAR(255),
	@v_errorNo INT

	BEGIN TRY

		SELECT familyID,recipientID,gender,age,isSpouse
		FROM ctFamily
		WHERE @familyID = familyID or recipientID = @recipientID

	END TRY
	BEGIN CATCH 

		SELECT @v_error = ERROR_MESSAGE()
		SELECT @v_errorNo = ERROR_NUMBER()

		RAISERROR('Database error occured %s',16,1,@v_error)
		RETURN -20000

	END CATCH
END
GO