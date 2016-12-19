/*============================
Description: This script is used to generate the ctHouseholdInformation info and add the data to corresponding columns.

Author: Bailey Strum

Date: 12/6/16  --- 2:57pm

Change History:

==============================*/

USE communityThriveDB;
GO
CREATE PROCEDURE sp_CreateHouseholdInformation
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

		INSERT ctHouseholdInformation(householdInformationID,familyID,householdIncome,isEmployed)
		VALUES (@householdInformationID,@householdIncome,@familyID,@householdIncome,@isEmployed)

	END TRY
	BEGIN CATCH 

		SELECT @v_error = ERROR_MESSAGE()
		SELECT @v_errorNo = ERROR_NUMBER()

		RAISERROR('Database error occured %s',16,1,@v_error)
		RETURN -20000

	END CATCH
END
GO