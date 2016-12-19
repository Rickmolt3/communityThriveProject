/*============================
Description: This script is used to generate the ctCompany info and add the data to corresponding columns.

Author: Bailey Strum

Date: 12/6/16  --- 1:56pm

Change History:

==============================*/

USE communityThriveDB;
GO
CREATE PROCEDURE sp_CreateCompany
	
	@companyName nvarchar(150),
	@companyDescription nvarchar(250),
	@companyLocation nvarchar(150),
	@companyDemogrpahic nvarchar(150)

AS
BEGIN 
	SET NOCOUNT ON;

	DECLARE @v_error VARCHAR(255),
	@v_errorNo INT

	BEGIN TRY

		INSERT ctCompany(companyName,companyDescription,companyLocation,companyDemographic)
		VALUES (@companyName,@companyDescription,@companyLocation,@companyDemogrpahic)

	END TRY
	BEGIN CATCH 

		SELECT @v_error = ERROR_MESSAGE()
		SELECT @v_errorNo = ERROR_NUMBER()

		RAISERROR('Database error occured %s',16,1,@v_error)
		RETURN -20000

	END CATCH
END
GO