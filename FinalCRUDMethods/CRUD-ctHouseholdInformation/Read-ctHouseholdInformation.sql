/*============================
Description: This script is used to read the ctHouseholdInformation info and read the data to corresponding columns.

Author: Bailey Strum

Date: 12/6/16  --- 1:56pm

Change History:

==============================*/

USE communityThriveDB;
GO
CREATE PROCEDURE sp_ReadHouseholdInformation
	
	@householdInformationID int,
	@familyID int,
	@householdIncome int,
	@isEmployed bit

AS
BEGIN 
	SET NOCOUNT ON;

	DECLARE @v_error VARCHAR(255),
	@v_errorNo INT

	BEGIN TRY

		SELECT @householdInformationID,familyID,householdIncome,isEmployed
		FROM ctHouseholdInformation
		WHERE @householdInformationID = householdInformationID or familyID = @familyID

	END TRY
	BEGIN CATCH 

		SELECT @v_error = ERROR_MESSAGE()
		SELECT @v_errorNo = ERROR_NUMBER()

		RAISERROR('Database error occured %s',16,1,@v_error)
		RETURN -20000

	END CATCH
END
GO