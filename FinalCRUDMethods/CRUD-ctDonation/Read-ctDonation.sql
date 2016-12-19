/*============================
Description: This script is used to read the ctDonation info and read the data to corresponding columns.

Author: Bailey Strum

Date: 12/6/16  --- 1:56pm

Change History:

==============================*/

USE communityThriveDB;
GO
CREATE PROCEDURE sp_ReadDonation
	
	@donationID int,
	@userID int,
	@dateSubmitted datetime,
	@describe nvarchar(max),
	@notes nvarchar(max),
	@eventID int
	

AS
BEGIN 
	SET NOCOUNT ON;

	DECLARE @v_error VARCHAR(255),
	@v_errorNo INT

	BEGIN TRY

		SELECT donationID,userID,dateSubmitted,describe,notes,eventID
		FROM ctDonation
		WHERE donationID = @donationID or @userID = userID or @eventID = eventID or dateSubmitted = @dateSubmitted

	END TRY
	BEGIN CATCH 

		SELECT @v_error = ERROR_MESSAGE()
		SELECT @v_errorNo = ERROR_NUMBER()

		RAISERROR('Database error occured %s',16,1,@v_error)
		RETURN -20000

	END CATCH
END
GO